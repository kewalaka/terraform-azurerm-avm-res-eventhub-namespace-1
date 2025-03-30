variable "location" {
  type        = string
  default     = "East US"
  description = "The location for the resources."
}

variable "resource_group_name" {
  type        = string
  default     = "example-resource-group"
  description = "The name of the resource group."
}
