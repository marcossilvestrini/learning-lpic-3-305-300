# Scriptpath
$scriptPath = $PSScriptRoot

# Vagrant folder
$vagrantPath= "$($scriptPath | Split-Path -Parent)\vagrant"

# Imports
. "$scriptPath\vagrant.ps1"
. "$scriptPath\aws.ps1"

# Clear
Clear-Host

# Function to display the menu with colors
function Show-Menu {
    param (
        [string]$prompt = 'Select an option:'
    )

    Write-Host "`nLPIC3 305-300 Labs`n"
    Write-Host "1. " -NoNewline; Write-Host "Up Lab Topic 351" -ForegroundColor Cyan
    Write-Host "2. " -NoNewline; Write-Host "Up Lab Topic 352" -ForegroundColor Yellow
    Write-Host "3. " -NoNewline; Write-Host "Up Lab Topic 353" -ForegroundColor Green
    Write-Host "4. " -NoNewline; Write-Host "Destroy Lab" -ForegroundColor Red
    Write-Host "5. " -NoNewline; Write-Host "Exit" -ForegroundColor Magenta
    Write-Host $prompt -NoNewline
}

# Function to display provider menu
function Show-ProviderMenu {
    param (
        [string]$prompt = 'Select a provider:'
    )

    Write-Host "`nSelect a provider`n"
    Write-Host "1. " -NoNewline; Write-Host "VMware Workstation" -ForegroundColor Cyan
    Write-Host "2. " -NoNewline; Write-Host "VirtualBox" -ForegroundColor Yellow
    Write-Host "3. " -NoNewline; Write-Host "AWS" -ForegroundColor Green
    Write-Host "4. " -NoNewline; Write-Host "GCP" -ForegroundColor Blue
    Write-Host "5. " -NoNewline; Write-Host "Azure" -ForegroundColor Magenta
    Write-Host "6. " -NoNewline; Write-Host "Magalucloud" -ForegroundColor White
    Write-Host $prompt -NoNewline
}

# Function to destroy lab
function Show-DestroyLab {
    param (
        [string]$provider
    )

    Write-Host "`nDestroying lab for provider: $provider" -ForegroundColor Yellow
    switch ($provider) {
        "vmware_workstation" { DestroyVagrant -provider $provider }
        "virtualbox" { DestroyVagrant -provider $provider }
        "aws" { DestroyAWS }
        "gcp" { DestroyGCP }
        "azure" { DestroyAzure }
        "magalucloud" { DestroyMagalucloud }
        default {
            Write-Host "`nInvalid provider option." -ForegroundColor Red
            return
        }
    }   
    Write-Host "`nLab destroyed successfully!" -ForegroundColor Green
}

# Menu loop
do {
    Show-Menu
    $choice = Read-Host

    if ($choice -in 1..3) {
        Show-ProviderMenu
        $providerChoice = Read-Host

        switch ($providerChoice) {
            "1" { 
                $provider = "vmware_workstation"
                $box = "silvestrini-rocky9"            
                Copy-Vagrantfile -source "$vagrantPath\Vagrantfile-topic-35$choice" -box $box
                VagrantUp -provider $provider
            }
            "2" { 
                $provider = "virtualbox"
                $box = "silvestrini-ol9"
                Copy-Vagrantfile -source "$vagrantPath\Vagrantfile-topic-35$choice" -box $box
                VagrantUp -provider $provider
            }
            "3" {
                ProvisionAWS
            }
            "4" {
                ProvisionGCP
            }
            "5" {
                ProvisionAzure
            }
            "6" {
                ProvisionMagalucloud
            }
            default {
                Write-Host "`nInvalid provider option." -ForegroundColor Red
            }
        }
    } elseif ($choice -eq "4") {
        Show-ProviderMenu
        $providerChoice = Read-Host
        switch ($providerChoice) {
            "1" { Show-DestroyLab -provider "vmware_workstation" }
            "2" { Show-DestroyLab -provider "virtualbox" }
            "3" { Show-DestroyLab -provider "aws" }
            "4" { Show-DestroyLab -provider "gcp" }
            "5" { Show-DestroyLab -provider "azure" }
            "6" { Show-DestroyLab -provider "magalucloud" }
            default {
                Write-Host "`nInvalid provider option." -ForegroundColor Red
                continue
            }
        }
    } elseif ($choice -eq "5") {
        Write-Host "`nExiting script..." -ForegroundColor Magenta
        $exit = $true
    } else {
        Write-Host "`nInvalid option. Please select a valid option." -ForegroundColor Red
    }

    # Wait before showing the menu again
    Start-Sleep -Seconds 2

} while (-not $exit)
