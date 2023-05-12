output "network_interface_id" {
    value =  azurerm_network_interface.NIC.id
}

output "resource_group_location" {
    value =  azurerm_network_interface.NIC.location
}

output "resource_group_name" {
    value =  azurerm_network_interface.NIC.resource_group_name
}
