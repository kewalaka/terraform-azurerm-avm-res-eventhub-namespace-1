module "consumer_groups" {
  source = "./modules/consumer_group"

  for_each = var.consumer_groups

  name                = each.value.name
  eventhub_name       = each.value.eventhub_name
  namespace_name      = each.value.namespace_name
  resource_group_name = each.value.resource_group_name
  user_metadata       = each.value.user_metadata
}
