output "id" {
  value = azurerm_postgresql_flexible_server.this.id
}

output "host" {
  value = "${azurerm_postgresql_flexible_server.this.name}.postgres.database.azure.com"
}

output "name" {
  value = azurerm_postgresql_flexible_server.this.name
}

output "admin_login" {
  value = azurerm_postgresql_flexible_server.this.administrator_login
}

output "admin_password" {
  sensitive = true
  value     = azurerm_postgresql_flexible_server.this.administrator_password
}

output "fqdn" {
  value = azurerm_postgresql_flexible_server.this.fqdn
}

output "key_vault_id" {
  description = "Storage Key Vault Id."
  value       = azurerm_key_vault.this.id
}
