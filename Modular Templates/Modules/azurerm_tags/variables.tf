variable "resource_ids" {
  description = "Id of the Azure resources to tag"
  type        = list(string)
  default = [ "/subscriptions/0a3dc59a-7b38-4b0e-93d0-7c89b90e5b46/resourceGroups/RG-cpib-prod-apac-002/providers/Microsoft.Compute/availabilitySets/avail-cpib-prod-naa-002" ]
}

variable "azurerm_tags" {
  description = "Tags to apply on resource"
  type        = map(string)
  default = {
    "Env" = "prod"
    "abc" = "abc"
    "Owner" = "Taskal"
  }
}

variable "force" {
  description = "True to apply every time"
  type        = bool
  default     = false
}

variable "behavior" {
  description = "Behavior for tags applying. Must be `merge` or `overwrite`."
  type        = string
  default     = "merge"
}

variable "nb_resources" {
  description = "Number of resources to tag"
  type        = number
  default = 1
}
