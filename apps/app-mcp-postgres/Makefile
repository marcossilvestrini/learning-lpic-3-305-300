# ============================================================
# 🧠 MCP + PostgreSQL Lab - Makefile (No-Heredoc Edition)
# ------------------------------------------------------------
# Author: Marcos Silvestrini
# Date: 2025-10-10
# ============================================================

SHELL := /bin/bash
.DEFAULT_GOAL := help

# -------- Config --------
MCP_PORT ?= 8080
API_BASE := http://localhost:$(MCP_PORT)
EMAIL_PREFIX ?= bulk

# ========================
# 🧾 Help
# ========================
help: ## Show available commands
	@echo ""
	@echo "=========================================="
	@echo "🚀  MCP + PostgreSQL Lab - Makefile Help"
	@echo "=========================================="
	@echo ""
	@grep -E '^[a-zA-Z0-9_.-]+:.*?##' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?##"}; {printf "  \033[36m%-24s\033[0m %s\n", $$1, $$2}'
	@echo ""
	@echo "Examples:"
	@echo "  make up"
	@echo "  make mcp-bulk-users N=100"
	@echo "  make mcp-delete-one PATTERN=\"bulk-%\""
	@echo "  make mcp-delete-n N=25 PATTERN=\"bulk-%\""
	@echo ""

# ========================
# 🐳 Docker orchestration
# ========================
up: ## Build and start all containers
	@echo "🚀 Starting containers..."
	@docker compose up -d --build

down: ## Stop and remove containers
	@echo "🧹 Stopping and cleaning up containers..."
	@docker compose down -v

ps: ## List running containers
	@echo "📦 Listing running containers..."
	@docker compose ps

logs: ## Tail logs
	@echo "🪵 Streaming logs..."
	@docker compose logs -f --tail=200

# ========================
# 🧠 MCP API
# ========================
mcp-health: ## Check MCP health endpoint
	@echo "🩺 Checking MCP health endpoint..."
	@curl -fsS "$(API_BASE)/health" | jq .

mcp-query: ## Run demo SELECT via MCP
	@echo "🔍 Executing SELECT query via MCP..."
	@curl -fsS -X POST "$(API_BASE)/query" \
		-H "Content-Type: application/json" \
		-d '{"sql":"select count(*) as users from demo.users"}' | jq .

# ========================
# 👥 Users - Bulk Create/Delete (sem $1/$2 em DML)
# ========================
mcp-bulk-users: ## Create N users via MCP (N=<int>)
	@if [ -z "$(N)" ]; then echo "ERR: provide N, e.g., make mcp-bulk-users N=100"; exit 2; fi
	@echo "➕ Inserting $(N) users via MCP (prefix='bulk')..."
	@curl -fsS -X POST "$(API_BASE)/exec" \
		-H 'Content-Type: application/json' \
		--data-binary "{\"sql\":\"insert into demo.users(full_name,email) select concat('bulk user ', gs), concat('bulk-', gs, '-', to_char(clock_timestamp(),'yyyymmddhh24missms'), '@example.com') from generate_series(1, $(N)::int) as gs\",\"params\":[]}" \
	| jq .

mcp-delete-one: ## Delete most recent user by pattern (PATTERN='bulk-%')
	@PATTERN="$${PATTERN:-$(EMAIL_PREFIX)-%}"; \
	echo "🗑️  Deleting 1 user (most recent) with email LIKE '$$PATTERN'..."; \
	curl -fsS -X POST "$(API_BASE)/exec" \
		-H 'Content-Type: application/json' \
		--data-binary "{\"sql\":\"delete from demo.users where id in (select id from demo.users where email like \\$$1 order by created_at desc limit 1)\",\"params\":[\"$$PATTERN\"]}" \
	| jq .

mcp-delete-n: ## Delete N most recent users (N=<int>, PATTERN='bulk-%')
	@if [ -z "$(N)" ]; then echo "ERR: provide N, e.g., make mcp-delete-n N=25"; exit 2; fi
	@PATTERN="$${PATTERN:-$(EMAIL_PREFIX)-%}"; \
	echo "🗑️  Deleting $(N) users (most recent) with email LIKE '$$PATTERN'..."; \
	curl -fsS -X POST "$(API_BASE)/exec" \
		-H 'Content-Type: application/json' \
		--data-binary "{\"sql\":\"delete from demo.users where id in (select id from demo.users where email like \\$$1 order by created_at desc limit $(N)::int)\",\"params\":[\"$$PATTERN\"]}" \
	| jq .

# ========================
# 📊 Introspection
# ========================
mcp-tables: ## List tables in schema demo
	@echo "📑 Listing tables..."
	@curl -fsS -X POST "$(API_BASE)/query" \
		-H 'Content-Type: application/json' \
		-d "{\"sql\":\"select table_name from information_schema.tables where table_schema = 'demo' order by table_name\"}" \
	| jq .

mcp-counts: ## Show row counts per table
	@echo "🧮 Row counts per table..."
	@curl -fsS -X POST "$(API_BASE)/query" \
		-H 'Content-Type: application/json' \
		-d "{\"sql\":\"select 'users' as tbl, count(*) as rows from demo.users union all select 'products', count(*) from demo.products union all select 'orders', count(*) from demo.orders union all select 'order_items', count(*) from demo.order_items\"}" \
	| jq .

mcp-users: ## Show latest users
	@echo "👥 Latest users..."
	@curl -fsS -X POST "$(API_BASE)/query" \
		-H "Content-Type: application/json" \
		-d '{"sql":"select id, full_name, email, created_at from demo.users order by created_at desc limit 10"}' \
	| jq .

mcp-orders: ## Show latest orders
	@echo "🧾 Latest orders..."
	@curl -fsS -X POST "$(API_BASE)/query" \
		-H "Content-Type: application/json" \
		-d '{"sql":"select id, user_id, total, created_at from demo.orders order by created_at desc limit 10"}' \
	| jq .

mcp-items: ## Show latest order items
	@echo "📦 Latest order items..."
	@curl -fsS -X POST "$(API_BASE)/query" \
		-H "Content-Type: application/json" \
		-d '{"sql":"select id, order_id, product_id, qty, price from demo.order_items order by id desc limit 10"}' \
	| jq .

mcp-show: ## Show summary (tables + counts + samples)
	@$(MAKE) --no-print-directory mcp-tables
	@$(MAKE) --no-print-directory mcp-counts
	@$(MAKE) --no-print-directory mcp-users
	@$(MAKE) --no-print-directory mcp-orders
	@$(MAKE) --no-print-directory mcp-items

# ========================
# 🧼 Utilities
# ========================
clean: ## Remove unused Docker resources
	@echo "🧽 Cleaning unused Docker resources..."
	@docker system prune -af --volumes

rebuild: down up ## Rebuild and restart containers
	@echo "🔄 Environment rebuilt."

.PHONY: help up down ps logs \
	mcp-health mcp-query \
	mcp-bulk-users mcp-delete-one mcp-delete-n \
	mcp-tables mcp-counts mcp-users mcp-orders mcp-items mcp-show \
	clean rebuild
