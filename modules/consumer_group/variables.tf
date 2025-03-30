variable "name" {
  type        = string
  description = "The name of the consumer group."
  nullable    = false
}

variable "eventhub_name" {
  type        = string
  description = "The name of the Event Hub to associate the consumer group with."
  nullable    = false
}

variable "namespace_name" {
  type        = string
  description = "The name of the Event Hub namespace."
  nullable    = false
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group containing the Event Hub namespace."
  nullable    = false
}

variable "user_metadata" {
  type        = string
  default     = null
  description = "(Optional) Specifies the user metadata."
}
