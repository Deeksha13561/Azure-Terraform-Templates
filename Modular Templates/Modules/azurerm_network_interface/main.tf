module "azurerm_tags" {
  source = "../azurerm_tags"
  resource_ids = [azurerm_network_interface.NIC.id]
  depends_on = [azurerm_network_interface.NIC]
}

module "azurerm_subnet" {
  source = "../azurerm_subnet"
  count  = var.subnetpresent ? 0 : 1
}

data "azurerm_subnet" "snet" {
  name                 = var.subnet_name
  virtual_network_name = var.virtual_network_name
  resource_group_name  = data.azurerm_resource_group.rg[0].name
  count                = var.subnetpresent ? 1 : 0
}

data "azurerm_resource_group" "rg" {
  name  = var.resource_group_name
  count = var.rgpresent ? 1 : 0
}

module "azurerm_resource_group" {
  source = "../azurerm_resource_group"
  count  = var.rgpresent ? 0 : 1
}

#IP address
module "azurerm_public_ip" {
  source = "../azurerm_public_ip"
}

resource "azurerm_network_interface" "NIC" {
  name                = var.network_interface_name
  location            = (var.subnetpresent ? data.azurerm_resource_group.rg[0].location : module.azurerm_resource_group[0].resource_group_location)
  resource_group_name = (var.subnetpresent ? data.azurerm_resource_group.rg[0].name : module.azurerm_resource_group[0].resource_group_name)

  ip_configuration {
    name                          = var.nic_ip_configuration_name
    subnet_id                     = (var.subnetpresent ? data.azurerm_subnet.snet[0].id : module.azurerm_subnet[0].subnetid)
    private_ip_address_allocation = var.private_ip_address_allocation
  
  }

}



