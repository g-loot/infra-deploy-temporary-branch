#!/bin/bash

curl \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $INPUT_GITHUB_TOKEN" \
  $INPUT_DEPLOYMENT_FILE \
  | jq -r '.content' | base64 -d | yq -r '.spec.values |select( . != null )' > values.yaml
