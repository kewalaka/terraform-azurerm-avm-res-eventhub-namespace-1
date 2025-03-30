output "name" {
  description = "The resource name of the hub."
  value       = azurerm_eventhub.this.name
}

output "partition_ids" {
  description = "The IDs for partitions created by this event hub"
  value       = azurerm_eventhub.this.partition_ids
}
