# DevOPS - Initial State - Terraform/Azure

Requirements:

- The azure account created
- The Service Principal set up
- Set the variables (used security variables to make the repo be cleaner) to be used across the commands (used in the github actions)
  - AZURE_CREDENTIALS
  - SUBSCRIPTION_ID
  - RESOURCE_GROUP_NAME
  - STORAGE_ACCOUNT_NAME
  - STORAGE_CONTAINER_NAME
  - STORAGE_REGION_NAME (In my test, is *brazilsouth*)
  - STORAGE_SKU_NAME

## Azure CLI

### Creating RBAC

`az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/{{SUBSCRIPTION_ID}}" --name="Azure-DevOps-GithubActions" --sdk-auth`

**Important**: Now copy/paste the output into the AZURE_CREDENTIALS variable

### Creating Resource Group
`az group create -g {{RESOURCE_GROUP_NAME}} -l {{STORAGE_REGION_NAME}}`

### Creating Storage Account 
`az storage account create -n {{STORAGE_ACCOUNT_NAME}} -g {{RESOURCE_GROUP_NAME}} -l {{STORAGE_REGION_NAME}} --sku {{STORAGE_SKU_NAME}}`

### Creating Storage Container
`az storage container create -n {{STORAGE_CONTAINER_NAME}} --account-name {{STORAGE_ACCOUNT_NAME}}`

## Azure x Terraform Parameters

- appId → client_id 
- password → client_secret
- tenant → tenant_id

## CI/CD

Using Github actions, it was created the following YML files:

- az-create-terraform-state.yml
  - To create the initial default terraform state
- az-destroy-terraform-state.yml
  - It will destroy all the resources related to state, including the resource group
- az-terraform-resource-create-test.yml
  - A test using the backend state file creating a resource
- az-terraform-resource-destroy-test.yml
  - A test using the backend state file destroying a resource

What is not covered:

- RBAC Azure command, why ?
- Because the output of this command is mandatory to have in the AZURE_CREDENTIALS file that is used across another commands to be able to login as Service Principal.

# References

**Microsoft**

- Github Actions
  - https://github.com/Azure/actions
  - https://github.com/Azure/login
  - https://github.com/Azure/CLI
  - https://github.com/marketplace/actions/azure-cli-action
  - https://docs.microsoft.com/en-us/azure/developer/github/github-actions
- CLI
  - Storage
    - https://docs.microsoft.com/en-us/cli/azure/storage?view=azure-cli-latest
    - SKU -> https://docs.microsoft.com/en-us/dotnet/api/microsoft.azure.management.storage.models.skuname?view=azure-dotnet
  - Resource Group
    - https://docs.microsoft.com/en-us/cli/azure/group?view=azure-cli-latest
  - AD Service Principal
    - https://docs.microsoft.com/en-us/cli/azure/ad/sp?view=azure-cli-latest
- Generic
  - Services available per region -> https://azure.microsoft.com/en-us/global-infrastructure/services/?regions=brazil-south,brazil-southeast&products=all

**Github**

- Using Github Actions -> https://docs.github.com/en/free-pro-team@latest/actions
- Encrypting the variables into secrets -> https://docs.github.com/en/free-pro-team@latest/actions/reference/encrypted-secrets

**Terraform**

- Provider 
  - https://github.com/terraform-providers/terraform-provider-azurerm
  - Checking releases -> https://github.com/terraform-providers/terraform-provider-azurerm/releases
- Backend -> https://www.terraform.io/docs/backends/types/azurerm.html
- With Github Actions
  - https://github.com/hashicorp/setup-terraform
  - https://github.com/marketplace/actions/hashicorp-setup-terraform
  - https://learn.hashicorp.com/tutorials/terraform/github-actions
  - https://nathan.kewley.me/2020-06-17-deploy-to-azure-using-terraform-and-github-actions/

**Externals**

- https://gmusumeci.medium.com/how-to-create-an-azure-remote-backend-for-terraform-67cce5da1520
- https://www.blendmastersoftware.com/blog/deploying-to-azure-using-terraform-and-github-actions