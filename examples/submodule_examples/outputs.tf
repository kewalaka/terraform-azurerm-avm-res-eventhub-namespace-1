output "namespace_auth_rule_id" {
  value       = module.auth_rules_namespace.id
  description = "The ID of the namespace-level authorization rule."
}

output "eventhub_auth_rule_id" {
  value       = module.auth_rules_eventhub.id
  description = "The ID of the Event Hub-level authorization rule."
}

output "consumer_group_id" {
  value       = azurerm_eventhub_consumer_group.example.id
  description = "The ID of the consumer group."
}
