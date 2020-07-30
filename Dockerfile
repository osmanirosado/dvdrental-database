FROM bash:5.0 AS temporal

WORKDIR /home

RUN wget https://sp.postgresqltutorial.com/wp-content/uploads/2019/05/dvdrental.zip
RUN unzip -q dvdrental.zip

FROM postgres:12.2-alpine

ENV DVD_RENTAL_DB=dvd_rental

COPY --from=temporal /home/dvdrental.tar /home/dvdrental.tar
COPY init-db.sh /docker-entrypoint-initdb.d/init-db.sh
