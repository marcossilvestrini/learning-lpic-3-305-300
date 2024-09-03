# Scriptpath
$scriptPath = $PSScriptRoot | Split-Path -Parent

# Machine folder
$vmware_folder = "E:/Servers/VMware"

# Fix scripts
& "C:\Program Files\Git\mingw64\bin\dos2unix.exe" $scriptPath\scripts\commons\*
Clear-Host

# Function to copy the files
function Copy-Vagrantfile {
    param (
        [string]$source,
        [string]$destination = "Vagrantfile",
        [string]$box
    )

    if (Test-Path $source) {
        $vagrantfileContent = Get-Content -Path $source

        # Replace the placeholder with the selected box
        $vagrantfileContent = $vagrantfileContent -replace 'CONFIG_VM_BOX_PLACEHOLDER', $box

        $vagrantfileContent | Set-Content -Path $destination -Force
        Write-Host "`nFile '$source' copied to '$destination' successfully with box '$box'!" -ForegroundColor Green
    } else {
        Write-Host "`nError: File '$source' not found." -ForegroundColor Red
    }
}

# Function to vagrant up
function VagrantUp {
    param (
        [string]$provider,
        [string]$key
    )

    if (vagrant validate) {
        Write-Host "`nVagrantfile valid! Your instances are provisioning..." -ForegroundColor Green
        Write-Host "`nProvider: $provider" -ForegroundColor Yellow        
        vagrant up --provider $provider
        Copy-Item ".vagrant/machines/lpic3-topic-351-1/$provider/private_key" -Destination "f:\\Projetos\\vagrant-pk\\$provider-lpic3-topic-351-1"        
    } else {
        Write-Host "`nError: Vagrantfile not valid" -ForegroundColor Red
    }
}

# Function to destroy lab
function DestroyLab {
    param (
        [string]$provider
    )

    Write-Host "`nDestroying lab for provider: $provider" -ForegroundColor Yellow
    if ($provider -eq "vmware_workstation" -or $provider -eq "virtualbox") {
        vagrant destroy -f
        # Delete vmware machines folder
        If(Test-Path "$vmware_folder/lpic3-topic-351-1"){Remove-Item "$vmware_folder/lpic3-topic-351-1" -Recurse -Force}        
    } else {
        switch ($provider) {
            "aws" { DestroyAWS }
            "gcp" { DestroyGCP }
            "azure" { DestroyAzure }
            "magalucloud" { DestroyMagalucloud }
            default {
                Write-Host "`nInvalid provider option." -ForegroundColor Red
                return
            }
        }
    }
    Write-Host "`nLab destroyed successfully!" -ForegroundColor Green
}

# Function to provision AWS instance
function ProvisionAWS {
    Write-Host "`nProvisioning AWS instance..." -ForegroundColor Green
    # Add logic to provision AWS instance
}

# Function to provision GCP instance
function ProvisionGCP {
    Write-Host "`nProvisioning GCP instance..." -ForegroundColor Green
    # Add logic to provision GCP instance
}

# Function to provision Azure instance
function ProvisionAzure {
    Write-Host "`nProvisioning Azure instance..." -ForegroundColor Green
    # Add logic to provision Azure instance
}

# Function to provision Magalucloud instance
function ProvisionMagalucloud {
    Write-Host "`nProvisioning Magalucloud instance..." -ForegroundColor Green
    # Add logic to provision Magalucloud instance
}

# Function to destroy AWS instance
function DestroyAWS {
    Write-Host "`nDestroying AWS instance..." -ForegroundColor Green
    # Add logic to destroy AWS instance
}

# Function to destroy GCP instance
function DestroyGCP {
    Write-Host "`nDestroying GCP instance..." -ForegroundColor Green
    # Add logic to destroy GCP instance
}

# Function to destroy Azure instance
function DestroyAzure {
    Write-Host "`nDestroying Azure instance..." -ForegroundColor Green
    # Add logic to destroy Azure instance
}

# Function to destroy Magalucloud instance
function DestroyMagalucloud {
    Write-Host "`nDestroying Magalucloud instance..." -ForegroundColor Green
    # Add logic to destroy Magalucloud instance
}

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
                Copy-Vagrantfile -source "Vagrantfile-topic-35$choice" -box $box
                VagrantUp -provider $provider
            }
            "2" { 
                $provider = "virtualbox"
                $box = "silvestrini-ol9"
                Copy-Vagrantfile -source "Vagrantfile-topic-35$choice" -box $box
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
            "1" { DestroyLab -provider "vmware_workstation" }
            "2" { DestroyLab -provider "virtualbox" }
            "3" { DestroyLab -provider "aws" }
            "4" { DestroyLab -provider "gcp" }
            "5" { DestroyLab -provider "azure" }
            "6" { DestroyLab -provider "magalucloud" }
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
