#!/bin/bash

# creating mysql db
DB_NAME=${DB_NAME:-some}
mysqladmin -uroot create DB_NAME

supervisord