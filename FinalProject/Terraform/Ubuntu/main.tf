resource "random_pet" "rg_name" {
  prefix = var.resource_group_name_prefix
}

resource "azurerm_resource_group" "naidiyk-terraform" {
  location = var.resource_group_location
  name     = random_pet.rg_name.id
}

# Create virtual network
resource "azurerm_virtual_network" "naidiyk_terraform_network" {
  name                = "terraformVnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.naidiyk-terraform.location
  resource_group_name = azurerm_resource_group.naidiyk-terraform.name
}

# Create subnet
resource "azurerm_subnet" "naidiyk_terraform_subnet" {
  name                 = "terraformSubnet"
  resource_group_name  = azurerm_resource_group.naidiyk-terraform.name
  virtual_network_name = azurerm_virtual_network.naidiyk_terraform_network.name
  address_prefixes     = ["10.0.110.0/24"]
}

# Create public IPs
resource "azurerm_public_ip" "naidiyk_terraform_public_ip" {
  name                = "terraformPublicIP"
  location            = azurerm_resource_group.naidiyk-terraform.location
  resource_group_name = azurerm_resource_group.naidiyk-terraform.name
  allocation_method   = "Dynamic"
}

# Create Network Security Group and rule
resource "azurerm_network_security_group" "naidiyk_terraform_nsg" {
  name                = "terraformNetworkSecurityGroup"
  location            = azurerm_resource_group.naidiyk-terraform.location
  resource_group_name = azurerm_resource_group.naidiyk-terraform.name

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Create network interface
resource "azurerm_network_interface" "naidiyk_terraform_nic" {
  name                = "terraformNIC"
  location            = azurerm_resource_group.naidiyk-terraform.location
  resource_group_name = azurerm_resource_group.naidiyk-terraform.name

  ip_configuration {
    name                          = "terraform_nic_configuration"
    subnet_id                     = azurerm_subnet.naidiyk_terraform_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.naidiyk_terraform_public_ip.id
  }
}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = azurerm_network_interface.naidiyk_terraform_nic.id
  network_security_group_id = azurerm_network_security_group.naidiyk_terraform_nsg.id
}

# Generate random text for a unique storage account name
resource "random_id" "random_id" {
  keepers = {
    # Generate a new ID only when a new resource group is defined
    resource_group = azurerm_resource_group.naidiyk-terraform.name
  }

  byte_length = 8
}

# Create storage account for boot diagnostics
resource "azurerm_storage_account" "naidiyk_storage_account" {
  name                     = "diag${random_id.random_id.hex}"
  location                 = azurerm_resource_group.naidiyk-terraform.location
  resource_group_name      = azurerm_resource_group.naidiyk-terraform.name
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Create (and display) an SSH key
resource "tls_private_key" "example_ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create virtual machine
resource "azurerm_linux_virtual_machine" "naidiyk_terraform_ubuntu" {
  name                  = "TerraformUbuntu"
  location              = azurerm_resource_group.naidiyk-terraform.location
  resource_group_name   = azurerm_resource_group.naidiyk-terraform.name
  network_interface_ids = [azurerm_network_interface.naidiyk_terraform_nic.id]
  size                  = "Standard_DS1_v2"

  os_disk {
    name                 = "UbuntuOsDisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "20.04-LTS"
    version   = "latest"
  }

  computer_name                   = "Ubuntu2004"
  admin_username                  = "useradmin"
  disable_password_authentication = true

  admin_ssh_key {
    username   = "useradmin"
    public_key = tls_private_key.example_ssh.public_key_openssh
  }

  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.naidiyk_storage_account.primary_blob_endpoint
  }
}
