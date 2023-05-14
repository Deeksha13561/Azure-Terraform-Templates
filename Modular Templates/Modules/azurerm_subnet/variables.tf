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


variable "vnetpresent" {
  default     = false
  type        = bool
  description = "Provide vnet present boolean true or false."
}


