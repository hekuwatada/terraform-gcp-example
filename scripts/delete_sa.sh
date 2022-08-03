#!/bin/bash

set -euo pipefail

declare -r GCP_PROJECT_ID="${1:-tf-test-20220803}"
declare -r SA_NAME='terraform-sa'
declare -r SA_ID="${SA_NAME}"@"${GCP_PROJECT_ID}".iam.gserviceaccount.com

gcloud iam service-accounts delete --quiet "${SA_ID}" 

gcloud iam service-accounts list