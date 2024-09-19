# Scriptpath
$scriptPath = $($PSScriptRoot | Split-Path -Parent)

# Imports
. "$scriptPath\labs\lib\menus.ps1"
. "$scriptPath\labs\lib\vagrant.ps1"
. "$scriptPath\labs\lib\aws.ps1"
. "$scriptPath\labs\lib\azure.ps1"
. "$scriptPath\labs\lib\gcp.ps1"
. "$scriptPath\labs\lib\magalucloud.ps1"

# Fix scripts
& "C:\Program Files\Git\mingw64\bin\dos2unix.exe" $scriptPath\scripts\commons\*
Clear-Host