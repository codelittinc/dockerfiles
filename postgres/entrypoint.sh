#!/bin/bash

if [ ! -d "/var/lib/pgsql/data" ]; then
        exit 1;
fi

if [ ! -d "/var/lib/pgsql/data/base" ]; then
        chown postgres:postgres /var/lib/pgsql/data
        su postgres -c "/usr/lib/postgresql/9.3/bin/initdb -D /var/lib/pgsql/data"
        su postgres -c "/usr/lib/postgresql/9.3/bin/postgres --config-file=/etc/postgresql/9.3/main/postgresql.conf > /dev/null &"
        # hack
        sleep 3

        # DATABASE NAMES
        while read p; do
                su postgres -c "/usr/lib/postgresql/9.3/bin/createdb $p"
        done < databases.txt

        su postgres -c "psql -U postgres -d postgres -c \"alter user postgres with password 'postgres';\""

        kill `ps aux | grep '/bin/postgres' | awk '{print $2}'`
        # hack
        sleep 3
fi

exec su postgres -c "/usr/lib/postgresql/9.3/bin/postgres --config-file=/etc/postgresql/9.3/main/postgresql.conf"
