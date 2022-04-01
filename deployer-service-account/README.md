# Deployer Service Account Module

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.6 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.52.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.12.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_project_iam_binding.iam_binding_project](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_binding) | resource |
| [google_service_account.sa](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_deployer_sa_roles"></a> [additional\_deployer\_sa\_roles](#input\_additional\_deployer\_sa\_roles) | Additional roles that the deployer service account should own | `list` | `[]` | no |
| <a name="input_description"></a> [description](#input\_description) | The description of the service account | `string` | `""` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the service account | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The GCP project id | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_email"></a> [email](#output\_email) | n/a |
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
| <a name="output_service_account_email"></a> [service\_account\_email](#output\_service\_account\_email) | TODO: remove me |
| <a name="output_service_account_id"></a> [service\_account\_id](#output\_service\_account\_id) | TODO: remove me |
<!-- END_TF_DOCS -->