# syntax=docker/dockerfile:1

# ---- Base Stage ----
FROM ubuntu:22.04 AS base
RUN apt-get update && apt-get install -y --no-install-recommends nginx \
    && rm -rf /var/lib/apt/lists/*

# ---- Production Stage ----
FROM base AS production
# Limpa a página padrão que o apt criou e copia os seus arquivos
RUN rm -rf /var/www/html/*
COPY ./html /var/www/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]