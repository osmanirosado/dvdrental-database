#!/bin/bash
set -e

echo "Create database with name: '$DVD_RENTAL_DB' ..."
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE DATABASE "$DVD_RENTAL_DB";
EOSQL

echo "Restore DVD Rental database on '$DVD_RENTAL_DB' ..."
pg_restore -U postgres -d "$DVD_RENTAL_DB" /home/dvdrental.tar
