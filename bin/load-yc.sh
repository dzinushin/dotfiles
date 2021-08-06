#!/bin/bash

export VAULT_TOKEN=$(curl -s -XPOST --data "{\"role_id\":\"${VAULT_YANDEX_AUTH_ROLE_ID}\",\"secret_id\":\"${VAULT_YANDEX_AUTH_SECRET_ID}\"}" ${VAULT_YANDEX_AUTH_HOST}/v1/auth/approle/login | jq -re .auth.client_token)
curl -s -XGET -H "X-Vault-Token: ${VAULT_TOKEN}" https://vault.ycloud.cian.tech/v1/yandex-tokens/data/keys/sa-gitlab | jq -re .data.data.key > cian.json
yc config set service-account-key cian.json
export CLOUD_ID=$(yc resource-manager cloud list --format json | jq -r '.[] | select(.name == "cloud-cianrugroup").id')
yc config set cloud-id $CLOUD_ID
export FOLDER_ID=$(yc resource-manager folder list --format json | jq -r '.[0].id')
yc config set folder-id $FOLDER_ID
