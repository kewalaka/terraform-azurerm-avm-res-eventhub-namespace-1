<!-- BEGIN_TF_DOCS -->
# Azure Event Hub Module

This module is used to manage Azure Event Hubs.

## Features

The module supports:

- TODO

## Usage

To use this module in your Terraform configuration, you'll need to provide values for the required variables.

### Example - Basic Hub

This example shows the most basic usage of the module. It creates a new event hub.

```terraform
module "avm-res-eventhub" {
  source = "Azure/avm-res-eventhub-namespace/azurerm//modules/event_hub"

  namespace = {
    resource_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myResourceGroup/providers/Microsoft.Network/virtualNetworks/myVNet"
  }
  # TODO
}
```

<!-- markdownlint-disable MD033 -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 1.9.0)

- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (>= 4.0.0, < 5.0.0)

- <a name="requirement_random"></a> [random](#requirement\_random) (>= 3.5.0, < 4.0.0)

## Providers

The following providers are used by this module:

- <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) (>= 4.0.0, < 5.0.0)

## Resources

The following resources are used by this module:

- [azurerm_eventhub.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub) (resource)

<!-- markdownlint-disable MD013 -->
## Required Inputs

The following input variables are required:

### <a name="input_name"></a> [name](#input\_name)

Description: The name of the Event Hub.

Type: `string`

### <a name="input_namespace"></a> [namespace](#input\_namespace)

Description: The namespace of the Event Hub.

Type:

```hcl
object({
    resource_id = string
  })
```

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_capture_description"></a> [capture\_description](#input\_capture\_description)

Description: Map of capture descriptions.

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

Type:

```hcl
object({
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
```

Default: `{}`

### <a name="input_enable_telemetry"></a> [enable\_telemetry](#input\_enable\_telemetry)

Description: Enable telemetry for the module. Defaults to true.

Type: `bool`

Default: `true`

### <a name="input_message_retention"></a> [message\_retention](#input\_message\_retention)

Description: Specifies the number of days to retain the events for this Event Hub.
- Maximum value is 90 days for a dedicated Event Hubs cluster.
- Maximum value is 7 days for a shared parent EventHub Namespace.
- Maximum value is 1 day for a Basic SKU.

Type: `number`

Default: `null`

### <a name="input_partition_count"></a> [partition\_count](#input\_partition\_count)

Description: Specifies the current number of shards on the Event Hub.
- Maximum value is 1024 for a dedicated Event Hubs cluster.
- Maximum value is 32 for a shared parent EventHub Namespace.
- Cannot be decreased unless the SKU is Premium.

Type: `number`

Default: `2`

### <a name="input_role_assignments"></a> [role\_assignments](#input\_role\_assignments)

Description: A map of role assignments to create on the secret. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.

- `role_definition_id_or_name` - The ID or name of the role definition to assign to the principal.
- `principal_id` - The ID of the principal to assign the role to.
- `description` - The description of the role assignment.
- `skip_service_principal_aad_check` - If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.
- `condition` - The condition which will be used to scope the role assignment.
- `condition_version` - The version of the condition syntax. If you are using a condition, valid values are '2.0'.

> Note: only set `skip_service_principal_aad_check` to true if you are assigning a role to a service principal.

Type:

```hcl
map(object({
    role_definition_id_or_name             = string
    principal_id                           = string
    description                            = optional(string, null)
    skip_service_principal_aad_check       = optional(bool, false)
    condition                              = optional(string, null)
    condition_version                      = optional(string, null)
    delegated_managed_identity_resource_id = optional(string, null)
    principal_type                         = optional(string, null)
  }))
```

Default: `{}`

### <a name="input_status"></a> [status](#input\_status)

Description: The status of the Event Hub. Possible values are 'Active' or 'Disabled'. Defaults to null.

Type: `string`

Default: `"Active"`

## Outputs

The following outputs are exported:

### <a name="output_name"></a> [name](#output\_name)

Description: The resource name of the hub.

### <a name="output_partition_ids"></a> [partition\_ids](#output\_partition\_ids)

Description: The IDs for partitions created by this event hub

## Modules

No modules.

<!-- markdownlint-disable-next-line MD041 -->
## Data Collection

The software may collect information about you and your use of the software and send it to Microsoft. Microsoft may use this information to provide services and improve our products and services. You may turn off the telemetry as described in the repository. There are also some features in the software that may enable you and Microsoft to collect data from users of your applications. If you use these features, you must comply with applicable law, including providing appropriate notices to users of your applications together with a copy of Microsoft’s privacy statement. Our privacy statement is located at <https://go.microsoft.com/fwlink/?LinkID=824704>. You can learn more about data collection and use in the help documentation and our privacy statement. Your use of the software operates as your consent to these practices.
<!-- END_TF_DOCS -->