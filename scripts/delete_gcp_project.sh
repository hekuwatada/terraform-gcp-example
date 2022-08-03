#!/bin/bash

set -euo pipefail

declare -r GCP_PROJECT_ID="${1:-tf-test-20220803}"

gcloud projects delete "${GCP_PROJECT_ID}" --quiet