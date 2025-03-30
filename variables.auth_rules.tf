variable "auth_rules" {
  type = map(object({
    name                = string
    namespace_name      = string
    eventhub_name       = optional(string)
    resource_group_name = string
    listen              = optional(bool, false)
    send                = optional(bool, false)
    manage              = optional(bool, false)
  }))
  default = {}

  description = <<DESCRIPTION
A map of authorization rules to create. Each key is a unique identifier, and the value is an object containing the following parameters:
- name: (string) The name of the authorization rule.
- namespace_name: (string) The name of the Event Hub namespace.
- eventhub_name: (optional, string) The name of the Event Hub, if not specified a namespace scoped rule will be created.
- resource_group_name: (string) The name of the resource group containing the Event Hub namespace.
- listen: (optional, bool) Specifies if the rule has permissions to Listen to the Event Hub. Defaults to false.
- send: (optional, bool) Specifies if the rule has permissions to Send to the Event Hub. Defaults to false.
- manage: (optional, bool) Specifies if the rule has permissions to Manage the Event Hub. Defaults to false. When true, both listen and send must also be true.
DESCRIPTION
}
