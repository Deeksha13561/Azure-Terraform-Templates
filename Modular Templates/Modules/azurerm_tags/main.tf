
# https://github.com/claranet/terraform-azurerm-tagging
locals {
  tags = join(" ", formatlist("%s=\"%s\"", keys(var.azurerm_tags), values(var.azurerm_tags)))
}

data "azurerm_client_config" "current" {}

resource "null_resource" "tags" {

  count = var.nb_resources

  triggers = {
    resource    = var.resource_ids[count.index]
    tags        = jsonencode(var.azurerm_tags)
    force-apply = var.force ? uuid() : false
    behavior    = var.behavior
  }

  # Code found here https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-using-tags#code-try-22
  provisioner "local-exec" {
    interpreter = ["PowerShell", "-Command"]
    command = templatefile("../azurerm_tags/tag.ps1.tmpl",
      {
        behavior        = var.behavior
        resource_id     = var.resource_ids[count.index]
        tags            = local.tags
        subscription_id = data.azurerm_client_config.current.subscription_id
      }
    )
  }

}