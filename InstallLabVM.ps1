#Enable Containers
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All -All -NoRestart
Enable-WindowsOptionalFeature -Online -FeatureName Containers -All -NoRestart

#Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#Assign Packages to Install
$Packages = 'googlechrome',`
            'docker-for-windows',`
            'visualstudiocode',`
            'git'

#Install Packages
ForEach ($PackageName in $Packages)
{choco install $PackageName -y}

#Install Visual Studio Code Extensions
& 'C:\Program Files\Microsoft VS Code\bin\code.cmd' --install-extension msazurermtools.azurerm-vscode-tools
& 'C:\Program Files\Microsoft VS Code\bin\code.cmd' --install-extension ms-vscode.azure-account
& 'C:\Program Files\Microsoft VS Code\bin\code.cmd' --install-extension ms-vscode.azurecli
& 'C:\Program Files\Microsoft VS Code\bin\code.cmd' --install-extension ms-python.python


#Add Demo User to docker group
Add-LocalGroupMember -Member stormtrooperio -Group docker-users

#Bring down Desktop Shortcuts and Student Files
$zipDownload = "https://github.com/deltadan/vdcadmin/blob/master/studentfiles.zip?raw=true"
$downloadedFile = "D:\shortcuts.zip"
$vmFolder = "C:\Users\Public\Desktop"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest $zipDownload -OutFile $downloadedFile
Add-Type -assembly "system.io.compression.filesystem"
[io.compression.zipfile]::ExtractToDirectory($downloadedFile, $vmFolder)

#Reboot
Restart-Computer