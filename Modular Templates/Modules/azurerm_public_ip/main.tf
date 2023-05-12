module "azurerm_tags" {
  source = "../azurerm_tags"
  resource_ids = [azurerm_public_ip.pi1.id]
  depends_on = [azurerm_public_ip.pi1]
}

#if RG is already present
data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
  count = var.rgpresent ? 1 : 0
}

# #if new RG is needed
module "azurerm_resource_group" {
  source = "../azurerm_resource_group"
  count = var.rgpresent ? 0 : 1
}

resource "azurerm_public_ip" "pi1" {
   name = "pip-${lower(var.azurerm_application_name)}-${lower(var.azurerm_environment_name)}-${lower(var.azurerm_region_name)}-${var.azurerm_resource_group_iteration_number}"

  #When you are running this individual module - for creating AS in existing RG
  location            = (var.rgpresent ? data.azurerm_resource_group.rg[0].location : module.azurerm_resource_group[0].resource_group_location)
  resource_group_name = (var.rgpresent ? data.azurerm_resource_group.rg[0].name : module.azurerm_resource_group[0].resource_group_name)
  allocation_method   = var.pip_allocation_method
}