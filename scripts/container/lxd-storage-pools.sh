#!/bin/bash
true <<'MULTILINE-COMMENT'
    📝 Script Name: ldx-storage-pools.sh
    🔒 Requirements: root privileges, lxd, lvm2, btrfs-progs, zfsutils-linux
    📚 Description: Create LXD storage pools (LVM, Btrfs, ZFS) using partitions prepared by storage.sh
    👤 Author: Marcos Silvestrini + GitHub Copilot
    📅 Date: 31/07/2025
MULTILINE-COMMENT

set -euo pipefail
IFS=$'\n\t'
LANG=C



# 🧩 Function: Get secondary disk (not root disk)
get_secondary_disk() {
    local root_partition root_disk
    root_partition=$(findmnt -n -o SOURCE /)
    if [[ "$root_partition" =~ (/dev/[a-z]+)[0-9]+ ]]; then
        root_disk="${BASH_REMATCH[1]}"
    else
        root_disk="$root_partition"
    fi
    for d in $(lsblk -dn -o NAME,TYPE | awk '$2=="disk"{print $1}'); do
        local disk="/dev/$d"
        [[ "$disk" == "$root_disk" ]] && continue
        echo "$disk"
        return 0
    done
    return 1
}

# 🧪 Function: Validate partitions exist and are formatted
validate_partitions() {
    for part in "$@"; do
        if ! lsblk --noheadings --output NAME "$part" &>/dev/null; then
            error "Partition $part not found."
        fi
        if ! blkid "$part" &>/dev/null; then
            error "Partition $part is not formatted. Please use storage.sh."
        fi
        log "Partition $part found and formatted."
    done
}

# 🛠️ Function: Create LXD storage pool if not exists
create_lxd_pool() {
    local pool_name=$1
    local pool_type=$2
    local pool_source=$3
    if ! lxc storage list | grep -qw $pool_name; then
        log "Creating pool $pool_name ($pool_type) on $pool_source..."
        lxc storage create $pool_name $pool_type source="$pool_source" || error "Failed to create $pool_name pool."
    else
        log "Pool $pool_name already exists."
    fi
}

# 🛠️ Function: Create 2GB volume and bucket in pool
create_volume_and_bucket() {
    local pool=$1
    local vol_name="volume-$pool"
    local bucket_name="bucket-$pool"
    # Create volume if not exists
    if ! lxc storage volume list $pool | grep -qw $vol_name; then
        log "Creating 2GB volume $vol_name in pool $pool..."
        lxc storage volume create $pool $vol_name size=2GB || warn "Failed to create volume $vol_name in $pool."
    else
        log "Volume $vol_name already exists in $pool."
    fi
    # Create bucket if supported and not exists
    if lxc storage bucket list $pool &>/dev/null; then
        if ! lxc storage bucket list $pool | grep -qw $bucket_name; then
            log "Creating bucket $bucket_name in pool $pool..."
            lxc storage bucket create $pool $bucket_name || warn "Failed to create bucket $bucket_name in $pool."
        else
            log "Bucket $bucket_name already exists in $pool."
        fi
    else
        warn "Buckets not supported or not enabled in pool $pool. Skipping bucket creation."
    fi
}

# 🧾 Function: Validate volumes and buckets
validate_volumes_and_buckets() {
    log "Volumes and buckets created/validated:"
    for pool in "$@"; do
        log "Pool: $pool"
        lxc storage volume list $pool
        if lxc storage bucket list $pool &>/dev/null; then
            lxc storage bucket list $pool
        else
            log "Buckets not supported in pool $pool."
        fi
    done
}

# ===============================================
# S3 Bucket Automation: Upload and List Files    #
# ===============================================
s3_upload_and_list() {
    # Ensure awscli is installed
    if ! command -v aws >/dev/null 2>&1; then
        log "awscli not found. Installing..."
        if command -v apt >/dev/null 2>&1; then
            sudo apt update && sudo apt install -y awscli || error "Failed to install awscli."
        elif command -v dnf >/dev/null 2>&1; then
            sudo dnf install -y awscli || error "Failed to install awscli."
        elif command -v yum >/dev/null 2>&1; then
            sudo yum install -y awscli || error "Failed to install awscli."
        else
            error "No supported package manager found to install awscli."
        fi
    fi

    local endpoint
    endpoint="https://$(hostname -I | awk '{print $1}' | head -n1):8555"
    local region="us-east-1"
    local file_to_upload="scripts/container/cloud-init.sh"
    if [ ! -f "$file_to_upload" ]; then
        error "File $file_to_upload not found!"
    fi

    for pool in lpic3-lvm lpic3-btrfs lpic3-zfs; do
        bucket="bucket-$pool"
        # Get admin key info
        key_info=$(lxc storage bucket key show $pool $bucket admin 2>/dev/null)
        access_key=$(echo "$key_info" | awk -F': ' '/access-key:/ {print $2}')
        secret_key=$(echo "$key_info" | awk -F': ' '/secret-key:/ {print $2}')
        if [ -z "$access_key" ] || [ -z "$secret_key" ]; then
            warn "No admin key found for $bucket in $pool. Skipping."
            continue
        fi

        export AWS_ACCESS_KEY_ID="$access_key"
        export AWS_SECRET_ACCESS_KEY="$secret_key"
        export AWS_DEFAULT_REGION="$region"

        log "Uploading $file_to_upload to s3://$bucket/ using pool $pool..."
        aws --no-verify-ssl --endpoint-url "$endpoint" s3 cp "$file_to_upload" s3://$bucket/ || warn "Failed to upload to $bucket."

        log "Listing files in s3://$bucket/ ..."
        aws --no-verify-ssl --endpoint-url "$endpoint" s3 ls s3://$bucket/ || warn "Failed to list files in $bucket."
    done

    unset AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_DEFAULT_REGION
}

# 📝 Logging functions with emojis
log()   { echo -e "\033[1;34m[INFO] 💡 $*\033[0m"; }
warn()  { echo -e "\033[1;33m[WARN] ⚠️ $*\033[0m" >&2; }
error() { echo -e "\033[1;31m[ERROR] ❌ $*\033[0m" >&2; exit 1; }


# === Main execution ===
DISK="$(get_secondary_disk)"
if [[ -z "$DISK" ]]; then
    error "Secondary disk not found. Please run storage.sh first."
fi

PART1="${DISK}1"
PART2="${DISK}2"
PART3="${DISK}3"

validate_partitions "$PART1" "$PART2" "$PART3"

create_lxd_pool lpic3-lvm lvm "$PART1"
create_lxd_pool lpic3-btrfs btrfs "$PART2"
create_lxd_pool lpic3-zfs zfs "$PART3"

log "Pools created/validated:"
lxc storage list

for pool in lpic3-lvm lpic3-btrfs lpic3-zfs; do
    create_volume_and_bucket "$pool"
done

validate_volumes_and_buckets lpic3-lvm lpic3-btrfs lpic3-zfs

s3_upload_and_list

log "🎉✅ Script finished successfully!"

# ===============================================
# S3 Bucket Automation: Upload and List Files    #
# ===============================================

s3_upload_and_list() {
    # Ensure awscli is installed
    if ! command -v aws >/dev/null 2>&1; then
        log "awscli not found. Installing..."
        if command -v apt >/dev/null 2>&1; then
            sudo apt update && sudo apt install -y awscli || error "Failed to install awscli."
        elif command -v dnf >/dev/null 2>&1; then
            sudo dnf install -y awscli || error "Failed to install awscli."
        elif command -v yum >/dev/null 2>&1; then
            sudo yum install -y awscli || error "Failed to install awscli."
        else
            error "No supported package manager found to install awscli."
        fi
    fi

    local endpoint
    endpoint="https://$(hostname -I | awk '{print $1}' | head -n1):8555"
    local region="us-east-1"
    local file_to_upload="scripts/container/cloud-init.sh"
    if [ ! -f "$file_to_upload" ]; then
        error "File $file_to_upload not found!"
    fi

    for pool in lpic3-lvm lpic3-btrfs lpic3-zfs; do
        bucket="bucket-$pool"
        # Get admin key info
        key_info=$(lxc storage bucket key show $pool $bucket admin 2>/dev/null)
        access_key=$(echo "$key_info" | awk -F': ' '/access-key:/ {print $2}')
        secret_key=$(echo "$key_info" | awk -F': ' '/secret-key:/ {print $2}')
        if [ -z "$access_key" ] || [ -z "$secret_key" ]; then
            warn "No admin key found for $bucket in $pool. Skipping."
            continue
        fi

        export AWS_ACCESS_KEY_ID="$access_key"
        export AWS_SECRET_ACCESS_KEY="$secret_key"
        export AWS_DEFAULT_REGION="$region"

        log "Uploading $file_to_upload to s3://$bucket/ using pool $pool..."
        aws --no-verify-ssl --endpoint-url "$endpoint" s3 cp "$file_to_upload" s3://$bucket/ || warn "Failed to upload to $bucket."

        log "Listing files in s3://$bucket/ ..."
        aws --no-verify-ssl --endpoint-url "$endpoint" s3 ls s3://$bucket/ || warn "Failed to list files in $bucket."
    done

    unset AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_DEFAULT_REGION
}

# Call the function at the end of the script (optional, comment out if not desired by default)
s3_upload_and_list

log "🎉✅ Script finished successfully!"
