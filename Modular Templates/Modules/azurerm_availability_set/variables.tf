
variable "resource_group_name" {
  default     = "RG-cpib-prod-apac-001"
  type        = string
  description = "Provide resource group name for which resources are getting provision."
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

variable "rgpresent" {
  default     = false
  type        = bool
  description = "Provide rg present boolean for which resources are getting provision."
}





