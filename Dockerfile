FROM postgres:12.2

COPY dvdrental.tar /dvdrental.tar
COPY init-db.sh /docker-entrypoint-initdb.d/init-db.sh

