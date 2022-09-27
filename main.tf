resource "random_password" "this" {
  length  = 12
  special = false
}

resource "azurerm_subnet" "this" {
  name                 = var.subnet_name
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
  name                = var.private_dns_zone_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "dns_net" {
  name                  = format("%s-%s", var.name, var.virtual_network_name)
  private_dns_zone_name = azurerm_private_dns_zone.this.name
  resource_group_name   = var.resource_group_name
  virtual_network_id    = var.virtual_network_id
}

resource "azurerm_private_dns_zone_virtual_network_link" "dns_pipe_net" {
  name                  = format("%s-dns-pipe-net", var.name)
  private_dns_zone_name = azurerm_private_dns_zone.this.name
  resource_group_name   = var.resource_group_name
  virtual_network_id    = var.virtual_network_pipeline_id
}


resource "azurerm_postgresql_flexible_server" "this" {
  name                   = var.name
  resource_group_name    = var.resource_group_name
  location               = var.location
  version                = var.pg_version
  delegated_subnet_id    = azurerm_subnet.this.id
  private_dns_zone_id    = azurerm_private_dns_zone.this.id
  administrator_login    = var.administrator_login
  administrator_password = random_password.this.result

  sku_name   = var.sku_name
  storage_mb = var.storage_mb

  backup_retention_days = var.backup_retention_days
  maintenance_window {
    day_of_week  = var.maintenance_window.day_of_week
    start_hour   = var.maintenance_window.start_hour
    start_minute = var.maintenance_window.start_minute
  }
}

resource "azurerm_postgresql_flexible_server_configuration" "this" {
  for_each = var.postgresql_config

  server_id = azurerm_postgresql_flexible_server.this.id
  name      = each.key
  value     = each.value
}

resource "azurerm_management_lock" "this" {
  name       = format("%s-lock", azurerm_postgresql_flexible_server.this.name)
  scope      = azurerm_postgresql_flexible_server.this.id
  lock_level = "CanNotDelete"
  notes      = "This is a security mechanism to prevent accidental deletion. Deleting a postgresql cluster drops all databases and also PITR backups."
}
