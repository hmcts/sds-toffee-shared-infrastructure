provider "azurerm" {
  features {}
}

locals {
  vault_name = "${var.product}si-${var.env}"

}

//SHARED RESOURCE GROUP
resource "azurerm_resource_group" "shared_resource_group" {
  name     = "${var.product}-shared-infrastructure-${var.env}"
  location = var.location

  tags = var.tags
}


