Clear-RecycleBin -Force

pip cache purge
npm cache clean --force

Remove-Item -Path "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue

# Clear Windows Update Cache
Stop-Service -Name wuauserv
Remove-Item -Path "C:\Windows\SoftwareDistribution\Download\*" -Recurse -Force -ErrorAction SilentlyContinue
Start-Service -Name wuauserv

# Clear PowerShell Module Cache
Remove-Item -Path "$env:USERPROFILE\Documents\PowerShell\Modules\*" -Recurse -Force -ErrorAction SilentlyContinue

# Clear Docker Cache (if Docker is installed)
docker system prune -a --volumes

#Chrome Cache
Remove-Item -Path "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Cache\*" -Recurse -Force -ErrorAction SilentlyContinue

cleanmgr /sagerun:1


#Restore points

vssadmin delete shadows /all

#Windows package cace
Remove-Item -Path "C:\ProgramData\Package Cache\*" -Recurse -Force -ErrorAction SilentlyContinue
