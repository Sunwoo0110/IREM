#!/bin/bash

## make config/config.js
CONFIG=../$1/src/config/config.js
config_script=$(cat <<EOF
require("dotenv").config();

module.exports = {
    host : process.env.MYSQL_HOST,
    user : process.env.MYSQL_USER,
    password : process.env.MYSQL_PASSWORD,
    database : process.env.MYSQL_DATABASE,
    port : process.env.MYSQL_PORT
};
EOF
)

if [[ -f "$CONFIG" ]]; then
    rm $CONFIG
fi

touch $CONFIG

echo "$config_script" >> $CONFIG
