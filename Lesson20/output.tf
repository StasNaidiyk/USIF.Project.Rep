output "resource_group_name" {
  value = azurerm_resource_group.stas-terraform.name
}

output "azurerm_windows_virtual_machine" {
  value = azurerm_windows_virtual_machine.stas-terraform.source_image_reference
}

output "public_ip" {
  value = azurerm_public_ip.stas-terraform-ip.id
}
