
##########
## Core
resource "azurerm_postgresql_flexible_server" "this" {
  name                         = var.name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = var.pg_version
  delegated_subnet_id          = azurerm_subnet.this.id
  private_dns_zone_id          = azurerm_private_dns_zone.this.id
  administrator_login          = var.administrator_login
  administrator_password       = random_password.this.result
  sku_name                     = var.sku_name
  storage_mb                   = var.storage_mb
  backup_retention_days        = var.backup_retention_days
  geo_redundant_backup_enabled = var.geo_redundant_backup_enabled
  maintenance_window {
    day_of_week  = var.maintenance_window.day_of_week
    start_hour   = var.maintenance_window.start_hour
    start_minute = var.maintenance_window.start_minute
  }
  zone = var.zone

  depends_on = [azurerm_private_dns_zone_virtual_network_link.dns_net, azurerm_private_dns_zone_virtual_network_link.dns_pipe_net]
}

resource "azurerm_postgresql_flexible_server_configuration" "this" {
  for_each = var.postgresql_config

  server_id = azurerm_postgresql_flexible_server.this.id
  name      = each.key
  value     = each.value
}

resource "azurerm_management_lock" "this" {
  count      = var.instance_lock ? 1 : 0
  name       = format("%s-mg-lock", azurerm_postgresql_flexible_server.this.name)
  scope      = azurerm_postgresql_flexible_server.this.id
  lock_level = "CanNotDelete"
  notes      = "This is a security mechanism to prevent accidental deletion. Deleting a postgresql cluster drops all databases and also PITR backups."
}

###########
### Network

resource "azurerm_subnet" "this" {
  name                 = format("%s-snet", var.subnet_name_prefix ? var.subnet_name_prefix : var.name)
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = var.subnet_address_prefixes
  service_endpoints    = ["Microsoft.Storage"]

  delegation {
    name = "fs"
    service_delegation {
      name = "Microsoft.DBforPostgreSQL/flexibleServers"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
      ]
    }
  }
}

resource "azurerm_private_dns_zone" "this" {
  name                = format("%s.privatelink.postgres.database.azure.com", var.private_dns_zone_name_prefix ? var.private_dns_zone_name_prefix : var.name)
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "dns_net" {
  name                  = format("%s-zdns-nl", azurerm_private_dns_zone.this.name)
  private_dns_zone_name = azurerm_private_dns_zone.this.name
  resource_group_name   = var.resource_group_name
  virtual_network_id    = var.virtual_network_id
}

resource "azurerm_private_dns_zone_virtual_network_link" "dns_pipe_net" {
  name                  = format("%s-zdns-nl-pipe-net", azurerm_private_dns_zone.this.name)
  private_dns_zone_name = azurerm_private_dns_zone.this.name
  resource_group_name   = var.resource_group_name
  virtual_network_id    = var.virtual_network_pipeline_id
}

resource "azurerm_role_assignment" "contributors" {
  for_each = toset(var.contributors)

  principal_id         = each.key
  role_definition_name = "Contributor"
  scope                = azurerm_postgresql_flexible_server.this.id
}

###########
### Secrets

resource "random_password" "this" {
  length  = 32
  special = false
}

# Create Key Vault for user and services secrets
resource "azurerm_key_vault" "this" {
  name                        = format("%s-kv", var.keyvault_name_prefix ? var.keyvault_name_prefix : var.name)
  location                    = var.location
  resource_group_name         = var.resource_group_name
  sku_name                    = "standard"
  tenant_id                   = var.tenant_id
  soft_delete_retention_days  = 7
  enable_rbac_authorization   = true
  enabled_for_disk_encryption = true
}

resource "azurerm_key_vault_access_policy" "terraform_on_kv" {

  for_each = toset(var.terraformers_on_keyvault)

  key_vault_id = azurerm_key_vault.this.id
  tenant_id    = var.tenant_id
  object_id    = each.key

  key_permissions = [
    "Get",
    "Create",
  ]

  secret_permissions = [
    "Delete",
    "Get",
    "Purge",
    "Recover",
    "Set",
  ]
}

resource "azurerm_key_vault_access_policy" "user_on_kv" {

  for_each = toset(var.users_on_keyvault)

  key_vault_id = azurerm_key_vault.this.id
  tenant_id    = var.tenant_id
  object_id    = each.key

  secret_permissions = [
    "Backup",
    "Delete",
    "Get",
    "List",
    "Purge",
    "Recover",
    "Restore",
    "Set",
  ]
}

resource "azurerm_key_vault_secret" "pg_database_pghost" {
  name         = "PGHOST"
  value        = azurerm_postgresql_flexible_server.this.fqdn
  key_vault_id = azurerm_key_vault.this.id

  depends_on = [
    azurerm_key_vault_access_policy.terraform_on_kv,
  ]
}

resource "azurerm_key_vault_secret" "pg_database_pgpassword" {
  name         = "PGPASSWORD"
  value        = azurerm_postgresql_flexible_server.this.administrator_password
  key_vault_id = azurerm_key_vault.this.id

  depends_on = [
    azurerm_key_vault_access_policy.terraform_on_kv,
  ]
}

resource "azurerm_key_vault_secret" "pg_database_pguser" {
  name         = "PGUSER"
  value        = azurerm_postgresql_flexible_server.this.administrator_login
  key_vault_id = azurerm_key_vault.this.id

  depends_on = [
    azurerm_key_vault_access_policy.terraform_on_kv,
  ]
}

resource "azurerm_key_vault_secret" "pg_database_pgport" {
  name         = "PGPORT"
  value        = "5432"
  key_vault_id = azurerm_key_vault.this.id

  depends_on = [
    azurerm_key_vault_access_policy.terraform_on_kv,
  ]
}

