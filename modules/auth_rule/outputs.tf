output "id" {
  value = coalesce(
    azurerm_eventhub_authorization_rule.this[0].id,
    azurerm_eventhub_namespace_authorization_rule.this[0].id
  )
  description = "The ID of the Authorization Rule."
}

output "primary_connection_string_alias" {
  value = coalesce(
    azurerm_eventhub_authorization_rule.this[0].primary_connection_string_alias,
    azurerm_eventhub_namespace_authorization_rule.this[0].primary_connection_string_alias
  )
  description = "The alias of the Primary Connection String for the Authorization Rule."
}

output "secondary_connection_string_alias" {
  value = coalesce(
    azurerm_eventhub_authorization_rule.this[0].secondary_connection_string_alias,
    azurerm_eventhub_namespace_authorization_rule.this[0].secondary_connection_string_alias
  )
  description = "The alias of the Secondary Connection String for the Authorization Rule."
}

output "primary_connection_string" {
  value = coalesce(
    azurerm_eventhub_authorization_rule.this[0].primary_connection_string,
    azurerm_eventhub_namespace_authorization_rule.this[0].primary_connection_string
  )
  description = "The Primary Connection String for the Authorization Rule."
}

output "primary_key" {
  value = coalesce(
    azurerm_eventhub_authorization_rule.this[0].primary_key,
    azurerm_eventhub_namespace_authorization_rule.this[0].primary_key
  )
  description = "The Primary Key for the Authorization Rule."
}

output "secondary_connection_string" {
  value = coalesce(
    azurerm_eventhub_authorization_rule.this[0].secondary_connection_string,
    azurerm_eventhub_namespace_authorization_rule.this[0].secondary_connection_string
  )
  description = "The Secondary Connection String for the Authorization Rule."
}

output "secondary_key" {
  value = coalesce(
    azurerm_eventhub_authorization_rule.this[0].secondary_key,
    azurerm_eventhub_namespace_authorization_rule.this[0].secondary_key
  )
  description = "The Secondary Key for the Authorization Rule."
}
