#!/bin/bash
# execute with `source ./.scripts/local-env-setup.sh`

IFS=$'
'
declare -a describe=($(wdiov5/node_modules/sfdx-cli/bin/run force:org:display --json))
echo $describe
declare -a accessToken=($(echo $describe | grep -o '"accessToken": *"[^"]*"' | grep -o '[^"]*"$' | sed "s/\"//" ))
declare -a instanceUrl=($(echo $describe | grep -o '"instanceUrl": *"[^"]*"' | grep -o '[^"]*"$' | sed "s/\"//" ))
unset IFS

export SALESFORCE_ACCESS_TOKEN=${accessToken}
export SALESFORCE_INSTANCE_URL=${instanceUrl}

echo "SALESFORCE_ACCESS_TOKEN=${SALESFORCE_ACCESS_TOKEN}"
echo "SALESFORCE_INSTANCE_URL=${SALESFORCE_INSTANCE_URL}"

echo 'Local env vars exported.'
