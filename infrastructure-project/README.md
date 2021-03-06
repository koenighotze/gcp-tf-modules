# Infrastructure Project Module

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.6 |
| <a name="requirement_github"></a> [github](#requirement\_github) | >= 4.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.52.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | 4.20.0 |
| <a name="provider_google"></a> [google](#provider\_google) | 4.12.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [github_actions_secret.gcp_projectid_secret](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_secret) | resource |
| [github_branch_protection.main](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_protection) | resource |
| [github_repository.infrastructure_repository](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [google_project_iam_audit_config.audit](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_audit_config) | resource |
| [google_project_service.common_project_services](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |
| [google_service_account_iam_binding.workload_identity_sa_binding](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account_iam_binding) | resource |
| [google_storage_bucket.state_bucket](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |
| [google_storage_bucket_iam_member.bucket_iam_member](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_iam_member) | resource |
| [google_project.project](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/project) | data source |
| [google_service_account.sa](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/service_account) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_project_apis"></a> [additional\_project\_apis](#input\_additional\_project\_apis) | List of additional apis to be activated on this project | `list` | `[]` | no |
| <a name="input_codacy_api_token"></a> [codacy\_api\_token](#input\_codacy\_api\_token) | The API token for uploading coverage data | `string` | n/a | yes |
| <a name="input_container_registry"></a> [container\_registry](#input\_container\_registry) | The container registry for OCI images | `string` | n/a | yes |
| <a name="input_docker_registry_token"></a> [docker\_registry\_token](#input\_docker\_registry\_token) | The API token for uploading images | `string` | `""` | no |
| <a name="input_docker_registry_username"></a> [docker\_registry\_username](#input\_docker\_registry\_username) | The username for uploading images | `string` | `""` | no |
| <a name="input_github_admin_token"></a> [github\_admin\_token](#input\_github\_admin\_token) | The API Token for the GitHub API | `string` | n/a | yes |
| <a name="input_github_api_label_token"></a> [github\_api\_label\_token](#input\_github\_api\_label\_token) | The API Token for the GitHub API with fewer privileges used for pull requests | `string` | n/a | yes |
| <a name="input_github_org_name"></a> [github\_org\_name](#input\_github\_org\_name) | n/a | `string` | `"koenighotze"` | no |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | `"europe-west3"` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The id of the project | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The name of the project | `string` | n/a | yes |
| <a name="input_service_account_email"></a> [service\_account\_email](#input\_service\_account\_email) | The Email of the Admin service account for this project | `string` | n/a | yes |
| <a name="input_workload_identity_pool_id"></a> [workload\_identity\_pool\_id](#input\_workload\_identity\_pool\_id) | The id of the workload identity pool | `string` | n/a | yes |
| <a name="input_workload_identity_provider_name"></a> [workload\_identity\_provider\_name](#input\_workload\_identity\_provider\_name) | The name of the workload identity provider | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_github_repository_full_name"></a> [github\_repository\_full\_name](#output\_github\_repository\_full\_name) | n/a |
| <a name="output_github_repository_id"></a> [github\_repository\_id](#output\_github\_repository\_id) | n/a |
| <a name="output_state_bucket_url"></a> [state\_bucket\_url](#output\_state\_bucket\_url) | n/a |
<!-- END_TF_DOCS -->