#Enable Containers
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All -All -NoRestart
Enable-WindowsOptionalFeature -Online -FeatureName Containers -All -NoRestart

#Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#Assign Chocolatey Packages to Install
$Packages = 'googlechrome',`
            'docker-desktop',`
            'visualstudiocode',`
            'git'

#Install Chocolatey Packages
ForEach ($PackageName in $Packages)
{choco install $PackageName -y}

#Install Visual Studio Code Extensions
$Extensions = 'ms-vscode.azurecli',`
              'msazurermtools.azurerm-vscode-tools',`
              'ms-vscode.azure-account',`
              'ms-python.python',`
              'ms-vscode.powershell',`
              'peterjausovec.vscode-docker'

#Install Packages
Set-ExecutionPolicy Bypass -Scope Process -Force
ForEach ($ExtensionName in $Extensions)
{cmd.exe /C "C:\Program Files\Microsoft VS Code\bin\code.cmd" --install-extension $ExtensionName}

#Install Python 3.6.4 and pylint
choco install python3 --version 3.6.4.20180116 -y
$command1 = @'
cmd.exe /C C:\Python36\python.exe -m pip install -U pylint --user
'@
Set-ExecutionPolicy Bypass -Scope Process -Force
Invoke-Expression -Command:$command1


#Bring down Desktop Shortcuts & VDC Bits
$zipDownload = "https://github.com/deltadan/vdcadmin/blob/master/lab-files/desktoplinks.zip?raw=true"
$downloadedFile = "D:\desktoplinks.zip"
$vmFolder = "C:\Users\Public\Desktop"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest $zipDownload -OutFile $downloadedFile
Add-Type -assembly "system.io.compression.filesystem"
[io.compression.zipfile]::ExtractToDirectory($downloadedFile, $vmFolder)

$zipDownload = "https://vdcstudentfiles.blob.core.windows.net/vdcworkshopfeb/studentfiles.zip"
$downloadedFile = "D:\studentfiles.zip"
$vmFolder = "C:\Source\vdc"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest $zipDownload -OutFile $downloadedFile
Add-Type -assembly "system.io.compression.filesystem"
[io.compression.zipfile]::ExtractToDirectory($downloadedFile, $vmFolder)

#Add LABVM UserId to docker group
Add-LocalGroupMember -Member vdcadmin -Group docker-users

#Reboot
Restart-Computer
