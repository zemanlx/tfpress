# TFpress

TFpress is an example of deployment WordPress into Google Kubernetes Engine using Helm and Terraform.

## Prerequisites

- Installed `terraform` version `0.12.0` or higher. See installation [instructions](https://learn.hashicorp.com/terraform/getting-started/install.html).
- Installed and initialized [Google Cloud SDK](https://cloud.google.com/sdk/) for a project that will be used for deployment.

## Setup

- Configure the environment for Terraform:

    ```shell
    gcloud auth application-default login
    ```

- Check all variables in `variables.tf`. The only required is `project_id`. Variables can be set as environment variables with `TF_VAR_` prefix

    ```shell
    export TF_VAR_project_id=your_project_id
    ```

- Initialize Terraform

    ```shell
    terraform init
    ```

## Deployment

Apply configuration

```shell
terraform apply
```

After successful deployment, you should see access information like this

```ini
Outputs:

wordpress_URL = https://34.76.58.252
wordpress_user_name = user
wordpress_user_password = 9K3ZkcMqLQ
```

## Cleanup

To delete all resources created for this deployment run

```shell
terraform destroy
```
