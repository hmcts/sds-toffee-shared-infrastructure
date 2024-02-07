module "application_insights" {
  source = "git@github.com:hmcts/terraform-module-application-insights?ref=alert"

  env     = var.env
  product = var.product
  name    = "${var.product}"

  resource_group_name   = azurerm_resource_group.shared_resource_group.name
  email_receiver_config = {
    name              = "test"
    email_address     = "tyler.mcdowell@justice.gov.uk"
  }

  common_tags = var.common_tags
}

moved {
  from = azurerm_application_insights.appinsights
  to   = module.application_insights.azurerm_application_insights.this
}

resource "azurerm_key_vault_secret" "appInsights-InstrumentationKey" {
  name         = "appInsights-InstrumentationKey"
  value        = module.application_insights.instrumentation_key
  key_vault_id = module.vault.key_vault_id
}
