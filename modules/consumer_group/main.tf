resource "azurerm_eventhub_consumer_group" "this" {
  name                = var.name
  eventhub_name       = var.eventhub_name
  namespace_name      = var.namespace_name
  resource_group_name = var.resource_group_name
  user_metadata       = var.user_metadata
}
