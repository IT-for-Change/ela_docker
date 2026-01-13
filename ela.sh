#!/bin/bash

# Check if the TAG argument is provided
if [ -z "$1" ]; then
  echo "Error: TAG is required as an argument."
  echo "Usage: $0 <TAG>"
  exit 1
fi

# Assign TAG to the first argument
TAG=$1

export APPS_JSON_BASE64=$(base64 -w 0 apps.json)
echo ${APPS_JSON_BASE64}

# Run the docker build command with the specified tag
docker build \
  --no-cache \
  --progress=plain \
  --build-arg FRAPPE_BRANCH=version-15 \
  --build-arg APPS_JSON_BASE64=$APPS_JSON_BASE64 \
  --file images/layered/Containerfile \
  --tag ela:$TAG .
