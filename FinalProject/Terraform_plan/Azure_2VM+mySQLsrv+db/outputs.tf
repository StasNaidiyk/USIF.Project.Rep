output "resource_group_name" {
  value = azurerm_resource_group.naidiyk-terraform.name
}

output "azurerm_mysql_database" {
  value = azurerm_mysql_database.testdb.server_name
}

output "azurerm_mysql_server" {
  value = azurerm_mysql_server.testmysql.name
}

output "azurerm_linux_virtual_machine" {
  value = azurerm_linux_virtual_machine.naidiyk_terraform_ubuntu.source_image_reference
}

output "azurerm_windows_virtual_machine" {
  value = azurerm_windows_virtual_machine.naidiyk_terraform_windows.source_image_reference
}

output "tls_private_key" {
  value     = tls_private_key.example_ssh.private_key_pem
  sensitive = true
}
