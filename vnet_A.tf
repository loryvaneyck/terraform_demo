


resource "azurerm_network_security_group" "vnetA" {
  name                = "nsgA"
  location            = azurerm_resource_group.tfdemo.location
  resource_group_name = azurerm_resource_group.tfdemo.name
}

resource "azurerm_virtual_network" "vnetA" {
  name                = "VNetA"
  location            = azurerm_resource_group.tfdemo.location
  resource_group_name = azurerm_resource_group.tfdemo.name
  address_space       = ["10.0.0.0/16"]
  tags = {
    owner = "Lory Van Eyck"
  }
}

resource "azurerm_subnet" "vnetA" {
  name                 = "sbnA1"
  resource_group_name  = azurerm_resource_group.tfdemo.name
  virtual_network_name = azurerm_virtual_network.vnetA.name
  address_prefixes     = ["10.0.1.0/24"]

}

resource "azurerm_subnet_network_security_group_association" "vnetA" {
  subnet_id                 = azurerm_subnet.vnetA.id
  network_security_group_id = azurerm_network_security_group.vnetA.id
}

######## Bastion

resource "azurerm_subnet" "bastionA" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.tfdemo.name
  virtual_network_name = azurerm_virtual_network.vnetA.name
  address_prefixes     = ["10.0.2.0/27"]
}

resource "azurerm_public_ip" "bastionA" {
  name                = "bastionAIP"
  location            = azurerm_resource_group.tfdemo.location
  resource_group_name = azurerm_resource_group.tfdemo.name
  allocation_method   = "Static"
  sku                 = "Standard"
}