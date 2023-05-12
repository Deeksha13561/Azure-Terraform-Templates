variable "resource_group_name" {
  default     = "RG-cpib-prod-apac-003"
  type        = string
  description = "Provide resource group name for which resources are getting provision."
}

variable "subnet_name" {
  default     = "subnet1"
  type        = string
  description = "Provide subnet name for which resources are getting provision."
}

variable "virtual_network_name" {
  default     = "vnet1"
  type        = string
  description = "Provide virtual network name for which resources are getting provision."
}

variable "network_interface_name" {
    default     = "NIC2"
    type        = string
    description = "Provide azurerm network interface Name."
}

variable "nic_ip_configuration_name" {
    default     = "IP1"
    type        = string
    description = "Provide ip_configuration_name."
}

variable "private_ip_address_allocation" {
    default     = "Dynamic"
    type        = string
    description = "Provide private_ip_address_allocation."
}

variable "subnetpresent" {
  default     = false
  type        = bool
  description = "Provide storage account present boolean"
}

variable "rgpresent" {
  default     = false
  type        = bool
  description = "Provide resource group present boolean"
}





