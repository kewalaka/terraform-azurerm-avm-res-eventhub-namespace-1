variable "consumer_groups" {
  type = map(object({
    name                = optional(string)
    eventhub_name       = optional(string)
    namespace_name      = optional(string)
    resource_group_name = optional(string)
    user_metadata       = optional(string)
  }))
  default  = {}
  nullable = false

  description = <<DESCRIPTION
A map of consumer groups to create. Each key is a unique identifier, and the value is an object containing the following parameters:
- name: (string) The name of the consumer group.
- eventhub_name: (string) The name of the Event Hub to associate the consumer group with.
- namespace_name: (string) The name of the Event Hub namespace.
- resource_group_name: (string) The name of the resource group containing the Event Hub namespace.
- user_metadata: (optional, string) Specifies the user metadata.
DESCRIPTION
}
