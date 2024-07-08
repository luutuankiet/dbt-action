##
#  Generic dockerfile for dbt image building.
#  See README for operational details
##

# Top level build args
ARG build_for=linux/amd64

##
# base image (abstract)
##
# Please do not upgrade beyond python3.10.7 currently as dbt-spark does not support
# 3.11py and images do not get made properly
FROM python:3.10.7-slim-bullseye as base

# N.B. The refs updated automagically every release via bumpversion
# N.B. dbt-postgres is currently found in the core codebase so a value of dbt-core@<some_version> is correct

ARG dbt_core_ref=dbt-core@v1.8.3
ARG dbt_postgres_ref=dbt-core@v1.8.3
ARG dbt_snowflake_ref=dbt-snowflake@v1.8.3
ARG dbt_spark_ref=dbt-spark@v1.8.0
ARG dbt_databricks_ref=dbt-databricks@v1.8.3
ARG dbt_clickhouse_ref=dbt-clickhouse@v1.8.0

# Env vars
ENV PYTHONIOENCODING=utf-8
ENV LANG=C.UTF-8

# Set docker basics
WORKDIR /usr/app/dbt/
ENTRYPOINT ["dbt"]

RUN apt-get update \
  && apt-get dist-upgrade -y \
  && apt-get install \
    -yq --no-install-suggests --no-install-recommends --allow-downgrades --allow-remove-essential --allow-change-held-packages \
    python-dev \
    libsasl2-dev \
    gcc \
    git \
    unixodbc-dev \
  && apt-get clean \
  && rm -rf \
    /var/lib/apt/lists/* \
    /tmp/* \
    /var/tmp/*

RUN python -m pip install --no-cache "git+https://github.com/ClickHouse/${dbt_clickhouse_ref}#egg=dbt-clickhouse" \
  && python -m pip install --no-cache "git+https://github.com/dbt-labs/${dbt_snowflake_ref}#egg=dbt-snowflake" \
  && python -m pip install --no-cache "git+https://github.com/databricks/${dbt_databricks_ref}#egg=dbt-databricks" \
  && python -m pip install --no-cache "git+https://github.com/dbt-labs/${dbt_spark_ref}#egg=dbt-spark[${dbt_spark_version}]"