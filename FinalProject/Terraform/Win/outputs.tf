output "resource_group_name" {
  value = azurerm_resource_group.naidiyk-terraform.name
}

output "azurerm_windows_virtual_machine" {
  value = azurerm_windows_virtual_machine.naidiyk_terraform_windows.source_image_reference
}

output "public_ip_address" {
  value = azurerm_public_ip.naidiyk_terraform_public_ip.id
}

output "azurerm_mysql_database" {
  value = azurerm_mysql_database.testdb.server_name
}

output "azurerm_mysql_server" {
  value = azurerm_mysql_server.testmysql.name
}
