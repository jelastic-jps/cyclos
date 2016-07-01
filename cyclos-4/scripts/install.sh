#!/bin/bash

_USER="$1"
_DBNAME="$2"
_PASSWORD="$3"
_DUMP_URL="https://raw.githubusercontent.com/jelastic-jps/cyclos-4/master/dumps/dump.sql"
_HOME_DIRECTORY="/var/lib/jelastic/bin/"

wget=`which wget`
psql=`which psql`
sed=`which sed`

cd ${_HOME_DIRECTORY}

PGPASSWORD=$(cat /var/log/jem.log  | grep passwd | tail -n 1 | awk -F "-p " '{ print $2}');
export PGPASSWORD;

$psql postgres webadmin << EOF
     CREATE USER ${_USER} WITH PASSWORD '${_PASSWORD}';
     CREATE DATABASE ${_DBNAME} OWNER ${_USER};
     CREATE EXTENSION CUBE;
     CREATE EXTENSION EARTHDISTANCE;
     CREATE EXTENSION POSTGIS;
     CREATE EXTENSION UNAcCENT;
EOF
 
$wget "${_DUMP_URL}" -O dump.sql;
$psql ${_DBNAME} webadmin < dump.sql;
$psql ${_DBNAME} webadmin << EOF
     update id_cipher_rounds set
	mask = (random() * 9999999999999)::bigint * case when random() < 0.5 then 1 else -1 end,
        rotate_bits = (random() * 62)::int + 1;
EOF


echo -e  "# IMPORTANT NOTE! \n# Please make sure there is a blank line after the last cronjob entry.\n\n" | crontab -;

unset PGPASSWORD;
