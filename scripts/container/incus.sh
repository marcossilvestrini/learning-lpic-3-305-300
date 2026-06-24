#!/usr/bin/env bash

: <<'MULTILINE-COMMENT'
    Script Name: incus.sh
    Requirements: Debian 12/13, root privileges, apt, systemd, internet access
    Description:
      - Installs the latest upstream Go toolchain required to build current Incus
      - Installs Incus on Debian 13 from the native package
      - Installs Incus on Debian 12 from the Zabbly package repository
      - Ensures local Incus admin access group exists
      - Initializes Incus with a minimal default setup if needed
      - Adds the official Ubuntu image remotes when available
      - Launches a cloud VM and runs a hello-world validation command
    References:
      - https://linuxcontainers.org/incus/docs/main/installing/#installing-from-package
      - https://linuxcontainers.org/incus/docs/main/howto/initialize/
      - https://linuxcontainers.org/incus/docs/main/howto/instances_create/
      - https://go.dev/doc/install
MULTILINE-COMMENT

set -euo pipefail
IFS=$'\n\t'

MIN_INCUS_GO_VERSION="${MIN_INCUS_GO_VERSION:-1.25.10}"
GO_VERSION="${GO_VERSION:-}"
INCUS_ADMIN_USER="${INCUS_ADMIN_USER:-${SUDO_USER:-}}"
ZABBLY_INCUS_CHANNEL="${ZABBLY_INCUS_CHANNEL:-stable}"
HELLO_VM="${HELLO_VM:-incus-hello-world}"
HELLO_IMAGE="${HELLO_IMAGE:-images:debian/12/cloud}"
HELLO_VM_MEMORY="${HELLO_VM_MEMORY:-1GiB}"
HELLO_VM_DISK="${HELLO_VM_DISK:-10GiB}"

export DEBIAN_FRONTEND=noninteractive
export PATH="/usr/local/go/bin:${PATH}"

log() { printf '[INFO] %s\n' "$*"; }
warn() { printf '[WARN] %s\n' "$*" >&2; }
abort() { printf '[ERROR] %s\n' "$*" >&2; exit 1; }

require_root() {
    if [[ "${EUID}" -ne 0 ]]; then
        abort "Run this script as root or with sudo."
    fi
}

require_supported_debian() {
    if [[ ! -r /etc/os-release ]]; then
        abort "/etc/os-release not found. This script supports Debian 12 and Debian 13 only."
    fi

    # shellcheck disable=SC1091
    . /etc/os-release

    if [[ "${ID:-}" != "debian" || ! "${VERSION_ID:-}" =~ ^(12|13)$ ]]; then
        abort "This script supports Debian 12 (bookworm) and Debian 13 (trixie) only. Detected: ${PRETTY_NAME:-unknown}."
    fi

    log "Detected ${PRETTY_NAME}."
}

version_ge() {
    local current="$1"
    local required="$2"

    [[ "$(printf '%s\n%s\n' "$required" "$current" | sort -V | head -n1)" == "$required" ]]
}

install_base_packages() {
    log "Installing base tools required by apt, Go download, and validation."
    apt-get update
    apt-get install -y ca-certificates curl gnupg jq sudo tar xz-utils
}

detect_go_arch() {
    case "$(uname -m)" in
        x86_64 | amd64)
            printf 'amd64'
            ;;
        aarch64 | arm64)
            printf 'arm64'
            ;;
        armv6l)
            printf 'armv6l'
            ;;
        i386 | i686)
            printf '386'
            ;;
        *)
            abort "Unsupported Go binary architecture: $(uname -m). Set GO_VERSION and install Go manually."
            ;;
    esac
}

latest_go_version() {
    curl -fsSL 'https://go.dev/VERSION?m=text' | awk 'NR == 1 { sub(/^go/, "", $1); print $1 }'
}

go_checksum() {
    local release="$1"
    local filename="$2"

    curl -fsSL 'https://go.dev/dl/?mode=json&include=all' \
        | jq -r --arg release "$release" --arg filename "$filename" \
            '.[] | select(.version == $release) | .files[] | select(.filename == $filename) | .sha256' \
        | head -n1
}

install_go() {
    local go_arch
    local go_release
    local go_file
    local go_url
    local go_tmp
    local expected_checksum

    if [[ -z "${GO_VERSION}" ]]; then
        GO_VERSION="$(latest_go_version)"
    fi

    if ! version_ge "${GO_VERSION}" "${MIN_INCUS_GO_VERSION}"; then
        abort "Go ${GO_VERSION} is older than the Incus requirement ${MIN_INCUS_GO_VERSION}."
    fi

    go_arch="$(detect_go_arch)"
    go_release="go${GO_VERSION}"
    go_file="${go_release}.linux-${go_arch}.tar.gz"
    go_url="https://go.dev/dl/${go_file}"
    go_tmp="/tmp/${go_file}"

    expected_checksum="$(go_checksum "${go_release}" "${go_file}")"
    if [[ -z "${expected_checksum}" || "${expected_checksum}" == "null" ]]; then
        abort "Could not find SHA256 checksum for ${go_file} on go.dev."
    fi

    if command -v go >/dev/null 2>&1; then
        local current_go
        current_go="$(go version | awk '{print $3}' | sed 's/^go//')"
        if version_ge "${current_go}" "${GO_VERSION}"; then
            log "Go ${current_go} is already installed and satisfies Go ${GO_VERSION}."
            return 0
        fi
    fi

    log "Installing Go ${GO_VERSION} from upstream (${go_file})."
    curl -fL "${go_url}" -o "${go_tmp}"
    printf '%s  %s\n' "${expected_checksum}" "${go_tmp}" | sha256sum -c -

    rm -rf /usr/local/go
    tar -C /usr/local -xzf "${go_tmp}"

    cat >/etc/profile.d/go.sh <<'EOF'
export PATH="/usr/local/go/bin:${PATH}"
EOF
    chmod 0644 /etc/profile.d/go.sh

    /usr/local/go/bin/go version
}

setup_zabbly_repository() {
    local key_tmp="/tmp/zabbly.asc"
    local expected_fingerprint="4EFC590696CB15B87C73A3AD82CC8797C838DCFD"
    local actual_fingerprint
    local source_file="/etc/apt/sources.list.d/zabbly-incus-${ZABBLY_INCUS_CHANNEL}.sources"

    case "${ZABBLY_INCUS_CHANNEL}" in
        lts-6.0 | lts-7.0 | stable | daily)
            ;;
        *)
            abort "Unsupported ZABBLY_INCUS_CHANNEL=${ZABBLY_INCUS_CHANNEL}. Use lts-6.0, lts-7.0, stable, or daily."
            ;;
    esac

    log "Configuring Zabbly Incus ${ZABBLY_INCUS_CHANNEL} repository for Debian ${VERSION_ID}."
    curl -fsSL 'https://pkgs.zabbly.com/key.asc' -o "${key_tmp}"

    actual_fingerprint="$(gpg --show-keys --with-colons --fingerprint "${key_tmp}" \
        | awk -F: '$1 == "fpr" { print $10; exit }')"

    if [[ "${actual_fingerprint}" != "${expected_fingerprint}" ]]; then
        abort "Unexpected Zabbly key fingerprint: ${actual_fingerprint:-none}."
    fi

    mkdir -p /etc/apt/keyrings
    cp "${key_tmp}" /etc/apt/keyrings/zabbly.asc
    chmod 0644 /etc/apt/keyrings/zabbly.asc

    cat >"${source_file}" <<EOF
Enabled: yes
Types: deb
URIs: https://pkgs.zabbly.com/incus/${ZABBLY_INCUS_CHANNEL}
Suites: ${VERSION_CODENAME}
Components: main
Architectures: $(dpkg --print-architecture)
Signed-By: /etc/apt/keyrings/zabbly.asc

EOF
}

install_incus_package() {
    if [[ "${VERSION_ID}" == "12" ]]; then
        setup_zabbly_repository
        log "Installing Incus from the Zabbly repository."
    else
        log "Installing Incus from Debian 13 native packages."
    fi

    apt-get update
    apt-get install -y incus

    if ! getent group incus-admin >/dev/null; then
        log "Creating incus-admin group."
        groupadd --system incus-admin
    fi

    if [[ -z "${INCUS_ADMIN_USER}" && -n "${SUDO_USER:-}" && "${SUDO_USER}" != "root" ]]; then
        INCUS_ADMIN_USER="${SUDO_USER}"
    elif [[ -z "${INCUS_ADMIN_USER}" ]] && id vagrant >/dev/null 2>&1; then
        INCUS_ADMIN_USER="vagrant"
    fi

    if [[ -n "${INCUS_ADMIN_USER}" && "${INCUS_ADMIN_USER}" != "root" ]]; then
        if id "${INCUS_ADMIN_USER}" >/dev/null 2>&1; then
            log "Adding ${INCUS_ADMIN_USER} to incus-admin."
            usermod -aG incus-admin "${INCUS_ADMIN_USER}"
        else
            warn "INCUS_ADMIN_USER=${INCUS_ADMIN_USER} does not exist; skipping group membership."
        fi
    fi
}

start_incus() {
    log "Starting Incus service."
    systemctl daemon-reload

    if systemctl list-unit-files --type=socket --no-legend 'incus.socket' | grep -q '^incus\.socket'; then
        systemctl enable --now incus.socket
    fi

    if systemctl list-unit-files --type=service --no-legend 'incus.service' | grep -q '^incus\.service'; then
        systemctl enable --now incus.service || systemctl start incus.service
    fi

    local waited=0
    while (( waited < 90 )); do
        if incus info >/dev/null 2>&1; then
            log "Incus daemon is responding."
            return 0
        fi

        sleep 3
        waited=$((waited + 3))
    done

    abort "Incus daemon did not become ready within 90 seconds."
}

initialize_incus() {
    if incus storage list --format csv 2>/dev/null | grep -q .; then
        log "Incus already has storage configured; skipping initialization."
        return 0
    fi

    log "Initializing Incus with minimal defaults."
    incus admin init --minimal
}

ensure_incus_remote() {
    local name="$1"
    local url="$2"

    if incus remote list --format csv | awk -F, '{ print $1 }' | grep -qx "${name}"; then
        log "Incus remote ${name}: already exists."
        return 0
    fi

    log "Adding Incus remote ${name}: ${url}."
    incus remote add "${name}" "${url}" --protocol=simplestreams --public
}

configure_image_remotes() {
    ensure_incus_remote "ubuntu" "https://cloud-images.ubuntu.com/releases"
    ensure_incus_remote "ubuntu-daily" "https://cloud-images.ubuntu.com/daily"

    if ! incus image list ubuntu: --format csv 2>/dev/null | grep -q .; then
        warn "The ubuntu: remote is configured, but it currently exposes no Incus-compatible images on this host."
        warn "Use images: for Incus validation, or check Canonical simplestreams support before launching ubuntu:<alias>."
    fi
}

warn_if_kvm_missing() {
    if [[ ! -e /dev/kvm ]]; then
        warn "/dev/kvm was not found. VM validation may fail or be very slow without nested virtualization."
    fi
}

wait_for_instance_running() {
    local name="$1"
    local timeout="${2:-180}"
    local waited=0
    local status=""

    while (( waited < timeout )); do
        status="$(incus info "${name}" 2>/dev/null | awk -F': ' '/^Status:/ {print $2}' || true)"
        if [[ "${status}" == "RUNNING" ]]; then
            log "${name} is running."
            return 0
        fi

        sleep 5
        waited=$((waited + 5))
    done

    abort "${name} did not reach RUNNING state within ${timeout} seconds."
}

wait_for_vm_agent() {
    local name="$1"
    local timeout="${2:-300}"
    local waited=0

    log "Waiting for the Incus agent inside ${name}."
    while (( waited < timeout )); do
        if incus exec "${name}" -- true >/dev/null 2>&1; then
            log "Incus agent is ready in ${name}."
            return 0
        fi

        sleep 5
        waited=$((waited + 5))
    done

    abort "Incus agent did not become ready in ${name} within ${timeout} seconds."
}

launch_hello_world_vm() {
    warn_if_kvm_missing

    if incus info "${HELLO_VM}" >/dev/null 2>&1; then
        log "Removing existing ${HELLO_VM} instance."
        incus delete "${HELLO_VM}" --force
    fi

    log "Launching validation VM ${HELLO_VM} from ${HELLO_IMAGE}."
    incus launch "${HELLO_IMAGE}" "${HELLO_VM}" --vm \
        --config "limits.memory=${HELLO_VM_MEMORY}" \
        --device "root,size=${HELLO_VM_DISK}"

    wait_for_instance_running "${HELLO_VM}"
    wait_for_vm_agent "${HELLO_VM}"

    log "Running hello-world validation inside ${HELLO_VM}."
    incus exec "${HELLO_VM}" -- sh -lc 'printf "hello world from %s\n" "$(hostname)"; uname -a'
    incus list "${HELLO_VM}"
}

main() {
    require_root
    require_supported_debian
    install_base_packages
    install_go
    install_incus_package
    start_incus
    initialize_incus
    configure_image_remotes
    launch_hello_world_vm

    log "Incus setup completed. The validation VM is ${HELLO_VM}."
    if [[ -n "${INCUS_ADMIN_USER}" && "${INCUS_ADMIN_USER}" != "root" ]]; then
        log "Open a new login session, or run 'newgrp incus-admin', for ${INCUS_ADMIN_USER} group access."
    fi
}

main "$@"
