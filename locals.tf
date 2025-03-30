locals {
  event_hubs_outputs = {
    for hub_key, hub_module in module.event_hubs :
    hub_key => {
      name          = hub_module.name
      partition_ids = hub_module.partition_ids
    }
  }
  # Private endpoint application security group associations
  # Remove if this resource does not support private endpoints
  private_endpoint_application_security_group_associations = { for assoc in flatten([
    for pe_k, pe_v in var.private_endpoints : [
      for asg_k, asg_v in pe_v.application_security_group_associations : {
        asg_key         = asg_k
        pe_key          = pe_k
        asg_resource_id = asg_v
      }
    ]
  ]) : "${assoc.pe_key}-${assoc.asg_key}" => assoc }
  role_definition_resource_substring = "/providers/Microsoft.Authorization/roleDefinitions"
}
