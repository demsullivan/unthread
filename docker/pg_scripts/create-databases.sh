#!/usr/bin/env bash
# Ansible managed
set -euo pipefail

echo "Booting databases..."

function create_database {
  local database="${1:-}"

  if [[ $1 == "" ]]; then
    echo "create-databases.sh: no database name was given to the create_database function." >&2
    exit 1
  fi

  echo "Creating database '$database'..."

  psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE DATABASE "$database";
    GRANT ALL PRIVILEGES ON DATABASE "$database" TO "$POSTGRES_USER";
EOSQL
}

function create_extension {
  local extension="${1:-}"
  local database="${2:-}"

  if [[ $1 == "" ]]; then
    echo "create-databases.sh: no extension name was given to the create_extension function." >&2
    exit 1
  fi

  if [[ $2 == "" ]]; then
    echo "create-databases.sh: no database name was given to the create_extension function." >&2
    exit 1
  fi

  echo "Creating extension '$extension'..."

  psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" $database <<-EOSQL
    CREATE EXTENSION IF NOT EXISTS $extension;
EOSQL
}

if [ -n "$POSTGRES_DBS" ]; then
  for db in $(echo $POSTGRES_DBS | tr ',' ' '); do
    create_database $db

    if [ -n "$POSTGRES_EXTENSIONS" ]; then
      for extension in $(echo $POSTGRES_EXTENSIONS | tr ',' ' '); do
        create_extension $extension $db
      done 
    fi
  done
fi
