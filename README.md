# DevOPS - Initial State - Terraform/Azure

## Creating RBAC

az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/{{SUBSCRIPTION_ID}}" --name="Azure-DevOps-GithubActions" --sdk-auth

*As side note, the "-**-sdk-auth**" is required.*

## Set Subscription
az account set --subscription {{SUBSCRIPTION_ID}}

## Create Resource Group
az group create -g {{RESOURCE_GROUP_NAME}} -l {{STORAGE_REGION_NAME}

## Create Storage Account 
az storage account create -n {{STORAGE_ACCOUNT_NAME}} -g {{RESOURCE_GROUP_NAME}} -l {{STORAGE_REGION_NAME}} --sku {{STORAGE_SKU_NAME}

## Create Storage Container
az storage container create -n {{STORAGE_CONTAINER_NAME}} --account-name {{STORAGE_ACCOUNT_NAME}}

## Azure x Terraform parameters

- appId (Azure) → client_id (Terraform).
- password (Azure) → client_secret (Terraform).
- tenant (Azure) → tenant_id (Terraform).

# References

**Microsoft**

- Github Actions
  - https://github.com/Azure/actions
  - https://github.com/Azure/login
  - https://github.com/Azure/CLI
  - https://github.com/marketplace/actions/azure-cli-action
- Storage
  - https://docs.microsoft.com/en-us/cli/azure/storage?view=azure-cli-latest

**Externals**

- https://gmusumeci.medium.com/how-to-create-an-azure-remote-backend-for-terraform-67cce5da1520
- https://www.blendmastersoftware.com/blog/deploying-to-azure-using-terraform-and-github-actions