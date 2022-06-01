locals {
  servicebus_namespace_name = "${var.product}-servicebus-${var.env}"
}

module "servicebus-namespace" {
  providers = {
    azurerm.private_endpoint = azurerm.private_endpoint
  }
  source                  = "git@github.com:hmcts/terraform-module-servicebus-namespace?ref=master"
  name                    = local.servicebus_namespace_name
  location                = var.location
  sku                     = "Basic"
  resource_group_name     = azurerm_resource_group.shared_resource_group.name
  env                     = var.env
  common_tags             = var.common_tags
  project                 = var.project
}

data "azurerm_user_assigned_identity" "toffee_mi" {
  name                = "toffee-${var.env}-mi"
  resource_group_name = "managed-identities-${var.env}-rg"
}

resource "azurerm_role_assignment" "toffee_servicebus_data_owner" {
  principal_id = data.azurerm_user_assigned_identity.toffee_mi
  scope        = module.servicebus-namespace.id
  role_definition_name = "Azure Service Bus Data Owner"
}

data "azurerm_user_assigned_identity" "keda_servicebus_data_owner" {
  name                = "keda-${var.env}-mi"
  resource_group_name = "managed-identities-${var.env}-rg"
}

resource "azurerm_role_assignment" "keda_servicebus" {
  principal_id = data.azurerm_user_assigned_identity.toffee_mi
  scope        = module.servicebus-namespace.id
  role_definition_name = "Azure Service Bus Data Owner"
}