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
| [google_service_account.cicd_cloudrun_sa](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_service_account_key.cicd_cloudrun_sa_key](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | The GCP project id | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the service account | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_service_account_name"></a> [service\_account\_name](#output\_service\_account\_name) | n/a |
| <a name="output_service_account_private_key"></a> [service\_account\_private\_key](#output\_service\_account\_private\_key) | n/a |
<!-- END_TF_DOCS -->