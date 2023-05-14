data "azurerm_virtual_network" "vnet" {
  name                = var.virtual_network_name
  resource_group_name = var.resource_group_name
  count  = var.vnetpresent ? 1 : 0
}


resource "azurerm_subnet" "subnet" {

  name                = "subnet1"
  resource_group_name = (var.vnetpresent ? data.azurerm_virtual_network.vnet[0].resource_group_name : module.azurerm_virtual_network[0].resource_group_name)

  #When you are running this individual module - conditional statement if RG is already present OR new RG needs to be created
  virtual_network_name = (var.vnetpresent ? data.azurerm_virtual_network.vnet[0].name : module.azurerm_virtual_network[0].virtual_network_name)
  address_prefixes     = var.subnet_address_prefix
}
