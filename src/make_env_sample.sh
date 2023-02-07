#!/bin/bash

## make env.sample
ENVSAMPLE=.env.sample
envsample_script=$(cat <<EOF
/* .env file example */
MYSQL_HOST = "Your Host"
MYSQL_USER = "Your User"
MYSQL_PASSWORD = "Your Password"
MYSQL_DATABASE = "Your DB"
MYSQL_PORT = "3306"
EOF
)

if [[ -f "$ENVSAMPLE" ]]; then
    rm $ENVSAMPLE
fi

touch $ENVSAMPLE

echo "$envsample_script" >> $ENVSAMPLE