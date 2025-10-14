#syntax=docker/dockerfile:1

FROM node:20-alpine

RUN apk add --no-cache tini wget
WORKDIR /opt/mcp

COPY package.json package-lock.json* ./

RUN if [ -f package-lock.json ]; then \
      npm ci --omit=dev --no-audit --no-fund; \
    else \
      npm install --omit=dev --no-audit --no-fund; \
    fi

COPY src ./src

ENV NODE_ENV=production \
    MCP_LISTEN_HOST=0.0.0.0 \
    MCP_LISTEN_PORT=8080

EXPOSE 8080
HEALTHCHECK --interval=10s --timeout=5s --retries=5 CMD wget -qO- http://127.0.0.1:8080/health || exit 1
ENTRYPOINT ["/sbin/tini","--"]
CMD ["node","src/server.js"]
