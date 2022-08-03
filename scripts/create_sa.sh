#!/bin/bash

set -euo pipefail

declare -r GCP_PROJECT_ID="${1:-tf-test-20220803}"
declare -r SA_NAME='terraform-sa'
declare -r SA_ID="${SA_NAME}"@"${GCP_PROJECT_ID}".iam.gserviceaccount.com
declare -r SA_JSON='sa-key.json'

gcloud iam service-accounts create "${SA_NAME}" \
    --display-name "Terraform service account ${SA_NAME}" 

gcloud iam service-accounts list

# TODO: update the role be less permissive
gcloud projects add-iam-policy-binding "${GCP_PROJECT_ID}" \
    --member=serviceAccount:"${SA_ID}" \
    --role=roles/owner 

gcloud iam service-accounts keys create "${SA_JSON}" \
    --iam-account="${SA_ID}"

#export GOOGLE_APPLICATION_CREDENTIALS="${SA_JSON}"
