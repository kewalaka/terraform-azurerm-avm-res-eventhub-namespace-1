resource "azurerm_eventhub" "this" {
  message_retention = var.message_retention
  name              = var.name
  partition_count   = var.partition_count
  namespace_id      = var.namespace.resource_id
  status            = var.status

  dynamic "capture_description" {
    for_each = var.capture_description != null ? { this = var.capture_description } : {}

    content {
      enabled             = capture_description.enabled
      encoding            = capture_description.encoding
      interval_in_seconds = capture_description.interval_in_seconds
      size_limit_in_bytes = capture_description.size_limit_in_bytes
      skip_empty_archives = capture_description.skip_empty_archives

      destination {
        archive_name_format = capture_description.destination.archive_name_format
        blob_container_name = capture_description.destination.blob_container_name
        name                = capture_description.destination.name
        storage_account_id  = capture_description.destination.storage_account_id
      }
    }
  }
}

# resource "azurerm_role_assignment" "event_hubs" {
#   for_each = var.role_assignments

#   scope                                  = azurerm_eventhub.this.name
#   role_definition_id                     = strcontains(lower(var.role_assignments.role_definition_id_or_name), lower(local.role_definition_resource_substring)) ? var.role_assignments.role_definition_id_or_name : null
#   role_definition_name                   = strcontains(lower(var.role_assignments.role_definition_id_or_name), lower(local.role_definition_resource_substring)) ? null : var.role_assignments.role_definition_id_or_name
#   principal_id                           = var.role_assignments.principal_id
#   condition                              = var.role_assignments.condition
#   condition_version                      = var.role_assignments.condition_version
#   skip_service_principal_aad_check       = var.role_assignments.skip_service_principal_aad_check
#   delegated_managed_identity_resource_id = var.role_assignments.delegated_managed_identity_resource_id
# }
