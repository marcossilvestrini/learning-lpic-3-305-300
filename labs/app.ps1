# Scriptpath
$workdir_app = $($PSScriptRoot | Split-Path -Parent)

# Clear screen
Clear-Host

# Fix scripts
& "C:\Program Files\Git\mingw64\bin\dos2unix.exe" $workdir_app\scripts\commons\*

# Imports
. "$workdir_app\labs\lib\vagrant.ps1"
. "$workdir_app\labs\lib\aws.ps1"
. "$workdir_app\labs\lib\azure.ps1"
. "$workdir_app\labs\lib\gcp.ps1"
. "$workdir_app\labs\lib\magalucloud.ps1"
. "$workdir_app\labs\lib\menus.ps1"
