vdcadmin
Password.1!!


1. Need to have the student login to box and start docker
1. Need to enable sharing to C: drive
1. Build Docker Image using VSCode - name it vdc:latest
1. run docker run -v c:/users/public/desktop/vdc/modules -v c:/users/public/desktop/vdc/archetypes -it vdc:latest
1. login into azure using admin ID az login az accoutn show
1. az account set -s "SUB_NAME"
1. create SPN az ad sp create-for-rbac --role=Contributor --scopes=/subscriptions/FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF --name=your-spn-name

docker run -v c:/source/vdc:/usr/src/app -it vdc:latest

run on prem deployment
1. updated the config.json for the on-prem archetype
2. run the vdc.py automation which needs to reference first create or validate, then "env" "path to config.json then pass
uploadscripts which uploads the customer scripts are for all archtypes (remember if you ever update any CS you need to pass this
at least once to upload them all again or you won't get the correct script)
python vdc.py create on-premises -path archetypes/on-premises/config.json --upload-scripts

outputs will appear in the storage account
the parameters container will have containers for each module
inside of those will be json outputs from the deployments which will then be used
to inform the dependent deployments.
dependencies are defined in the archetype config.json ( changes to an archetype could require you to add new dependencies)

python vdc.py create on-premises -path archetypes/on-premises/config.json --upload-scripts
docker run -v c:/source/vdcupdate:/usr/src/app -it vdc:latest

        "organization-name": "fabrikam",
        "tenant-id": "b590c310-f80d-4c5b-981f-7dc9c87ea414",
        "deployment-user-id": "05fbfbbd-447b-4270-b472-ffcd912646cf",
        "vdc-storage-account-name": "fabvdcstorage",
        "vdc-storage-account-rg": "fab-vdcstorage-rg",
        "module-deployment-order":[

              "on-premises": {
        "subscription-id": "0d1a176a-24aa-4490-83d7-957707a93b4d",
    },
    "shared-services": {
        "subscription-id": "2bbc4db2-62c4-49aa-b2c5-9e4a34e83246",
        "deployment-name": "ssvcs",


docker run -v c:/source/vdcupdate:/usr/src/app -it vdc:latest

        az login
        az account set -s "vdc2-onprem"
python vdc.py create on-premises -path archetypes/on-premises/config.json --upload-scripts
