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

  tags = module.tags.common_tags
}



module "tags" {
  source      = "git::https://github.com/hmcts/terraform-module-common-tags.git?ref=master"
  environment = lower(var.env)
  product     = var.product
  builtFrom   = var.builtFrom
}
