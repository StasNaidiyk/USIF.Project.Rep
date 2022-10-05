output "resource_group_name" {
  value = azurerm_resource_group.naidiyk-terraform.name
}

output "azurerm_linux_virtual_machine" {
  value = azurerm_linux_virtual_machine.naidiyk_terraform_ubuntu.source_image_reference
}

output "public_ip_address" {
  value = azurerm_public_ip.naidiyk_terraform_public_ip.id
}

output "tls_private_key" {
  value     = tls_private_key.example_ssh.private_key_pem
  sensitive = true
}
