

resource "azurerm_network_interface" "vmA" {
  name                = "nicVMA"
  location            = azurerm_resource_group.tfdemo.location
  resource_group_name = azurerm_resource_group.tfdemo.name

  ip_configuration {
    name                          = "ipA"
    subnet_id                     = azurerm_subnet.vnetA.id
    private_ip_address_allocation = "Dynamic"
  }
    tags = {
    owner = "Lory Van Eyck"
  }
}
resource "azurerm_windows_virtual_machine" "vmA" {
  name                = "VMA"
  resource_group_name = azurerm_resource_group.tfdemo.name
  location            = azurerm_resource_group.tfdemo.location
  size                = "Standard_B1s"
  admin_username      = "lvaneyck"
  admin_password      = "Azureisfantastic123"
  network_interface_ids = [
    azurerm_network_interface.vmA.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}




