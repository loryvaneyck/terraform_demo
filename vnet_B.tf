resource "azurerm_network_security_group" "vnetB" {
  name                = "nsgB"
  location            = azurerm_resource_group.tfdemo.location
  resource_group_name = azurerm_resource_group.tfdemo.name
}

resource "azurerm_virtual_network" "vnetB" {
  name                = "vnetB"
  location            = azurerm_resource_group.tfdemo.location
  resource_group_name = azurerm_resource_group.tfdemo.name
  address_space       = ["192.168.0.0/16"]
  tags = {
    owner = "Lory Van Eyck"
  }
}

resource "azurerm_subnet" "vnetB" {
  name                 = "sbnA1"
  resource_group_name  = azurerm_resource_group.tfdemo.name
  virtual_network_name = azurerm_virtual_network.vnetB.name
  address_prefixes     = ["192.168.1.0/24"]

}

resource "azurerm_subnet_network_security_group_association" "vnetB" {
  subnet_id                 = azurerm_subnet.vnetB.id
  network_security_group_id = azurerm_network_security_group.vnetB.id
}
