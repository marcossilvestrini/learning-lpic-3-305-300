# Function to display the menu with colors
function Show-Menu {
    param (
        [string]$prompt = 'Select an option:'
    )

    Write-Host "`nLPIC3 305-300 Labs`n"
    Write-Host "1. " -NoNewline; Write-Host "Up Lab Topic 351" -ForegroundColor Cyan
    Write-Host "2. " -NoNewline; Write-Host "Up Lab Topic 352" -ForegroundColor Yellow
    Write-Host "3. " -NoNewline; Write-Host "Up Lab Topic 353" -ForegroundColor Green
    Write-Host "4. " -NoNewline; Write-Host "Exit" -ForegroundColor Red
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
    Write-Host $prompt -NoNewline
}

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
            }
            "2" { 
                $provider = "virtualbox"
                $box = "silvestrini-ol9"
                
            }
            default {
                Write-Host "`nInvalid provider option. Defaulting to VMware Workstation." -ForegroundColor Red
                $provider = "vmware_workstation"
                $box = "silvestrini-rocky9"
            }
        }

        switch ($choice) {
            "1" {
                Copy-Vagrantfile -source "Vagrantfile-topic-351" -box $box
                VagrantUp -provider $provider
            }
            "2" {
                Copy-Vagrantfile -source "Vagrantfile-topic-352" -box $box
                VagrantUp -provider $provider
            }
            "3" {
                Copy-Vagrantfile -source "Vagrantfile-topic-353" -box $box
                VagrantUp -provider $provider
            }
        }
    } elseif ($choice -eq "4") {
        Write-Host "`nExiting script..." -ForegroundColor Magenta
        $exit = $true
    } else {
        Write-Host "`nInvalid option. Please select a valid option." -ForegroundColor Red
    }

    # Wait before showing the menu again
    Start-Sleep -Seconds 2

} while (-not $exit)
