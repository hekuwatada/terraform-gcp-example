# Terraform GCP example

## Goals
- [x] Use Terraform to create a resource in a GCP project
- [x] Tear down the resource
- [x] Run Terraform in a Docker container both natively and in VSCode

## How to run locally
1. Clone the repository
2. (Optional) Create a GCP project and service account for Terraform
```
gcloud auth login
export GCP_PROJECT_ID=tf-test-$(date "+%Y%m%d%H%M")
bash -x scripts/create_gcp_project.sh "${GCP_PROJECT_ID}"
bash -x scripts/create_sa.sh "${GCP_PROJECT_ID}"
```
3. Initialise this directory containing Terraform configuration files
```
terraform init
```
4. Validate configurations
```
terraform validate
```
5. Create an execution plan for a preview
```
terraform plan
```
6. (Optional) Enable Cloud Resource Manager API and Compute Engine API
```
# to check enabled apis
gcloud services list
```
7. Execute the actions according to the plan
```
terraform apply
```
8. Confirm that the VM has been created
```
gcloud compute instances list

# list resources in a Terraform state
terraform state list
```
9. Review a plan to destroy the created objects
```
terraform plan -destroy
```
10. Destroy all created objects
```
terraform destroy
```
11. Confirm that no objects exist
```
terraform state list

# below will prompt enabling Compute API when the API has been successfully disabled
gcloud compute instances list
```

## Appendix

### Prerequisite

1. Initialise this directory containing Terraform configuration files
```
terraform init
```

### Troubleshooting

#### _"Billing must be enabled for activation of service(s)"_
- Go to https://console.cloud.google.com/billing/
- Set up billing account

#### _"Error 403: Cloud Resource Manager API has not been used in project"_
- Enable API by following the URL provided as enabling it in Terraform did not work

#### _"Error 403: Compute Engine API has not been used in project"_
- Enable API by following the URL provided as enabling it in Terraform did not work

#### _"Error code 9, message: [Error in service 'compute.googleapis.com': Could not turn off service, as it still has resources in use."_
- Run `terraform destroy` again
- TODO: find a way to specify the order of managing resources
