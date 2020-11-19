# DevOPS - Initial State - Terraform/Azure

## Creating RBAC

Example command: az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/{{SUBSCRIPTION_ID}}" --name="Azure-DevOps-GithubActions" --sdk-auth

## Creating Resource Group
az group create -g {{RESOURCE_GROUP_NAME}} -l {{STORAGE_REGION_NAME}

## Creating Storage Account 
az storage account create -n {{STORAGE_ACCOUNT_NAME}} -g {{RESOURCE_GROUP_NAME}} -l {{STORAGE_REGION_NAME}} --sku {{STORAGE_SKU_NAME}

## Creating Storage Container
az storage container create -n {{STORAGE_CONTAINER_NAME}} --account-name {{STORAGE_ACCOUNT_NAME}}

## Azure x Terraform Parameters

- appId → client_id 
- password → client_secret
- tenant → tenant_id

# References

**Microsoft**

- Github Actions
  - https://github.com/Azure/actions
  - https://github.com/Azure/login
  - https://github.com/Azure/CLI
  - https://github.com/marketplace/actions/azure-cli-action
- CLI
  - Storage
    - https://docs.microsoft.com/en-us/cli/azure/storage?view=azure-cli-latest
  - Resource Group
    - https://docs.microsoft.com/en-us/cli/azure/group?view=azure-cli-latest
  - AD Service Principal
    - https://docs.microsoft.com/en-us/cli/azure/ad/sp?view=azure-cli-latest

**Externals**

- https://gmusumeci.medium.com/how-to-create-an-azure-remote-backend-for-terraform-67cce5da1520
- https://www.blendmastersoftware.com/blog/deploying-to-azure-using-terraform-and-github-actions