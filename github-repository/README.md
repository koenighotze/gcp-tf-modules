# GitHub Repository Module


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
| <a name="provider_github"></a> [github](#provider\_github) | >= 4.0 |
| <a name="provider_google"></a> [google](#provider\_google) | >= 3.52.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [github_actions_secret.gcp_projectid_secret](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_secret) | resource |
| [github_branch_protection.main](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_protection) | resource |
| [github_repository.repository](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [google_service_account.deployer_sa](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/service_account) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_codacy_api_token"></a> [codacy\_api\_token](#input\_codacy\_api\_token) | The API token for uploading coverage data | `string` | n/a | yes |
| <a name="input_container_registry"></a> [container\_registry](#input\_container\_registry) | The container registry for OCI images | `string` | n/a | yes |
| <a name="input_deployer_service_account_email"></a> [deployer\_service\_account\_email](#input\_deployer\_service\_account\_email) | The email of the service account used in ci/cd | `string` | n/a | yes |
| <a name="input_docker_registry_token"></a> [docker\_registry\_token](#input\_docker\_registry\_token) | The API token for uploading images | `string` | `""` | no |
| <a name="input_docker_registry_username"></a> [docker\_registry\_username](#input\_docker\_registry\_username) | The username for uploading images | `string` | `""` | no |
| <a name="input_github_admin_token"></a> [github\_admin\_token](#input\_github\_admin\_token) | The API Token for the GitHub API | `string` | n/a | yes |
| <a name="input_github_non_admin_token"></a> [github\_non\_admin\_token](#input\_github\_non\_admin\_token) | The API Token for the GitHub API to be used on pull requests | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID of the GCP project as the deployment target | `string` | n/a | yes |
| <a name="input_target_repository_name"></a> [target\_repository\_name](#input\_target\_repository\_name) | The full name of the repository that is setup | `string` | n/a | yes |
| <a name="input_terraform_state_bucket"></a> [terraform\_state\_bucket](#input\_terraform\_state\_bucket) | The name of the bucket to store TF state in | `string` | n/a | yes |
| <a name="input_workload_identity_pool_id"></a> [workload\_identity\_pool\_id](#input\_workload\_identity\_pool\_id) | The id of the workload identity pool | `string` | n/a | yes |
| <a name="input_workload_identity_provider_name"></a> [workload\_identity\_provider\_name](#input\_workload\_identity\_provider\_name) | The name of the workload identity provider | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_full_name"></a> [full\_name](#output\_full\_name) | n/a |
<!-- END_TF_DOCS -->
