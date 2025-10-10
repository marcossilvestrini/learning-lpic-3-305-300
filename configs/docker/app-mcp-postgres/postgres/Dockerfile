FROM postgres:latest
ENV TZ=UTC
COPY init /docker-entrypoint-initdb.d
USER postgres
