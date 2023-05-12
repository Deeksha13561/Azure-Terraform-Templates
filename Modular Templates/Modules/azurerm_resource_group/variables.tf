variable "resource_group_location" {
  default= "{{resource_group_location}}"
  type        = string
  description = "Provide RG location for which resources are getting provision."
}

variable "azurerm_application_name" {
  default     = "{{azurerm_application_name}}"
  type        = string
  description = "Provide application name for which resources are getting provision."
}

variable "azurerm_environment_name" {
  default     = "{{azurerm_environment_name}}"
  type        = string
  description = "Provide enviornment name for which resources are getting provision."
}

variable "azurerm_resource_group_iteration_number" {
  default     =  "{{azurerm_resource_group_iteration_number}}"
  type        = string
  description = "Provide iteration number for which resources are getting provision."
}

variable "azurerm_region_name" {
  default     = "{{azurerm_region_name}}"
  type        = string
  description = "Provide region name for which resources are getting provision."
}

