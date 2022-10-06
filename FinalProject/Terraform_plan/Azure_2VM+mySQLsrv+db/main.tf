resource "random_pet" "rg_name" {
  prefix = var.resource_group_name_prefix
}

resource "azurerm_resource_group" "naidiyk-terraform" {
  location = var.resource_group_location
  name     = random_pet.rg_name.id
}

# Create Server mySQL
resource "azurerm_mysql_server" "testmysql" {
  name                = "naidiyk-mysql-server"
  location            = azurerm_resource_group.naidiyk-terraform.location
  resource_group_name = azurerm_resource_group.naidiyk-terraform.name

  administrator_login          = "adminmysql"
  administrator_login_password = "P@ssDBtest1"

  sku_name   = "GP_Gen5_2"
  storage_mb = 5120
  version    = "8.0"

    geo_redundant_backup_enabled = false
  backup_retention_days        = 7
  ssl_enforcement_enabled      = true
}

# Create DB mySQL
resource "azurerm_mysql_database" "testdb" {
  name                = "test-db"
  resource_group_name = azurerm_resource_group.naidiyk-terraform.name
  server_name         = azurerm_mysql_server.testmysql.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
  
}

# Create Firewall Rule for DB
resource "azurerm_mysql_firewall_rule" "ruledb" {
  name                = "firewall-rule-db"
  resource_group_name = azurerm_resource_group.naidiyk-terraform.name
  server_name         = azurerm_mysql_server.testmysql.name
  start_ip_address    = var.firerwall_ip
  end_ip_address      = var.firerwall_ip
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

# Create Win public IPs
resource "azurerm_public_ip" "win_terraform_public_ip" {
  name                = "Win-terraform-PublicIP"
  location            = azurerm_resource_group.naidiyk-terraform.location
  resource_group_name = azurerm_resource_group.naidiyk-terraform.name
  allocation_method   = "Dynamic"
}

# Create Ubuntu public IPs
resource "azurerm_public_ip" "ubuntu_terraform_public_ip" {
  name                = "Ubuntu-terraform-PublicIP"
  location            = azurerm_resource_group.naidiyk-terraform.location
  resource_group_name = azurerm_resource_group.naidiyk-terraform.name
  allocation_method   = "Dynamic"
}

# Create Network Security Group and rules
resource "azurerm_network_security_group" "naidiyk_terraform_nsg" {
  name                = "terraformNetworkSecurityGroup"
  location            = azurerm_resource_group.naidiyk-terraform.location
  resource_group_name = azurerm_resource_group.naidiyk-terraform.name

  security_rule {
    name                       = "SSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "RDP"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Create network interface WindowsOS
resource "azurerm_network_interface" "naidiyk_terraform_win_nic" {
  name                = "TerraformWinNIC"
  location            = azurerm_resource_group.naidiyk-terraform.location
  resource_group_name = azurerm_resource_group.naidiyk-terraform.name

  ip_configuration {
    name                          = "terraform_win_nic_configuration"
    subnet_id                     = azurerm_subnet.naidiyk_terraform_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.win_terraform_public_ip.id
  }
}

# Create network interface LinuxOS
resource "azurerm_network_interface" "naidiyk_terraform_ubuntu_nic" {
  name                = "TerraformUbuntuNIC"
  location            = azurerm_resource_group.naidiyk-terraform.location
  resource_group_name = azurerm_resource_group.naidiyk-terraform.name

  ip_configuration {
    name                          = "terraform_ubuntu_nic_configuration"
    subnet_id                     = azurerm_subnet.naidiyk_terraform_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.ubuntu_terraform_public_ip.id
  }
}

# Connect the security group to the Windows network interface
resource "azurerm_network_interface_security_group_association" "example_1" {
  network_interface_id      = azurerm_network_interface.naidiyk_terraform_win_nic.id
  network_security_group_id = azurerm_network_security_group.naidiyk_terraform_nsg.id
}

# Connect the security group to the Linux network interface
resource "azurerm_network_interface_security_group_association" "example_2" {
  network_interface_id      = azurerm_network_interface.naidiyk_terraform_ubuntu_nic.id
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

# Create virtual machine Ubuntu
resource "azurerm_linux_virtual_machine" "naidiyk_terraform_ubuntu" {
  name                  = "TerraformUbuntu"
  location              = azurerm_resource_group.naidiyk-terraform.location
  resource_group_name   = azurerm_resource_group.naidiyk-terraform.name
  network_interface_ids = [azurerm_network_interface.naidiyk_terraform_ubuntu_nic.id]
  size                  = "Standard_DS1_v2"

  os_disk {
    name                 = "UbuntuOsDisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "20.04.202209200"
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

# Create virtual machine Windows
resource "azurerm_windows_virtual_machine" "naidiyk_terraform_windows" {
  name                  = "TerraformWin"
  location              = azurerm_resource_group.naidiyk-terraform.location
  resource_group_name   = azurerm_resource_group.naidiyk-terraform.name
  network_interface_ids = [azurerm_network_interface.naidiyk_terraform_win_nic.id]
  size                  = "Standard_DS1_v2"

  os_disk {
    name                 = "WinOsDisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

  computer_name                   = "WinSrvDC2016"
  admin_username                  = "winadmin"
  admin_password                  = "$ecur!ty2022" 
  
  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.naidiyk_storage_account.primary_blob_endpoint
  }
}
