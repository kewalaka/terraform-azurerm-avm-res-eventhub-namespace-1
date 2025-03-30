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

- [azurerm_eventhub_authorization_rule.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub_authorization_rule) (resource)
- [azurerm_eventhub_namespace_authorization_rule.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub_namespace_authorization_rule) (resource)

<!-- markdownlint-disable MD013 -->
## Required Inputs

The following input variables are required:

### <a name="input_name"></a> [name](#input\_name)

Description: The name of the authorization rule.

Type: `string`

### <a name="input_namespace_name"></a> [namespace\_name](#input\_namespace\_name)

Description: The name of the Event Hub namespace.

Type: `string`

### <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name)

Description: The name of the resource group containing the Event Hub namespace.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_eventhub_name"></a> [eventhub\_name](#input\_eventhub\_name)

Description: The name of the Event Hub.

Type: `string`

Default: `null`

### <a name="input_listen"></a> [listen](#input\_listen)

Description: Specifies if the rule has permissions to Listen to the Event Hub.

Type: `bool`

Default: `false`

### <a name="input_manage"></a> [manage](#input\_manage)

Description: Specifies if the rule has permissions to Manage the Event Hub. When true, both listen and send must also be true.

Type: `bool`

Default: `false`

### <a name="input_send"></a> [send](#input\_send)

Description: Specifies if the rule has permissions to Send to the Event Hub.

Type: `bool`

Default: `false`

## Outputs

The following outputs are exported:

### <a name="output_id"></a> [id](#output\_id)

Description: The ID of the Authorization Rule.

### <a name="output_primary_connection_string"></a> [primary\_connection\_string](#output\_primary\_connection\_string)

Description: The Primary Connection String for the Authorization Rule.

### <a name="output_primary_connection_string_alias"></a> [primary\_connection\_string\_alias](#output\_primary\_connection\_string\_alias)

Description: The alias of the Primary Connection String for the Authorization Rule.

### <a name="output_primary_key"></a> [primary\_key](#output\_primary\_key)

Description: The Primary Key for the Authorization Rule.

### <a name="output_secondary_connection_string"></a> [secondary\_connection\_string](#output\_secondary\_connection\_string)

Description: The Secondary Connection String for the Authorization Rule.

### <a name="output_secondary_connection_string_alias"></a> [secondary\_connection\_string\_alias](#output\_secondary\_connection\_string\_alias)

Description: The alias of the Secondary Connection String for the Authorization Rule.

### <a name="output_secondary_key"></a> [secondary\_key](#output\_secondary\_key)

Description: The Secondary Key for the Authorization Rule.

## Modules

No modules.

<!-- markdownlint-disable-next-line MD041 -->
## Data Collection

The software may collect information about you and your use of the software and send it to Microsoft. Microsoft may use this information to provide services and improve our products and services. You may turn off the telemetry as described in the repository. There are also some features in the software that may enable you and Microsoft to collect data from users of your applications. If you use these features, you must comply with applicable law, including providing appropriate notices to users of your applications together with a copy of Microsoft’s privacy statement. Our privacy statement is located at <https://go.microsoft.com/fwlink/?LinkID=824704>. You can learn more about data collection and use in the help documentation and our privacy statement. Your use of the software operates as your consent to these practices.
<!-- END_TF_DOCS -->