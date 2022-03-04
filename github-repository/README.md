# GitHub Repository Module


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.6 |
| <a name="requirement_github"></a> [github](#requirement\_github) | >= 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | >= 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [github_actions_secret.cicd_cloudrun_sa_secret](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_secret) | resource |
| [github_actions_secret.codacy_api_token](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_secret) | resource |
| [github_actions_secret.docker_registry_token](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_secret) | resource |
| [github_actions_secret.docker_registry_username](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_secret) | resource |
| [github_actions_secret.gcp_projectid_secret](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_secret) | resource |
| [github_branch_protection.main](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_protection) | resource |
| [github_repository.repository](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_codacy_api_token"></a> [codacy\_api\_token](#input\_codacy\_api\_token) | The API token for uploading coverage data | `string` | n/a | yes |
| <a name="input_docker_registry_token"></a> [docker\_registry\_token](#input\_docker\_registry\_token) | The API token for uploading images | `string` | n/a | yes |
| <a name="input_docker_registry_username"></a> [docker\_registry\_username](#input\_docker\_registry\_username) | The username for uploading images | `string` | n/a | yes |
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | The ID of the GCP project as the deployment target | `string` | n/a | yes |
| <a name="input_gcp_sa_private_key"></a> [gcp\_sa\_private\_key](#input\_gcp\_sa\_private\_key) | The private key of the GCP service account used for deployment | `string` | n/a | yes |
| <a name="input_target_repository_name"></a> [target\_repository\_name](#input\_target\_repository\_name) | The full name of the repository that is setup | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_repository"></a> [repository](#output\_repository) | n/a |
<!-- END_TF_DOCS -->
