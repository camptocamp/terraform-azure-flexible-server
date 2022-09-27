output "admin_password" {
  sensitive = true
  value     = azurerm_postgresql_flexible_server.this.administrator_password
}

output "fqdn" {
  value = azurerm_postgresql_flexible_server.this.fqdn
}
