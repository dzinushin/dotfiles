#!/bin/bash

yc config set service-account-key cian.json
# yc config get service-account-key

export CLOUD_ID=$(yc resource-manager cloud list --format json | jq -r '.[] | select(.name == "cloud-cianrugroup").id')
yc config set cloud-id $CLOUD_ID

# yc config get cloud-id

export FOLDER_ID=$(yc resource-manager folder list --format json | jq -r '.[0].id')
yc config set folder-id $FOLDER_ID

# yc config get folder-id

