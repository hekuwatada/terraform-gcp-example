#!/bin/bash

set -euo pipefail

declare -r GCP_PROJECT_ID="${1:-tf-test-20220803}"

# create a GCP project 
gcloud projects create "${GCP_PROJECT_ID}" \
    --name "tf-test" \
    --set-as-default

gcloud projects list

gcloud config set project "${GCP_PROJECT_ID}"
