#!/bin/bash
# execute with `bash scripts/create-scratch-org.sh`

orgName=`hostname;date`
orgName="$(echo -e "${orgName}" | tr -d '[:space:]')"

## Create the org
sfdx force:org:create -s -f config/project-scratch-def.json -a $orgName --setdefaultusername
sfdx force:user:password:generate -u $orgName

#push code to org
sfdx force:source:push -f

# Set permission set
# sfdx force:user:permset:assign -n Parsable_Admin 

# Add test data
sfdx force:data:tree:import -p config/test-data.json
echo "Test data added to the scratch Org"

# Open the newly created org
sfdx force:org:open

# To save scratch data into a json (to use for login)
sfdx force:org:display --json > result.json

# set enviroment values
# source scripts/local-env-setup.sh

#To pull data from scratch
# sfdx force:source:pull 

#To fix pull issues "Entity of type 'CustomApplication' named 'Case' cannot be found"
# sfdx force:data:soql:query -q "Select Id, MemberName From SourceMember Where MemberType = 'CustomApplication'" -t
# sfdx force:data:record:delete -s SourceMember -i SOURCEMEMBERID -t -u SCRATCHUSERNAME
