# Azure Virtual Datacenter Admin Workstation
This one click deployment will build a VDC Admin & Development box in Azure.  All of the tools required to build and admin a VDC are installed.

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fdeltadan%2Fvdcadmin%2Fmaster%2Fazure-deploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>

**Software included on the VM**

1. Docker for Windows Community Edition
1. Git for Windows (bash)
1. Visual Studio Code with Extentions: Azure ARM Tools, Azure CLI, Python Linting, Docker, PowerShell
1. Python 3.6.4

**Creds**
1. User: vdcadmin
1. Password: Password.1!!

**Starting Docker**
1. Once the VM is deployed use the Azure portal to connect.
1. Double click the Docker for Windows shortcut on the desktop.
1. It will take a few minutes for Docker to start the first time.
1. The VDC Repo will be placed on the desktop - Right-click and Open with VSCode

![alt text](https://github.com/deltadan/windows10docker/blob/master/media/dockerrun.png "Docker is Running on Windows 10 in Azure!")
