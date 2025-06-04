#!/bin/bash

: <<'MULTILINE-COMMENT'
    Requirements: kvm, libvirt
    Description: Graceful shutdown and cleanup of Libvirt domains
    Author: Marcos Silvestrini
    Date: 04/06/2025
MULTILINE-COMMENT

export LANG=C
cd /home/vagrant || exit

# List of domains to manage
domains=("debian-server01" "rocky9-server02")

for domain in "${domains[@]}"; do
    if virsh list --all | grep -q "$domain"; then
        echo "🔻 Processing domain: $domain"

        # Gracefully shut down if running
        if virsh domstate "$domain" | grep -q running; then
            echo "⏻ Shutting down $domain..."
            virsh shutdown "$domain"
            for i in {1..30}; do
                sleep 1
                [[ $(virsh domstate "$domain") == "shut off" ]] && break
            done
        fi

        # Force destroy if still active
        if virsh domstate "$domain" | grep -q running; then
            echo "⛔ $domain did not shut down gracefully. Forcing shutdown..."
            virsh destroy "$domain"
        fi

        # Get disk paths before undefining
        mapfile -t disks < <(virsh domblklist "$domain" --details | awk '$1 == "file" {print $4}')

        # Undefine domain
        echo "🧹 Undefining $domain..."
        virsh undefine "$domain"

        # Release disks still locked by QEMU
        for disk in "${disks[@]}"; do
            echo "🧼 Checking for lock on: $disk"
            for pid in $(sudo lsof -t "$disk" 2>/dev/null); do
                echo "⚠️  Terminating locked process (PID $pid)..."
                kill -TERM "$pid"
                sleep 2
                if kill -0 "$pid" 2>/dev/null; then
                    echo "💀 Forcing kill of PID $pid..."
                    kill -KILL "$pid"
                fi
            done
        done
    else
        echo "ℹ️  Domain $domain does not exist. Skipping."
    fi
done

echo "✅ All specified domains have been shut down, undefined, and released."
