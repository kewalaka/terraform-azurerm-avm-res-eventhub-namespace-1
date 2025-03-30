<!-- BEGIN_TF_DOCS -->
# Submodule examples

This example tests scenarios where submodule resources are created independently of the main resource.

It is expected this will be a niche use case.

```hcl
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "example-resource-group"
  location = "East US"
}

resource "azurerm_eventhub_namespace" "example" {
  name                = "example-namespace"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  sku                 = "Standard"
}

resource "azurerm_eventhub" "example" {
  name              = "example-eventhub"
  namespace_id      = azurerm_eventhub_namespace.example.name
  partition_count   = 2
  message_retention = 1
}

module "auth_rules_namespace" {
  source = "../../modules/auth_rule"

  name                = "namespace-auth-rule"
  namespace_name      = azurerm_eventhub_namespace.example.name
  resource_group_name = azurerm_resource_group.example.name
  listen              = true
  send                = false
  manage              = false
}

module "auth_rules_eventhub" {
  source = "../../modules/auth_rule"

  name                = "eventhub-auth-rule"
  namespace_name      = azurerm_eventhub_namespace.example.name
  eventhub_name       = azurerm_eventhub.example.name
  resource_group_name = azurerm_resource_group.example.name
  listen              = true
  send                = true
  manage              = false
}

module "consumer_groups" {
  source = "../../modules/consumer_group"

  name                = "example-consumer-group"
  eventhub_name       = azurerm_eventhub.example.name
  namespace_name      = azurerm_eventhub_namespace.example.name
  resource_group_name = azurerm_resource_group.example.name
  user_metadata       = "example-metadata"
}
```

<!-- markdownlint-disable MD033 -->
## Requirements

No requirements.

## Providers

The following providers are used by this module:

- <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm)

## Resources

The following resources are used by this module:

- [azurerm_eventhub.example](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub) (resource)
- [azurerm_eventhub_namespace.example](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub_namespace) (resource)
- [azurerm_resource_group.example](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) (resource)

<!-- markdownlint-disable MD013 -->
## Required Inputs

No required inputs.

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_location"></a> [location](#input\_location)

Description: The location for the resources.

Type: `string`

Default: `"East US"`

### <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name)

Description: The name of the resource group.

Type: `string`

Default: `"example-resource-group"`

## Outputs

The following outputs are exported:

### <a name="output_consumer_group_id"></a> [consumer\_group\_id](#output\_consumer\_group\_id)

Description: The ID of the consumer group.

### <a name="output_eventhub_auth_rule_id"></a> [eventhub\_auth\_rule\_id](#output\_eventhub\_auth\_rule\_id)

Description: The ID of the Event Hub-level authorization rule.

### <a name="output_namespace_auth_rule_id"></a> [namespace\_auth\_rule\_id](#output\_namespace\_auth\_rule\_id)

Description: The ID of the namespace-level authorization rule.

## Modules

The following Modules are called:

### <a name="module_auth_rules_eventhub"></a> [auth\_rules\_eventhub](#module\_auth\_rules\_eventhub)

Source: ../../modules/auth_rule

Version:

### <a name="module_auth_rules_namespace"></a> [auth\_rules\_namespace](#module\_auth\_rules\_namespace)

Source: ../../modules/auth_rule

Version:

### <a name="module_consumer_groups"></a> [consumer\_groups](#module\_consumer\_groups)

Source: ../../modules/consumer_group

Version:

<!-- markdownlint-disable-next-line MD041 -->
## Data Collection

The software may collect information about you and your use of the software and send it to Microsoft. Microsoft may use this information to provide services and improve our products and services. You may turn off the telemetry as described in the repository. There are also some features in the software that may enable you and Microsoft to collect data from users of your applications. If you use these features, you must comply with applicable law, including providing appropriate notices to users of your applications together with a copy of Microsoft’s privacy statement. Our privacy statement is located at <https://go.microsoft.com/fwlink/?LinkID=824704>. You can learn more about data collection and use in the help documentation and our privacy statement. Your use of the software operates as your consent to these practices.
<!-- END_TF_DOCS -->