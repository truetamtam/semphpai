#!/bin/bash

# creating mysql db
DB_NAME=${DB_NAME:-some}

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

supervisord