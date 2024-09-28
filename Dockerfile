FROM bash:5.2 AS temporal

WORKDIR /home

RUN wget -q https://www.postgresqltutorial.com/wp-content/uploads/2019/05/dvdrental.zip
RUN unzip -q dvdrental.zip

FROM postgres:16.3

ENV DVD_RENTAL_DB=dvd_rental

COPY --from=temporal /home/dvdrental.tar /home/dvdrental.tar
COPY 01-init-dvd-rental-db.sh /docker-entrypoint-initdb.d/
