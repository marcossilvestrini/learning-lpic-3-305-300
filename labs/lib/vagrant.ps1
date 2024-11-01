# workdir_vagrant
$workdir_vagrant = $PSScriptRoot

# Machine folder
$vmware_folder = "E:/Servers/VMware"

# Vagrant folder
$vagrantPath= "$($workdir_vagrant | Split-Path -Parent)\vagrant"

# Function to copy the files
# Function to copy the files
function Copy-Vagrantfile {
    param (
        [string]$source,
        [string]$destination = "$($source | Split-Path -Parent)\Vagrantfile",
        [string]$box,
        [string]$provider
    )
    if (Test-Path $source) {
        $vagrantfileContent = Get-Content -Path $source

        # Replace the placeholder with the selected box
        $vagrantfileContent = $vagrantfileContent -replace 'CONFIG_VM_BOX_PLACEHOLDER', $box

        # Conditional logic to handle network configuration based on provider
        if ($provider -eq "virtualbox") {
            # If provider is VirtualBox, add the virtio NIC
            $vagrantfileContent = $vagrantfileContent -replace '### NETWORK_CONFIG_PLACEHOLDER', ',nic_type: "virtio"'
        } else {
            # If provider is VMware or another, remove virtio NIC line
            $vagrantfileContent = $vagrantfileContent -replace '### NETWORK_CONFIG_PLACEHOLDER', ''
        }

        $vagrantfileContent | Set-Content -Path $destination -Force
        Write-Host "`nFile $source copied to $destination successfully with box $box and provider $provider !" -ForegroundColor Green
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
        Set-Variable VAGRANT_LOG=info
        #vagrant up --debug  --provider $provider 2>&1 | Tee-Object -FilePath ".\vagrant.log"
        vagrant up --provider $provider 
        vagrant reload               
    } else {
        Write-Host "`nError: Vagrantfile not valid" -ForegroundColor Red
    }
    Set-Location $workdir_vagrant
    
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
    Set-Location $workdir_vagrant    
}