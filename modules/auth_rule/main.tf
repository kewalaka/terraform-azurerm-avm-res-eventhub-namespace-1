resource "azurerm_eventhub_authorization_rule" "this" {
  count               = var.eventhub_name != null ? 1 : 0
  name                = var.name
  namespace_name      = var.namespace_name
  eventhub_name       = var.eventhub_name
  resource_group_name = var.resource_group_name
  listen              = var.listen
  send                = var.send
  manage              = var.manage
}

resource "azurerm_eventhub_namespace_authorization_rule" "this" {
  count               = var.eventhub_name == null ? 1 : 0
  name                = var.name
  namespace_name      = var.namespace_name
  resource_group_name = var.resource_group_name
  listen              = var.listen
  send                = var.send
  manage              = var.manage
}
