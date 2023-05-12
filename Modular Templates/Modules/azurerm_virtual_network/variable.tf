
variable "resource_group_name" {
    default="RG-cpib-prod-apac-003"
    description = "Name of the resource group to be imported." 
    type = string
    
}

variable "virtual_network_address_space" {
    type = list(string)
    description = "The address space that is used by the virtual network." 
    default = ["10.0.0.0/16"]
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
  default     = "003"
  type        = string
  description = "Provide iteration number for which resources are getting provision."
}

variable "rgpresent" {
  default     = false
  type        = bool
  description = "Provide rg present boolean for which resources are getting provision."
}
