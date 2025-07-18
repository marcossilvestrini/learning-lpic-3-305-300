SHELL := /bin/bash

PKG_NAME=asciinema
PKG_ARCH=amd64
PKG_MAINTAINER_NAME=Marcos Silvestrini
PKG_MAINTAINER_EMAIL=marcos.silvestrini@gmail.com
REPO_URL=https://github.com/asciinema/asciinema.git
REPO_DIR=$(HOME)/asciinema
BIN_PATH=$(REPO_DIR)/target/release/$(PKG_NAME)
BUILD_DIR=/tmp/$(PKG_NAME)_build
INSTALL_PATH=$(BUILD_DIR)/usr/local/bin
CONTROL_DIR=$(BUILD_DIR)/DEBIAN
OUTPUT_DIR=$(HOME)/packages/debian

.PHONY: all prepare build version package clean help

all: prepare build package

prepare:
	@echo "🛠️  [prepare] Setting up environment..."
	@if ! command -v cargo >/dev/null 2>&1; then \
		echo "📦 [prepare] Installing Rust..."; \
		curl -sSf https://sh.rustup.rs | sh -s -- -y; \
		. $$HOME/.cargo/env; \
	else \
		echo "✅ [prepare] Rust is already installed."; \
	fi
	@if [ ! -d "$(REPO_DIR)/.git" ]; then \
		echo "⬇️  [prepare] Cloning asciinema repository..."; \
		git clone $(REPO_URL) $(REPO_DIR); \
	else \
		echo "🔁 [prepare] Updating existing asciinema repository..."; \
		cd $(REPO_DIR) && git fetch origin && git reset --hard origin/main; \
	fi
	@if [ ! -f "$(REPO_DIR)/Cargo.toml" ]; then \
		echo "🛑 [prepare] Cargo.toml not found after update. Removing repo and recloning..."; \
		rm -rf $(REPO_DIR); \
		git clone $(REPO_URL) $(REPO_DIR); \
		if [ ! -f "$(REPO_DIR)/Cargo.toml" ]; then \
			echo "❌ [prepare] Failed: asciinema repo does not have Cargo.toml! Aborting."; \
			exit 1; \
		fi; \
	fi
	@mkdir -p $(INSTALL_PATH) $(CONTROL_DIR) $(OUTPUT_DIR)


build:
	@echo "🔧 [build] Compiling asciinema with cargo..."
	cd $(REPO_DIR) && cargo build --release

version:
	@echo "🔍 [version] Detected version:"
	@$(BIN_PATH) --version | awk '{print $$2}'

package:
	@echo "📦 [package] Creating Debian package..."
	@rm -rf $(BUILD_DIR)
	@mkdir -p $(INSTALL_PATH) $(CONTROL_DIR)
	@cp -f $(BIN_PATH) $(INSTALL_PATH)
	@PKG_VERSION=`$(BIN_PATH) --version | awk '{print $$2}'`; \
	echo "📦 [package] Version: $$PKG_VERSION"; \
	echo "📄 [package] Generating control file..."; \
	echo "Package: $(PKG_NAME)" > $(CONTROL_DIR)/control; \
	echo "Version: $$PKG_VERSION" >> $(CONTROL_DIR)/control; \
	echo "Section: utils" >> $(CONTROL_DIR)/control; \
	echo "Priority: optional" >> $(CONTROL_DIR)/control; \
	echo "Architecture: $(PKG_ARCH)" >> $(CONTROL_DIR)/control; \
	echo "Maintainer: $(PKG_MAINTAINER_NAME) <$(PKG_MAINTAINER_EMAIL)>" >> $(CONTROL_DIR)/control; \
	echo "Description: Asciinema $$PKG_VERSION (Rust build) with live streaming support." >> $(CONTROL_DIR)/control; \
	dpkg-deb --build $(BUILD_DIR) $(OUTPUT_DIR)/$(PKG_NAME)_$${PKG_VERSION}_$(PKG_ARCH).deb; \
	echo "✅ [package] Package created at: $(OUTPUT_DIR)/$(PKG_NAME)_$${PKG_VERSION}_$(PKG_ARCH).deb"


clean:
	@echo "🧹 [clean] Removing build directory..."
	rm -rf $(BUILD_DIR)

help:
	@echo "📘 Usage: make <target>"
	@echo ""
	@echo "Available targets:"
	@echo "  🛠️  prepare   Install Rust and clone/update asciinema"
	@echo "  🔧 build     Compile asciinema using cargo"
	@echo "  🔍 version   Print detected version"
	@echo "  📦 package   Create .deb under ~/packages/debian"
	@echo "  🧹 clean     Remove build directory"
	@echo "  🚀 all       Default: prepare + build + package"
