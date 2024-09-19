# Scriptpath
$scriptPath = $PSScriptRoot

# Machine folder
$vmware_folder = "E:/Servers/VMware"

# Vagrant folder
$vagrantPath= "$($scriptPath | Split-Path -Parent)\vagrant"

# Function to copy the files
function Copy-Vagrantfile {
    param (
        [string]$source,
        [string]$destination = "$($source | Split-Path -Parent)\Vagrantfile",
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
        [string]$provider        
    )
    If(Test-Path $vagrantPath){
        Set-Location $vagrantPath        
    }
    else{Write-Host "`nError: Vagrantfile not found" -ForegroundColor Red}
    if (vagrant validate) {
        Write-Host "`nVagrantfile valid! Your instances are provisioning..." -ForegroundColor Green
        Write-Host "`nProvider: $provider" -ForegroundColor Yellow 
        vagrant up --provider $provider
    } else {
        Write-Host "`nError: Vagrantfile not valid" -ForegroundColor Red
    }
    Set-Location $scriptPath
    
}

# Function to vagrant destroy
function DestroyVagrant {
    param (
        [string]$provider        
    )
    If(Test-Path $vagrantPath){        
        Set-Location $vagrantPath           
    }
    else{Write-Host "`nError: Vagrantfile not found" -ForegroundColor Red}
    if (vagrant validate) {
        Write-Host "`nVagrantfile valid! Your instances are destroy..." -ForegroundColor Green
        Write-Host "`nProvider: $provider" -ForegroundColor Yellow   
        vagrant destroy -f        
        # Delete vmware machines folder
        if ($provider -eq "vmware_workstation") {            
            If(Test-Path "$vmware_folder/lpic3-topic-*"){Remove-Item "$vmware_folder/lpic3-topic-*" -Recurse -Force}
        }           
        If(-not(Test-Path "$vmware_folder/lpic3-topic-*") ){
            Remove-Item "$vagrantPath\Vagrantfile" -Force
            Remove-Item -Recurse "$vagrantPath\.vagrant" -Force
        }
        else{ Write-Host "`nError: Vagrantfile not delete!!! Instance is running...Kill instances manually and  repeat this option." -ForegroundColor Red}
        
    } else {
        Write-Host "`nError: Vagrantfile not valid" -ForegroundColor Red
    }
    Set-Location $scriptPath    
}