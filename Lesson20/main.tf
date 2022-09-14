# Создайте main.tf для того, чтобы задеплоить виртуальную машину Azure со следующими параметрами:
# location:  West Europe (Zone 1)
# source: "hashicorp/azurerm"
# Operating system: Windows 10 Pro
# Size: DS1_v2
# Network: 10.0.128.0/24

terraform {
  required_version = ">=0.12"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "stas-terraform" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

resource "azurerm_virtual_network" "terraform-network" {
  name                = "terraform-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.stas-terraform.location
  resource_group_name = azurerm_resource_group.stas-terraform.name
}

resource "azurerm_subnet" "terraform-subnet" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.stas-terraform.name
  virtual_network_name = azurerm_virtual_network.terraform-network.name
  address_prefixes     = ["10.0.128.0/24"]
}

# Create public IPs
resource "azurerm_public_ip" "stas-terraform-ip" {
  name                = "TerraformPublicIP"
  location            = azurerm_resource_group.stas-terraform.location
  resource_group_name = azurerm_resource_group.stas-terraform.name
  allocation_method   = "Dynamic"
}

# Create Network Security Group and rule
resource "azurerm_network_security_group" "stas-terraform-nsg" {
  name                = "TerraformNetworkSecurityGroup"
  location            = azurerm_resource_group.stas-terraform.location
  resource_group_name = azurerm_resource_group.stas-terraform.name

  security_rule {
    name                       = "RDP"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Create network interface
resource "azurerm_network_interface" "stas-terraform-nic" {
  name                = "TerraformNIC"
  location            = azurerm_resource_group.stas-terraform.location
  resource_group_name = azurerm_resource_group.stas-terraform.name

  ip_configuration {
    name                          = "terraform-nic-configuration"
    subnet_id                     = azurerm_subnet.terraform-subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.stas-terraform-ip.id
  }
}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = azurerm_network_interface.stas-terraform-nic.id
  network_security_group_id = azurerm_network_security_group.stas-terraform-nsg.id
}

resource "azurerm_windows_virtual_machine" "stas-terraform" {
  name                = "Terraform-Win"
  location            = azurerm_resource_group.stas-terraform.location
  resource_group_name = azurerm_resource_group.stas-terraform.name
  size                = "Standard_DS1_v2"
  admin_username      = "adminwin"
  admin_password      = "P@ssw0rd"
  network_interface_ids = [
    azurerm_network_interface.stas-terraform-nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsDesktop"
    offer     = "Windows-10"
    sku       = "20h1-pro"
    version   = "latest"
  }
}