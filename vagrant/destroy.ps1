# Variables
$WORKDIR =  $PSScriptRoot
$vmPAth = "E:\Servers\VMware"
$vms=(
    "instance-1",
    "instance-2"
)

# Set workdir
Set-Location -Path $WORKDIR

# Destroy instances
vagrant destroy -f

# Remove vagrant files
If(Test-Path Vagrantfile) {
    Write-Host "Vagrantfile removed"
    Remove-Item -Path Vagrantfile -Recurse -Force
}
If(Test-Path ".vagrant") {
    Write-Host "Folder .vagrant removed"
    Remove-Item -Path ".vagrant" -Recurse -Force
}

# Remove VMs folders
$vms | ForEach-Object {
    $vmFolder = "$vmPAth\lpic3-topic-351-$_"    
    If(Test-Path $vmFolder) {    
        Write-Host "Folder $vmFolder removed"
        Remove-Item -Path $vmFolder -Recurse -Force
    }
}
 Start-Sleep 100000