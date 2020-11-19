# It's recommended pinning a specific version since new versions are released frequently
provider "azurerm" {
  version = "=2.36.0"
  features {}
}

terraform {
  required_version = ">= 0.13"
  backend "azurerm" {
    # using SP method to create the state of the backend
    resource_group_name  = "RESOURCE_GROUP_NAME"
    storage_account_name = "STORAGE_ACCOUNT_NAME"
    container_name       = "CONTAINER_NAME"
    # state name that will be created
    key                  = "terraform-test"
  }
}