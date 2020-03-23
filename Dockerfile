FROM postgres:12.2-alpine

COPY dvdrental.tar /dvdrental.tar
COPY init-db.sh /docker-entrypoint-initdb.d/init-db.sh

