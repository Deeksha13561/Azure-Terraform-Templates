
variable "resource_group_name" {
  default     = "RG-cpib-prod-apac-001"
  type        = string
  description = "Provide resource group name for which resources are getting provision."
}

variable "rgpresent" {
  default     = false
  type        = bool
  description = "Provide rg present boolean for which resources are getting provision."
}





