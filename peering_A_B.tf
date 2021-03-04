resource "azurerm_virtual_network_peering" "peeringAB" {
  name                      = "peerAtoB"
  resource_group_name       = azurerm_resource_group.tfdemo.name
  virtual_network_name      = azurerm_virtual_network.vnetA.name
  remote_virtual_network_id = azurerm_virtual_network.vnetB.id
}

resource "azurerm_virtual_network_peering" "peeringBA" {
  name                      = "peer2to1"
  resource_group_name       = azurerm_resource_group.tfdemo.name
  virtual_network_name      = azurerm_virtual_network.vnetB.name
  remote_virtual_network_id = azurerm_virtual_network.vnetA.id
}