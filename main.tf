resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.network_Rg_location
  resource_group_name = var.network_Rg_name
  address_space       = var.vnet_aspace
}

resource "azurerm_subnet" "subnet1" {
  name                 = var.subnet1
  resource_group_name  = var.network_Rg_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet1_aspace
}

resource "azurerm_subnet" "subnet2" {
  name                 = var.subnet2
  resource_group_name  = var.network_Rg_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet2_aspace
}

resource "azurerm_network_security_group" "nsg1" {
  name                = var.nsg1
  location            = var.network_Rg_location
  resource_group_name = var.network_Rg_name

  security_rule {
    name                       = "rule1"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_security_group" "nsg2" {
  name                = var.nsg2
  location            = var.network_Rg_location
  resource_group_name = var.network_Rg_name

  security_rule {
    name                       = "rule1"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "rule2"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "5985"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "nsg1asso" {
  subnet_id                 = azurerm_subnet.subnet1.id
  network_security_group_id = azurerm_network_security_group.nsg1.id
}

resource "azurerm_subnet_network_security_group_association" "nsg2asso" {
  subnet_id                 = azurerm_subnet.subnet2.id
  network_security_group_id = azurerm_network_security_group.nsg2.id
}


