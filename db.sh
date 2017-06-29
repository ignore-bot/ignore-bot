#!/usr/bin/env bash

pword=`cat dbpass.token`
db=`cat dbname.token`
table=`cat tablename.token`

if [ ! $1 ]
then
    echo "Usage:"
    echo "[install]"
    echo "[list]"
    echo "[clean]"
fi

if [[ "$1" == "install" || "$1" == "clean" ]]
then
    mysql -p$pword -e "\
        CREATE DATABASE IF NOT EXISTS $db; \
        USE $db; \
        DROP TABLE IF EXISTS $table; \
        CREATE TABLE $table (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, \
        full_name CHAR(128) NOT NULL, file_name CHAR(64) NOT NULL, status CHAR(64) NOT NULL);"
fi

if [ "$1" == "list" ]
then
    mysql -p$pword -D "$db" -e "SELECT * FROM $table"
fi
