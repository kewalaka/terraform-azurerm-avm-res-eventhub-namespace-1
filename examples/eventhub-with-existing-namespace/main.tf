terraform {
  required_version = ">= 1.3.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

provider "azurerm" {
  features {}
  resource_provider_registrations = "none"
}

# This ensures we have unique CAF compliant names for our resources.
module "naming" {
  source  = "Azure/naming/azurerm"
  version = "0.3.0"
}

# This is required for resource modules
resource "azurerm_resource_group" "this" {
  location = "australiaeast"
  name     = module.naming.resource_group.name_unique
}

resource "azurerm_eventhub_namespace" "this" {
  location            = azurerm_resource_group.this.location
  name                = module.naming.eventhub.name_unique
  resource_group_name = azurerm_resource_group.this.name
  sku                 = "Standard"
}

locals {
  event_hubs = {
    my_hub1 = {
      namespace         = { resource_id = azurerm_eventhub_namespace.this.id }
      partition_count   = 2
      message_retention = 3
    }
    # Add more event hubs if needed
  }
}

module "event_hub" {
  for_each = local.event_hubs
  source   = "../../modules/event_hub"
  # source             = "Azure/avm-<res/ptn>-<name>/azurerm"
  # ...
  enable_telemetry = false

  name              = module.naming.eventhub_namespace.name_unique
  namespace         = each.value.namespace
  partition_count   = each.value.partition_count
  message_retention = each.value.message_retention
}
