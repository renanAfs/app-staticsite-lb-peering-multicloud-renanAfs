resource "azurerm_resource_group" "rg" {
  name     = "rg-staticsite-lb"
  location = "brazilsouth"
}

resource "azurerm_virtual_network" "vnet10" {
  name                = "vnet10"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_virtual_network" "vnet20" {
  name                = "vnet20"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["20.0.0.0/16"]
}

resource "azurerm_subnet" "subnet-pub" {
  name                 = "subnet1a"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet10.name
  address_prefixes     = ["10.0.1.0/24"]
}


resource "azurerm_subnet" "subnet-priv" {
  name                 = "subnet1a"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet20.name
  address_prefixes     = ["20.0.1.0/24"]
}

resource "azurerm_virtual_network_peering" "vnet-peering10" {
  name                      = "vnet-peering10"
  resource_group_name       = azurerm_resource_group.rg.name
  virtual_network_name      = azurerm_virtual_network.vnet10.name
  remote_virtual_network_id = azurerm_virtual_network.vnet20.id
}

resource "azurerm_virtual_network_peering" "vnet-peering20" {
  name                      = "vnet-peering20"
  resource_group_name       = azurerm_resource_group.rg.name
  virtual_network_name      = azurerm_virtual_network.vnet20.name
  remote_virtual_network_id = azurerm_virtual_network.vnet10.id
}

resource "azurerm_network_security_group" "nsgvm" {
  name                = "nsgvm"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  security_rule {
    name                       = "HTTP"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "FTP"
    priority                   = 1011
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "nsgsubnet1a" {
  subnet_id                 = azurerm_subnet.subnet-pub.id
  network_security_group_id = azurerm_network_security_group.nsgvm.id
}

resource "azurerm_network_security_group" "nsgvm-priv" {
  name                = "nsgvm-priv"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  security_rule {
    name                       = "Inbound-Internet-All"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "Internet"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "nsgsubnet1a" {
  subnet_id                 = azurerm_subnet.subnet-priv.id
  network_security_group_id = azurerm_network_security_group.nsgvm.id
}
