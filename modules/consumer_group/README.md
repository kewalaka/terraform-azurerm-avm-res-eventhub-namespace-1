<!-- BEGIN_TF_DOCS -->
# Consumer Group Submodule

This submodule creates an Azure Event Hub Consumer Group.

<!-- markdownlint-disable MD033 -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 1.3.0)

- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (>= 3.0.0)

## Providers

The following providers are used by this module:

- <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) (>= 3.0.0)

## Resources

The following resources are used by this module:

- [azurerm_eventhub_consumer_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub_consumer_group) (resource)

<!-- markdownlint-disable MD013 -->
## Required Inputs

The following input variables are required:

### <a name="input_eventhub_name"></a> [eventhub\_name](#input\_eventhub\_name)

Description: The name of the Event Hub to associate the consumer group with.

Type: `string`

### <a name="input_name"></a> [name](#input\_name)

Description: The name of the consumer group.

Type: `string`

### <a name="input_namespace_name"></a> [namespace\_name](#input\_namespace\_name)

Description: The name of the Event Hub namespace.

Type: `string`

### <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name)

Description: The name of the resource group containing the Event Hub namespace.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_user_metadata"></a> [user\_metadata](#input\_user\_metadata)

Description: (Optional) Specifies the user metadata.

Type: `string`

Default: `null`

## Outputs

The following outputs are exported:

### <a name="output_id"></a> [id](#output\_id)

Description: The ID of the consumer group.

## Modules

No modules.

<!-- markdownlint-disable-next-line MD041 -->
## Data Collection

The software may collect information about you and your use of the software and send it to Microsoft. Microsoft may use this information to provide services and improve our products and services. You may turn off the telemetry as described in the repository. There are also some features in the software that may enable you and Microsoft to collect data from users of your applications. If you use these features, you must comply with applicable law, including providing appropriate notices to users of your applications together with a copy of Microsoft’s privacy statement. Our privacy statement is located at <https://go.microsoft.com/fwlink/?LinkID=824704>. You can learn more about data collection and use in the help documentation and our privacy statement. Your use of the software operates as your consent to these practices.
<!-- END_TF_DOCS -->