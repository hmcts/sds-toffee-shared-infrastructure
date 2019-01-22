
provider "azurerm" {
  
  version = "=1.19.0"
}


locals {

  //ace_name_wode = "core-compute-${var.env}"
  //ace_name_de = "${local.ace_name_wode}${var.deployment_target}"
  //ace_name = "${var.deployment_target != "" ? local.ace_name_de : local.ace_name_wode}"
  ace_name = "core-compute-${var.env}${var.deployment_target}"
  tags = "${merge(
    var.common_tags,
    map("Team Contact", var.team_contact)
  )}"
}


//SHARED RESOURCE GROUP PER DEPLOYMENT TARGET
resource "azurerm_resource_group" "shared_resource_group_te" {
  name     = "${var.product}-shared-infrastructure-${var.env}${var.deployment_target}"
  location = "${var.location}"

  tags = "${local.tags}"
}
