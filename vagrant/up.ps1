# Variables
$WORKDIR = $PSScriptRoot
$BASE_DIR= $WORKDIR | Split-Path -Parent
$Dos2UnixPath = "C:\Program Files\Git\mingw64\bin\dos2unix.exe"

# Function to convert files in folder (excluding directories)
function Convert-FilesToUnix {
    param (
        [string]$FolderPath
    )

    Get-ChildItem -Path $FolderPath -File -Recurse | ForEach-Object {
        & $Dos2UnixPath $_.FullName
    }
}
# Apply dos2unix only to files
Convert-FilesToUnix "$BASE_DIR\scripts\kvm"
Convert-FilesToUnix "$BASE_DIR\configs"

# Set workdir
Set-Location -Path $WORKDIR

# Function to choose provider
function Select-Provider {
    do {
        Write-Host "`nChoose the provider to use:" -ForegroundColor White
        Write-Host "1. " -NoNewline; Write-Host "VirtualBox" -ForegroundColor Cyan
        Write-Host "2. " -NoNewline; Write-Host "VMware Workstation" -ForegroundColor Yellow
        $providerChoice = Read-Host

        switch ($providerChoice) {
            "1" { return "virtualbox" }
            "2" { return "vmware_workstation" }
            default {
                Write-Host "`nInvalid provider option." -ForegroundColor Red
            }
        }
    } while ($true)
}

# Function up instances
function VagrantUp {
    param (
        [string]$topic,
        [string]$provider
    )
    # Up instances
    Write-Host "Up Instances Topic $topic using provider $provider" -ForegroundColor Green
    Copy-Item Vagrantfile-topic-$topic -Destination Vagrantfile -Force
    vagrant up --provider $provider
}

# Switch topic for set Vagrantfile
do {
    Write-Host "Choose the topic to up:" -ForegroundColor White
    Write-Host "1. " -NoNewline; Write-Host "Up Lab Topic 351" -ForegroundColor Cyan
    Write-Host "2. " -NoNewline; Write-Host "Up Lab Topic 352" -ForegroundColor Yellow
    Write-Host "3. " -NoNewline; Write-Host "Up Lab Topic 353" -ForegroundColor Green
    Write-Host "4. " -NoNewline; Write-Host "Exit" -ForegroundColor Magenta
    $choice = Read-Host

    switch ($choice) {
        "1" {
            $provider = Select-Provider
            VagrantUp -topic "351" -provider $provider
        }
        "2" {
            $provider = Select-Provider
            VagrantUp -topic "352" -provider $provider
        }
        "3" {
            $provider = Select-Provider
            VagrantUp -topic "353" -provider $provider
        }
        "4" { $exit = $true }
        default {
            Write-Host "`nInvalid option." -ForegroundColor Red
            continue
        }
    }
} while (-not $exit)
