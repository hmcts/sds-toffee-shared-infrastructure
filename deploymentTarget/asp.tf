module "app_service_plan" {
  source              = "git@github.com:hmcts/cnp-module-app-service-plan?ref=master"
  location            = "UK South"
  env                 = "${var.env}${var.deployment_target}"
  resource_group_name = "${azurerm_resource_group.shared_resource_group_te.name}"
  asp_capacity        = "${var.asp_capacity}"
  asp_name            = "${var.product}"
  ase_name            = "${local.ace_name}"
  tag_list            = "${local.tags}"
}