module "event_hubs" {
  for_each = var.event_hubs

  source = "./modules/event_hub"

  namespace         = { resource_id = azurerm_eventhub_namespace.this.id }
  name              = each.key
  partition_count   = each.value.partition_count
  message_retention = each.value.message_retention
  status            = each.value.status

  capture_description = each.value.capture_description
  role_assignments    = each.value.role_assignments
}
