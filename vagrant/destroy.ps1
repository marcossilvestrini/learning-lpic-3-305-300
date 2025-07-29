# Force PowerShell to use UTF-8 encoding
[Console]::OutputEncoding = [System.Text.UTF8Encoding]::new()

# Set working directory to script location
$WORKDIR = $PSScriptRoot
Set-Location -Path $WORKDIR

# Define base path for VMs
$vmPath = "E:\Servers\VMware"

# Destroy running Vagrant instances
Write-Host "🧨 Destroying Vagrant environments..."
vagrant destroy -f

# Remove Vagrant-related files
If (Test-Path "Vagrantfile") {
    Write-Host "🗑 Removing Vagrantfile..."
    Remove-Item -Path "Vagrantfile" -Force
}

If (Test-Path ".vagrant") {
    Write-Host "🗑 Removing .vagrant folder..."
    Remove-Item -Path ".vagrant" -Recurse -Force
}

# Remove all topic-related VM folders dynamically
Write-Host "🧹 Removing all VM folders matching 'lpic3-topic-*'..."
$folders = Get-ChildItem -Path $vmPath -Directory -Filter "lpic3-topic-*"

foreach ($folder in $folders) {
    $folderPath = $folder.FullName
    Write-Host "🗑 Removing folder: $folderPath"
    Remove-Item -Path $folderPath -Recurse -Force
}

# Remove VMware inventory file
$inventoryPath = "C:\Users\marcos.silvestrini\AppData\Roaming\VMware\inventory.vmls"
If (Test-Path $inventoryPath) {
    Write-Host "🗑 Removing VMware inventory: $inventoryPath"
    Remove-Item -Path $inventoryPath -Force
}

Write-Host "✅ Cleanup complete."
