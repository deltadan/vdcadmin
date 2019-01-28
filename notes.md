vdcadmin
Password.1!!


1. Need to have the student login to box and start docker
1. Need to enable sharing to C: drive
1. Build Docker Image using VSCode - name it vdc:latest
1. run docker run -v c:/users/public/desktop/vdc/modules -v c:/users/public/desktop/vdc/archetypes -it vdc:latest
1. login into azure using admin ID az login
1. az account set -s "SUB_NAME"
1. create SPN az ad sp create-for-rbac --role=Contributor --scopes=/subscriptions/FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF --name=your-spn-name