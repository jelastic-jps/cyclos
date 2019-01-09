#!/bin/bash
MASTER_IP=$4
SLAVE_IP=$2
DB_PASSWORD=$3
PGSQL_DATA="/var/lib/pgsql/data/"


if [ "${1}" == "master" ]; then
    #set up master
    PGPASSWORD=${DB_PASSWORD} psql -Uwebadmin postgres -c "CREATE USER replication REPLICATION LOGIN CONNECTION LIMIT 1 ENCRYPTED PASSWORD '${DB_PASSWORD}';";
    sudo /etc/init.d/postgresql stop
    sed -i "1i host replication  replication       ${SLAVE_IP}/32    trust" ${PGSQL_DATA}pg_hba.conf;
    sed -i "s|.*wal_level.*|wal_level = hot_standby|g" ${PGSQL_DATA}postgresql.conf;
    sed -i "s|.*max_wal_senders.*|max_wal_senders = 8|g" ${PGSQL_DATA}postgresql.conf;
    sed -i "s|.*wal_keep_segments.*|wal_keep_segments = 32|g" ${PGSQL_DATA}postgresql.conf;
    sed -i "s|.*archive_mode.*|archive_mode = on|g" ${PGSQL_DATA}postgresql.conf;
    sed -i "s|.*archive_command.*| archive_command = 'cd .'|g" ${PGSQL_DATA}postgresql.conf;
    sudo /etc/init.d/postgresql start
fi

if [ "${1}" == "slave" ]; then
    #set up slave
    sudo /etc/init.d/postgresql stop
    rm -rf ${PGSQL_DATA};
    PGPASSWORD=${DB_PASSWORD} pg_basebackup -h ${MASTER_IP} -D ${PGSQL_DATA} -U replication -v -P;
    sed -i "1i host replication  replication       ${MASTER_IP}/32    trust" ${PGSQL_DATA}pg_hba.conf;
    sed -i "s|.*hot_standby.*|hot_standby = on|g" ${PGSQL_DATA}postgresql.conf;
    sed -i "153 a wal_level = hot_standby" ${PGSQL_DATA}postgresql.conf;
    sed -i "s|.*max_wal_senders.*|max_wal_senders = 1|g" ${PGSQL_DATA}postgresql.conf;
    sed -i "s|.*archive_mode.*|archive_mode = on|g" ${PGSQL_DATA}postgresql.conf;
    sed -i "s|.*archive_command.*| archive_command = 'cd .'|g" ${PGSQL_DATA}postgresql.conf;
    echo "standby_mode = on" > ${PGSQL_DATA}recovery.conf;
    echo "primary_conninfo = 'host=${MASTER_IP} port=5432 user=replication password=${DB_PASSWORD}'" >> ${PGSQL_DATA}recovery.conf;
    echo "trigger_file = '/tmp/postgresql.trigger.5432'" >> ${PGSQL_DATA}recovery.conf;
    sudo /etc/init.d/postgresql start
fi
