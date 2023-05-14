
#NOTE: We run this code via Azure DevOps pipeline, where we add a Powershell task. Let us say I am creating a resource group- the powershell script
#will copy paste this file in the "azurerm_resource_group" module at run time and delete the file after execution completes
#This structure allows us to create modular terraform templates

terraform {
  required_version = ">=1.0.10"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
}
provider "azurerm" {
  features {}
}
