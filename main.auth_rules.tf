module "auth_rules" {
  source = "./modules/auth_rule"

  for_each = var.auth_rules

  name                = each.value.name
  namespace_name      = each.value.namespace_name
  eventhub_name       = each.value.eventhub_name
  resource_group_name = each.value.resource_group_name
  listen              = each.value.listen
  send                = each.value.send
  manage              = each.value.manage
}
