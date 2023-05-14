
 #if RG is already present
data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
  count = var.rgpresent ? 1 : 0
}

 #if new RG is needed
module "azurerm_resource_group" {
  source = "../azurerm_resource_group"
  count = var.rgpresent ? 0 : 1
}


resource "azurerm_availability_set" "availability_set" {
  name = "availabiltyset1"

  #When you are running this individual module - for creating AS in existing RG
  location            = (var.rgpresent ? data.azurerm_resource_group.rg[0].location : module.azurerm_resource_group[0].resource_group_location)
  resource_group_name = (var.rgpresent ? data.azurerm_resource_group.rg[0].name : module.azurerm_resource_group[0].resource_group_name)

}
