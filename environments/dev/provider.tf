terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
         version = "~> 3.0"
    }
  }
  # backend "azurerm" {
  #   resource_group_name = "value"
  #   storage_account_name = "value"
  #   container_name = "value"
  #   key = "value"
    
  # }
}

provider "azurerm" {
  features {}
  subscription_id = "d0d75b6f-d90b-4fa3-b3d5-98e460461aea"
}
