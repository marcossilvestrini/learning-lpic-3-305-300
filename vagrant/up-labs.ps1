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

# Function to copy the files
function Copy-Vagrantfile {
    param (
        [string]$source,
        [string]$destination = "Vagrantfile"
    )

    if (Test-Path $source) {
        Copy-Item -Path $source -Destination $destination -Force
        Write-Host "`nFile '$source' copied to '$destination' successfully!" -ForegroundColor Green
    } else {
        Write-Host "`nError: File '$source' not found." -ForegroundColor Red
    }
}

# Menu loop
do {
    Show-Menu
    $choice = Read-Host

    switch ($choice) {
        "1" {
            Copy-Vagrantfile -source "Vagrantfile-topic-351"
        }
        "2" {
            Copy-Vagrantfile -source "Vagrantfile-topic-352"
        }
        "3" {
            Copy-Vagrantfile -source "Vagrantfile-topic-353"
        }
        "4" {
            Write-Host "`nExiting script..." -ForegroundColor Magenta
            break
        }
        default {
            Write-Host "`nInvalid option. Please select a valid option." -ForegroundColor Red
        }
    }

    # Wait before showing the menu again
    Start-Sleep -Seconds 2

} while ($true)
