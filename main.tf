provider "azurerm" {
  features {}
}

locals {
  vault_name = "${var.product}si-${var.env}"

  tags = merge(
    var.common_tags,
  )

}

//SHARED RESOURCE GROUP
resource "azurerm_resource_group" "shared_resource_group" {
  name     = "${var.product}-shared-infrastructure-${var.env}"
  location = var.location

  tags = local.tags
}


