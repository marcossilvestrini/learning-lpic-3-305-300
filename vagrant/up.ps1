# Variables
$WORKDIR = $PSScriptRoot

# Fix scripts
& "C:\Program Files\Git\mingw64\bin\dos2unix.exe" $WORKDIR\scripts\commons\*
& "C:\Program Files\Git\mingw64\bin\dos2unix.exe" $WORKDIR\configs\commons\*

# Set workdir
Set-Location -Path $WORKDIR

# Function up instances
function VagrantUp {
    param (
        [string]$topic
    )
    # Up instances
    
    Write-Host "Up Instances Topic $topic" -ForegroundColor Green
    Copy-Item Vagrantfile-topic-$topic -Destination Vagrantfile -Force        
    vagrant up --provider vmware_workstation
    
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
        "1" { VagrantUp -topic "351" }
        "2" { VagrantUp -topic "352" }
        "3" { VagrantUp -topic "353" }
        "4" { $exit = $true }        
        default {
            Write-Host "`nInvalid option." -ForegroundColor Red
            continue
        }
    }
} while (-not $exit)