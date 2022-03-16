locals {
  servicebus_namespace_name = "${var.product}-servicebus-${var.env}"
}

module "servicebus-namespace" {
#   source                  = "git@github.com:hmcts/terraform-module-servicebus-namespace?ref=master"
  source                  = "git@github.com:hmcts/terraform-module-servicebus-namespace?ref=DTSPO-6371_private_endpoint"
  name                    = local.servicebus_namespace_name
#   project                 = var.project
  location                = var.location
  resource_group_name     = azurerm_resource_group.shared_resource_group.name
  env                     = var.env
  common_tags             = local.tags
#   capacity                = 1
#   enable_private_endpoint = var.servicebus_enable_private_endpoint
}
