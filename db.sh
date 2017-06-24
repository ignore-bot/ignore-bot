#!/bin/bash

pword=`cat dbpass.token`
db=`cat dbname.token`
table=`cat tablename.token`

mysql -p$pword -e "\
    CREATE DATABASE IF NOT EXISTS $db; \
    USE $db; \
    DROP TABLE IF EXISTS $table; \
    CREATE TABLE $table (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, \
    full_name CHAR(128) NOT NULL, file_name CHAR(64) NOT NULL, status CHAR(64) NOT NULL);"
