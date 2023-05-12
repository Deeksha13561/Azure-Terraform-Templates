module "azurerm_tags" {
  source = "../azurerm_tags"
  resource_ids = [azurerm_resource_group.rg.id]
  depends_on = [azurerm_resource_group.rg]
}


resource "azurerm_resource_group" "rg" {
  name     = "RG-${lower(var.azurerm_application_name)}-${lower(var.azurerm_environment_name)}-${lower(var.azurerm_region_name)}-${var.azurerm_resource_group_iteration_number}"
  location = var.resource_group_location
 
}




