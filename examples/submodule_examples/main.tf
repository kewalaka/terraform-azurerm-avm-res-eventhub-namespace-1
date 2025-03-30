provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "example-resource-group"
  location = "East US"
}

resource "azurerm_eventhub_namespace" "example" {
  name                = "example-namespace"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  sku                 = "Standard"
}

resource "azurerm_eventhub" "example" {
  name              = "example-eventhub"
  namespace_id      = azurerm_eventhub_namespace.example.name
  partition_count   = 2
  message_retention = 1
}

module "auth_rules_namespace" {
  source = "../../modules/auth_rule"

  name                = "namespace-auth-rule"
  namespace_name      = azurerm_eventhub_namespace.example.name
  resource_group_name = azurerm_resource_group.example.name
  listen              = true
  send                = false
  manage              = false
}

module "auth_rules_eventhub" {
  source = "../../modules/auth_rule"

  name                = "eventhub-auth-rule"
  namespace_name      = azurerm_eventhub_namespace.example.name
  eventhub_name       = azurerm_eventhub.example.name
  resource_group_name = azurerm_resource_group.example.name
  listen              = true
  send                = true
  manage              = false
}

module "consumer_groups" {
  source = "../../modules/consumer_group"

  name                = "example-consumer-group"
  eventhub_name       = azurerm_eventhub.example.name
  namespace_name      = azurerm_eventhub_namespace.example.name
  resource_group_name = azurerm_resource_group.example.name
  user_metadata       = "example-metadata"
}
