variable "name" {
  type        = string
  description = "The name of the authorization rule."
}

variable "namespace_name" {
  type        = string
  description = "The name of the Event Hub namespace."
}

variable "eventhub_name" {
  type        = string
  description = "The name of the Event Hub."
  default     = null
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group containing the Event Hub namespace."
}

variable "listen" {
  type        = bool
  default     = false
  description = "Specifies if the rule has permissions to Listen to the Event Hub."
}

variable "send" {
  type        = bool
  default     = false
  description = "Specifies if the rule has permissions to Send to the Event Hub."
}

variable "manage" {
  type        = bool
  default     = false
  description = "Specifies if the rule has permissions to Manage the Event Hub. When true, both listen and send must also be true."
}
