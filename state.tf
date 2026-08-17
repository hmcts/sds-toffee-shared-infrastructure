terraform {
  backend "azurerm" {}

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.81.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "3.8.0"
    }
    random = {
      source = "hashicorp/random"
    }
  }
}

provider "azurerm" {
  features {}
  resource_provider_registrations = "none"
  alias                           = "private_endpoint"
  subscription_id                 = var.subscription_id
}
