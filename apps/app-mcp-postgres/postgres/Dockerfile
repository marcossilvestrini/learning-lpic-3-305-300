#syntax=docker/dockerfile:1
ARG BASE_IMAGE=postgres:18.0
FROM ${BASE_IMAGE}
COPY init /docker-entrypoint-initdb.d
USER postgres
