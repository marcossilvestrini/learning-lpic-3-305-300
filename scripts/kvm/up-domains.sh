#!/bin/bash

: <<'MULTILINE-COMMENT'
    Requirements: kvm, libvirt
    Dependencies:
    Description: Script for Up Domains in Libvirt
    Author: Marcos Silvestrini
    Date: 04/06/2025
MULTILINE-COMMENT

# Set language/locale and encoding
export LANG=C

# Set workdir
cd /home/vagrant || exit

# Enable debug
#export LIBGUESTFS_DEBUG=1 LIBGUESTFS_TRACE=1

# Define image variables
DEBIAN_IMAGE="os-images/Debian_12.0.0_VMM/Debian_12.0.0.qcow2"
ROCKY_IMAGE="os-images/RockyLinux_9.4_VMG/RockyLinux_9.4.qcow2"
OPENSUSE_IMAGE="os-images/openSUSE_Leap_15.2_VM/openSUSE_Leap_15.2.qcow2"

# Create debian domain
if virsh list --all | grep -qw debian-server01; then
    echo "✅ Debian domain already exists."
else
    echo "🚀 Debian domain not found. Creating now..."
    if [[ -f "$DEBIAN_IMAGE" ]]; then
        echo "🔧 Running virt-sysprep on Debian image..."
        if ! virt-sysprep \
            --firstboot ./scripts/kvm/sysprep-debian.sh \
            -a "$DEBIAN_IMAGE"; then
            echo "❌ Sysprep failed for Debian image." >&2
            exit 1
        fi
        echo "🧹 Sysprep completed for Debian."
    else
        echo "⚠️  Debian image not found at $DEBIAN_IMAGE. Skipping sysprep."
    fi
    echo "🛠️  Starting Debian domain installation..."
    if ! virt-install --name debian-server01 \
        --vcpus 2 \
        --ram 2048 \
        --disk vol=os-images/Debian_12.0.0.qcow2 \
        --network network=default \
        --import \
        --osinfo detect=on \
        --graphics vnc,listen=0.0.0.0,port=5906 \
        --noautoconsole; then
        echo "❌ Failed to create Debian domain." >&2
        exit 1
    fi
    echo "🎉 Debian domain created successfully!"
fi

# Create a rocky9 domain
if virsh list --all | grep -qw rocky9-server02; then
    echo "✅ Rocky9 domain already exists."
else
    echo "🚀 Rocky9 domain not found. Creating now..."
    echo "🛠️  Starting Rocky9 domain installation..."
    if ! virt-install --name rocky9-server02 \
        --vcpus 2 \
        --ram 2048 \
        --disk path="$ROCKY_IMAGE",format=qcow2,bus=virtio \
        --network bridge=qemubr0,model=virtio \
        --import \
        --osinfo detect=on \
        --graphics vnc,listen=0.0.0.0,port=5907 \
        --noautoconsole; then
        echo "❌ Failed to create Rocky9 domain." >&2
        exit 1
    fi
    echo "🎉 Rocky9 domain created successfully!"
fi

# Create a opensuse domain
VM_NAME="opensuse-leap15"
if virsh list --all | grep -qw "$VM_NAME"; then
    echo "✅ Domain '$VM_NAME' already exists."
else
    echo "🚀 Domain '$VM_NAME' not found. Creating now..."
    echo "🛠️  Starting openSUSE Leap 15.2 domain installation..."

    if ! virt-install \
        --name "$VM_NAME" \
        --vcpus 1 \
        --ram 2048 \
        --disk path="$OPENSUSE_IMAGE",format=qcow2 \
        --network bridge=qemubr0,model=virtio \
        --import \
        --osinfo detect=on \
        --graphics vnc,listen=0.0.0.0,port=5908 \
        --noautoconsole; then
        echo "❌ Failed to create domain '$VM_NAME'." >&2
        exit 1
    fi

    echo "🎉 Domain '$VM_NAME' created successfully!"
fi
