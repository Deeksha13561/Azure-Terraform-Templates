terraform {
  required_version = ">=1.0.10"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
   backend "azurerm" {
    resource_group_name  = "RG"
    storage_account_name = "tfstgacc01"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
   }
}

provider "azurerm" {
  features {}
}


#calling the resource group module
module "azurerm_resource_group" {
  source = "../Modules/azurerm_resource_group"
}

#calling the SQL server module and overriding variables from Resource Group module
module "azurerm_sql_server" {
  source = "../Modules/azurerm_sql_server"
  resource_group_name= module.azurerm_resource_group.azurerm_resource_group_name
  resource_group_location= module.azurerm_resource_group.azurerm_resource_group_location
  # resource_group_name= data.azurerm_resource_group.rg.name
  # resource_group_location= data.azurerm_resource_group.location

}

module "azurerm_sql_database3"{
  source = "../Modules/azurerm_sql_database"
  count = length(var.sqldbname)
  sql_db_name = var.sqldbname[count.index]
  resource_group_name= module.azurerm_resource_group.azurerm_resource_group_name
  resource_group_location= module.azurerm_resource_group.azurerm_resource_group_location
  # resource_group_name= data.azurerm_resource_group.rg.name
  # resource_group_location= data.azurerm_resource_group.location
  sql_server_name = module.azurerm_sql_server.sql_server_name
}

module "azurerm_managed_disk" {
  source = "../Modules/azurerm_managed_disk"  
}

module "azurerm_storage_account" {
  source = "../Modules/azurerm_storage_account"
}

module "azurerm_network_interface"{
  source = "../Modules/azurerm_network_interface"
}

module "azurerm_network_security_group"{
  source = "../Modules/azurerm_network_security_group"
}

module "azurerm_public_ip" {
  source = "../Modules/azurerm_public_ip"
}

module "azurerm_virtual_network" {
  source = "../Modules/azurerm_virtual_network"
}

module "azurerm_subnet" {
  source = "../Modules/azurerm_subnet"
}

module "azurerm_service_plan" {
  source = "../Modules/azurerm_service_plan"
}

module "azurerm_windows_web_app" {
  source= "../Modules/azurerm_windows_web_app"
}

 module "azurerm_linux_web_app" {
  source= "../Modules/azurerm_linux_web_app"
}

 module "azurerm_load_balancer" {
  source = "../Modules/azurerm_load_balancer"
}

module "azurerm_tags" {
  source = "../Modules/azurerm_tags"
}

module "azurerm_availability_set" {
  source = "../Modules/azurerm_availability_set"
  # count= length(var.availability_set_name)
  # availability_set_name = var.availability_set_name[count.index]
  resource_group_name= module.azurerm_resource_group.azurerm_resource_group_name
  resource_group_location= module.azurerm_resource_group.azurerm_resource_group_location
}

module "azurerm_linux_virtual_machine" {
  source = "../Modules/azurerm_linux_virtual_machine"
}

module "azurerm_windows_virtual_machine" {
  source = "../Modules/azurerm_windows_virtual_machine"
}

module "tags" {
  source = "../Modules/azurerm_tags"
}

