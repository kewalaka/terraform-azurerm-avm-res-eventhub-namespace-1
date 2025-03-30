variable "name" {
  type        = string
  description = "The name of the Event Hub."
  nullable    = false
}

variable "namespace" {
  type = object({
    resource_id = string
  })
  description = "The namespace of the Event Hub."
  nullable    = false
}

variable "capture_description" {
  type = object({
    enabled             = optional(bool)
    encoding            = optional(string)
    interval_in_seconds = optional(number)
    size_limit_in_bytes = optional(number)
    skip_empty_archives = optional(bool)
    destination = optional(object({
      name                = optional(string, "EventHubArchive.AzureBlockBlob")
      archive_name_format = string
      blob_container_name = string
      storage_account_id  = string
    }))
  })
  default     = {}
  description = <<DESCRIPTION
Map of capture descriptions.

  - `enabled` - (Required) Specifies if the Capture Description is Enabled.
  - `encoding` - (Required) Specifies the Encoding used for the Capture Description. Possible values are Avro and AvroDeflate.
  - `interval_in_seconds` - (Optional) Specifies the time interval in seconds at which the capture will happen. Values can be between 60 and 900 seconds. Defaults to 300 seconds.
  - `size_limit_in_bytes` - (Optional) Specifies the amount of data built up in your EventHub before a Capture Operation occurs. Value should be between 10485760 and 524288000 bytes. Defaults to 314572800 bytes.
  - `skip_empty_archives` - (Optional) Specifies if empty files should not be emitted if no events occur during the Capture time window. Defaults to false.
  - `destination` - (Required) A destination block as defined below.
    - `name` - (Required) The Name of the Destination where the capture should take place. At this time, the only supported value is EventHubArchive.AzureBlockBlob.
      - Note: At this time, it's only possible to Capture EventHub messages to Blob Storage.
    - `archive_name_format` - (Required) The Blob naming convention for archiving. e.g. {Namespace}/{EventHub}/{PartitionId}/{Year}/{Month}/{Day}/{Hour}/{Minute}/{Second}. Here, all the parameters (Namespace, EventHub, etc.) are mandatory irrespective of order.
    - `blob_container_name` - (Required) The name of the Container within the Blob Storage Account where messages should be archived.
    - `storage_account_id` - (Required) The ID of the Blob Storage Account where messages should be archived.
DESCRIPTION 

  validation {
    condition     = var.capture_description == null ? true : contains(["Avro", "AvroDeflate"], var.capture_description.encoding)
    error_message = "The encoding must be either 'Avro' or 'AvroDeflate'."
  }
  validation {
    condition     = var.capture_description == null ? true : var.capture_description.size_limit_in_bytes == null ? true : var.capture_description.size_limit_in_bytes >= 314572800 && var.capture_description.size_limit_in_bytes <= 524288000
    error_message = "The size_limit_in_bytes must be between 314572800 and 524288000."
  }
  validation {
    condition     = var.capture_description == null ? true : var.capture_description.interval_in_seconds == null ? true : var.capture_description.interval_in_seconds >= 60 && var.capture_description.interval_in_seconds <= 900
    error_message = "The interval_in_seconds must be between 60 and 900."
  }
  validation {
    condition     = var.capture_description == null ? true : var.capture_description.destination.name == null ? true : var.capture_description.destination.name == "EventHubArchive.AzureBlockBlob"
    error_message = "The destination.name must be 'EventHubArchive.AzureBlockBlob'."
  }
  validation {
    condition     = var.capture_description.enabled == false || (var.capture_description.destination != null && var.capture_description.destination.name == "EventHubArchive.AzureBlockBlob")
    error_message = "The destination block must be provided and the name must be 'EventHubArchive.AzureBlockBlob' when capture_description.enabled is true."
  }
}

variable "enable_telemetry" {
  type        = bool
  default     = true
  description = "Enable telemetry for the module. Defaults to true."
}

variable "message_retention" {
  type        = number
  default     = null
  description = <<DESCRIPTION
Specifies the number of days to retain the events for this Event Hub.
- Maximum value is 90 days for a dedicated Event Hubs cluster.
- Maximum value is 7 days for a shared parent EventHub Namespace.
- Maximum value is 1 day for a Basic SKU.
DESCRIPTION

  validation {
    condition     = var.message_retention == null || (var.message_retention >= 1 && var.message_retention <= 90)
    error_message = "The message_retention must be between 1 and 90 days. For shared namespaces, the maximum is 7 days, or 1 day for Basic SKU."
  }
}

variable "partition_count" {
  type        = number
  default     = 2
  description = <<DESCRIPTION
Specifies the current number of shards on the Event Hub. 
- Maximum value is 1024 for a dedicated Event Hubs cluster.
- Maximum value is 32 for a shared parent EventHub Namespace.
- Cannot be decreased unless the SKU is Premium.
DESCRIPTION
  nullable    = false

  validation {
    condition     = var.partition_count >= 1 && var.partition_count <= 1024
    error_message = "The partition_count must be between 1 and 1024. For shared namespaces, the maximum is 32."
  }
}

variable "role_assignments" {
  type = map(object({
    role_definition_id_or_name             = string
    principal_id                           = string
    description                            = optional(string, null)
    skip_service_principal_aad_check       = optional(bool, false)
    condition                              = optional(string, null)
    condition_version                      = optional(string, null)
    delegated_managed_identity_resource_id = optional(string, null)
    principal_type                         = optional(string, null)
  }))
  default     = {}
  description = <<DESCRIPTION
A map of role assignments to create on the secret. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.

- `role_definition_id_or_name` - The ID or name of the role definition to assign to the principal.
- `principal_id` - The ID of the principal to assign the role to.
- `description` - The description of the role assignment.
- `skip_service_principal_aad_check` - If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.
- `condition` - The condition which will be used to scope the role assignment.
- `condition_version` - The version of the condition syntax. If you are using a condition, valid values are '2.0'.

> Note: only set `skip_service_principal_aad_check` to true if you are assigning a role to a service principal.
DESCRIPTION
  nullable    = false
}

variable "status" {
  type        = string
  default     = "Active"
  description = "The status of the Event Hub. Possible values are 'Active' or 'Disabled'. Defaults to null."

  validation {
    condition     = var.status == null || contains(["Active", "Disabled", "SendDisabled"], var.status)
    error_message = "The status must be one of 'Active', 'Disabled', or 'SendDisabled'."
  }
}
