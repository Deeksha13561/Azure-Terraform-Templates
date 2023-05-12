data "azurerm_virtual_network" "vnet" {
  name                = var.virtual_network_name
  resource_group_name = var.resource_group_name
  count  = var.vnetpresent ? 1 : 0
}

#if new SQL Server is to be created
module "azurerm_virtual_network" {
  source = "../azurerm_virtual_network"
  count  = var.vnetpresent ? 0 : 1
}

resource "azurerm_subnet" "subnet" {

  name                = "subnet-${lower(var.azurerm_application_name)}-${lower(var.azurerm_environment_name)}-${lower(var.azurerm_region_name)}-${var.azurerm_resource_group_iteration_number}"
  resource_group_name = (var.vnetpresent ? data.azurerm_virtual_network.vnet[0].resource_group_name : module.azurerm_virtual_network[0].resource_group_name)

  #When you are running this individual module - conditional statement if RG is already present OR new RG needs to be created
  virtual_network_name = (var.vnetpresent ? data.azurerm_virtual_network.vnet[0].name : module.azurerm_virtual_network[0].virtual_network_name)
  address_prefixes     = var.subnet_address_prefix
}
