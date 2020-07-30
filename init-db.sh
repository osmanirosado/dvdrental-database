#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE DATABASE dvdrental;
EOSQL

pg_restore -U postgres -d dvdrental /root/dvdrental.tar
