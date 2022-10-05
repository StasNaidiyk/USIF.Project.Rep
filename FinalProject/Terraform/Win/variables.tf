variable "resource_group_location" {
  default     = "westeurope"
  description = "Location of the resource group."
}

variable "resource_group_name_prefix" {
  default     = "naidiyk-terraform-rg"
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
}

variable "firerwall_ip" {
  default = "3.120.117.202"
  description = "azurerm_mysql_firewall_rule"  
}
