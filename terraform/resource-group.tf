resource "azurerm_resource_group" "rg-azure-test" {
  name     = var.resource_group_name
  location = var.region
}