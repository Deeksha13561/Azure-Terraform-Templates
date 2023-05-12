variable "resource_group_name" {
  default="RG"
  type= string
  description = "Provide resource group name for which resources are getting provision."
}
variable "virtual_network_name" {
    description = "Name of the vnet to create"
    type = string
    default = "vnet1"
}

variable "subnet_address_prefix" { 
    description = "The address prefix to use for the subnet." 
    type = list(string) 
    default = ["10.0.1.0/24"]
}

variable "azurerm_application_name" {
  default     = "CPIB"
  type        = string
  description = "Provide application name for which resources are getting provision."
}

variable "azurerm_environment_name" {
  default     = "Prod"
  type        = string
  description = "Provide enviornment name for which resources are getting provision."
}

variable "azurerm_region_name" {
  default     = "APAC"
  type        = string
  description = "Provide region name for which resources are getting provision."
}

variable "azurerm_resource_group_iteration_number" {
  default     = "002"
  type        = string
  description = "Provide iteration number for which resources are getting provision."
}

variable "vnetpresent" {
  default     = false
  type        = bool
  description = "Provide vnet present boolean true or false."
}


