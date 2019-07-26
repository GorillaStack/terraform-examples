# Terraform Examples

Some example GorillaStack Terraform templates to help you get started

## Getting Started

Clone the repository or copy down the templates manually. Please:

1. Make sure you have `variables.tf` file. This defines the variables that we need for our [terraform provider](https://github.com/GorillaStack/terraform-provider-gorillastack).
1. Rename the `examples.tfvars` file, for example `mv examples.tfvars variables.tfvars`. Our `.gitignore` file ignores all `.tfvars` files, other than `examples.tfvars`. Please be sure to rename this file so that you avoid accidentally committing your API key and Team Id to any repository.
1. Enter your TeamId and API Key into the renamed `.tfvars` file.
1. Make sure that you have [installed the GorillaStack Terraform Provider](https://github.com/GorillaStack/terraform-provider-gorillastack).
 
