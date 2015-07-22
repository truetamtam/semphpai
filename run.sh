#!/bin/bash

# creating mysql db
DB_NAME=${DB_NAME:-some}

# start mysql server
echo "Starting MySQL server..."
/usr/bin/mysqld_safe >/dev/null 2>&1 &

# wait for mysql server to start (max 30 seconds)
timeout=30
while ! /usr/bin/mysqladmin -u root status >/dev/null 2>&1
do
timeout=$(($timeout - 1))
if [ $timeout -eq 0 ]; then
  echo "Could not connect to mysql server. Aborting..."
  exit 1
fi
sleep 1
done

/usr/bin/mysqladmin -u root create ${DB_NAME}

# Start supervisord and services
/usr/bin/supervisord -n -c /etc/supervisord.conf