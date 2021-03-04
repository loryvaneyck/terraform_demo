# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.26"
    }
  }
}

provider "azurerm" {
  features {}
}

variable "location" {
   type = string
}

resource "azurerm_resource_group" "tfdemo" {
  name     = "TFdemoRG"
  location = var.location
  tags = {
    owner = "Lory Van Eyck"
  }
}