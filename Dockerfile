ARG DBT_VERSION=v1.9.0
FROM ghcr.io/luutuankiet/dbt_all:${DBT_VERSION}

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
