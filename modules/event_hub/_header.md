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
