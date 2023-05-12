module "azurerm_tags" {
  source = "../azurerm_tags"
  resource_ids = [azurerm_virtual_network.vnet.id]
  depends_on = [azurerm_virtual_network.vnet]
}

 #if new RG is needed
module "azurerm_resource_group" {
  source = "../azurerm_resource_group"
  count  = var.rgpresent ? 0 : 1
}

 #if RG is already present
data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
  count  = var.rgpresent ? 1 : 0
}

resource "azurerm_virtual_network" "vnet" {
  name = "vnet-${lower(var.azurerm_application_name)}-${lower(var.azurerm_environment_name)}-${lower(var.azurerm_region_name)}-${var.azurerm_resource_group_iteration_number}"

  #When you are running this individual module - for creating AS in existing RG
  location            = (var.rgpresent ? data.azurerm_resource_group.rg[0].location : module.azurerm_resource_group[0].resource_group_location)
  resource_group_name = (var.rgpresent ? data.azurerm_resource_group.rg[0].name : module.azurerm_resource_group[0].resource_group_name)
  address_space       = var.virtual_network_address_space
}
