resource "azurerm_network_interface" "vmB" {
  name                = "nicVMB"
  location            = azurerm_resource_group.tfdemo.location
  resource_group_name = azurerm_resource_group.tfdemo.name

  ip_configuration {
    name                          = "ipB"
    subnet_id                     = azurerm_subnet.vnetB.id
    private_ip_address_allocation = "Dynamic"
  }
    tags = {
    owner = "Lory Van Eyck"
  }
}

resource "azurerm_linux_virtual_machine" "vmB" {
  name                = "example-machine"
  resource_group_name = azurerm_resource_group.tfdemo.name
  location            = azurerm_resource_group.tfdemo.location
  size                = "Standard_B1s"
  admin_username      = "lvaneyck"
  admin_password      = "Azureisfantastic123"
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.vmB.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}