#!/bin/bash

set -euo pipefail

declare -r GCP_PROJECT_ID="${1:-tf-test-20220803}"

gcloud config set project "${GCP_PROJECT_ID}"

gcloud config configurations list

