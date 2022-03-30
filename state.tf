terraform {
  backend "azurerm" {}

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.97.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "1.6.0"
    }
    random = {
      source = "hashicorp/random"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
  alias                      = "private-endpoint"
  subscription_id            = var.private_endpoint_subscription_id
}
