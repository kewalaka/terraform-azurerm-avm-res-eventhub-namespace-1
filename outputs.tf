output "default_primary_connection_string" {
  description = "The primary connection string for the RootManageSharedAccessKey authorization rule."
  sensitive   = true
  value       = azurerm_eventhub_namespace.this.default_primary_connection_string
}

output "default_primary_connection_string_alias" {
  description = "The alias of the primary connection string for the RootManageSharedAccessKey authorization rule."
  value       = azurerm_eventhub_namespace.this.default_primary_connection_string_alias
}

output "default_primary_key" {
  description = "The primary access key for the RootManageSharedAccessKey authorization rule."
  sensitive   = true
  value       = azurerm_eventhub_namespace.this.default_primary_key
}

output "default_secondary_connection_string" {
  description = "The secondary connection string for the RootManageSharedAccessKey authorization rule."
  sensitive   = true
  value       = azurerm_eventhub_namespace.this.default_secondary_connection_string
}

output "default_secondary_connection_string_alias" {
  description = "The alias of the secondary connection string for the RootManageSharedAccessKey authorization rule."
  value       = azurerm_eventhub_namespace.this.default_secondary_connection_string_alias
}

output "default_secondary_key" {
  description = "The secondary access key for the RootManageSharedAccessKey authorization rule."
  sensitive   = true
  value       = azurerm_eventhub_namespace.this.default_secondary_key
}

output "event_hubs" {
  description = "A map of Event Hubs with their names and partition IDs."
  value       = local.event_hubs_outputs
}

output "identity" {
  description = "The identity block of the EventHub Namespace."
  value       = azurerm_eventhub_namespace.this.identity
}

output "name" {
  description = "The name of the EventHub Namespace."
  value       = azurerm_eventhub_namespace.this.name
}

output "resource_id" {
  description = "The ID of the EventHub Namespace."
  value       = azurerm_eventhub_namespace.this.id
}
