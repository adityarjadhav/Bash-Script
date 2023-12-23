#!/bin/bash

# Define an array of repository directories to searching for "azure-pipelines.yml" files
repositories=("tfmod_gcp_dns" "tfmod_gcp_ilb_17_serverless" "dxp_liferay" "tfmod_gcp_gke_nodepool" "tfmod_gop_bq_dataset" "tfmod_gcp_billing_budget" "rubrik_gcp" "portfolio_se_gcp" "tfmod_gcp_net_interconnect_direct_attach" "tfmod_k8_automation" "timod_gcp_gcs" "sandbox_iac_archetype")  # Add your repository directories here

# Content to add to "azure-pipelines.yml" files
content="paths:
  exclude:
    - README.md"

# Loop through each repo directory
for repository in "${repositories[@]}"; do
  if [ -d "$repository" ]; then
# Use a loop(for loop) to find and modify each "azure-pipelines.yml" file
    for file in $(find "$repository" -type f -name "azure-pipelines.yml"); do
      # Use sed to append the content after the "trigger" section
      sed -i '/trigger:/a\'"$content" "$file"
      echo "Content added to azure-pipelines.yml in $repository."
    done
  else
    echo "Repository $repository does not exist."
  fi
done
