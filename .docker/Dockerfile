ARG QGIS_TEST_VERSION=stable-noble
FROM  qgis/qgis:${QGIS_TEST_VERSION}

RUN apt-get update && \
    apt-get -y install openjdk-8-jre curl locales postgresql-client python3-geoalchemy2 \
    && rm -rf /var/lib/apt/lists/*

RUN printf '[postgres]\nhost=db\ndbname=postgres\nuser=postgres\n' >> /etc/postgresql-common/pg_service.conf
RUN printf '[pg_qwat]\nhost=db\ndbname=qwat\nuser=postgres\npassword=postgres\n' >> /etc/postgresql-common/pg_service.conf

# Some defaults
ENV POSTGRES_PASSWORD=postgres
# otherwise psycopg2 cannot connect
ENV PGSERVICEFILE=/etc/postgresql-common/pg_service.conf
ENV PGSERVICE=pg_qwat
ENV LANG=C.UTF-8

# https://github.com/qgis/qgis-docker/pull/131
ENV PYTHONPATH=/usr/share/qgis/python

WORKDIR /
