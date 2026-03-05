data "azurerm_subnet" "private_endpoint_subnet" {
  name                 = "private-endpoints"
  virtual_network_name = "ss-${var.env}-vnet"
  resource_group_name  = azurerm_resource_group.shared_resource_group.name
}

module "ai" {
  source                          = "git::https://github.com/hmcts/terraform-module-ai-services?ref=main"
  env                             = var.env
  project                         = "${var.project}-${var.product}"
  existing_resource_group_name    = azurerm_resource_group.shared_resource_group.name
  common_tags                     = var.common_tags
  product                         = var.project
  component                       = var.product
  key_vault_id                    = module.key_vault.key_vault_id
  application_insights_id         = module.application_insights.id
  create_cognitive_account        = true
  cognitive_account_kind          = "SpeechServices"
  cognitive_account_sku           = "S0"
  subnet_id                       = data.azurerm_subnet.private_endpoint_subnet.id
}