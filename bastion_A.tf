
resource "azurerm_bastion_host" "bastionA" {
  name                = "bastionA"
  location            = azurerm_resource_group.tfdemo.location
  resource_group_name = azurerm_resource_group.tfdemo.name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.bastionA.id
    public_ip_address_id = azurerm_public_ip.bastionA.id
  }
}