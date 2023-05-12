
output "virtual_network_name" {
  value = azurerm_virtual_network.vnet.name
}
output "virtual_network_id" {
  value = azurerm_virtual_network.vnet.id
}

output "resource_group_name" {
  value = azurerm_virtual_network.vnet.resource_group_name
}

output "resource_group_location" {
  value = azurerm_virtual_network.vnet.location
}