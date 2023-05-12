variable "resource_group_name" {
  default = "RG2"
  type        = string
  description = "Name of RG"
}

variable "sqlserver_name" {
  default = "sqlserver097"
  type        = string
  description = "Name of SQl Server"
}

variable "sqldbname" {
  default     = ["db1","db2","db3"]
  type        = list(string)
  description = "Name of SQl Server"
}

variable "availability_set_name" {
  default     = ["ast1","ast2"]
  type        = list(string)
  description = "Name of Availability sets"
}


