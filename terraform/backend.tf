# It's recommended pinning a specific version since new versions are released frequently
provider "azurerm" {
  version = "=2.36.0"
  features {}
}

terraform {
  backend "azurerm" {
    storage_account_name = "satsoutello"
    container_name       = "terraform-state"
    key                  = "terraform-test"
  }
}