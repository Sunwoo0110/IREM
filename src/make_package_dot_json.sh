#!/bin/bash

## make package.json file
# ls
# cd ..
# ls
# cd workspace/$1
FILE=../workspace/$1/package.json
script=$(cat <<EOF
{
    "name": "\$1",
    "version": "1.0.0",
    "description": "\$1",
    "main": "index.js",
    "scripts": {
        "start": "nodemon --watch src/ src/server.js"
    },
    "repository": {
        "type": "git",
        "url": "git+\$2"
    },
    "author": "",
    "license": "ISC",
    "bugs": {
        "url": "\$2/issues"
    },
    "homepage": "\$2#readme",
    "dependencies": {
        "body-parser": "^1.20.0",
        "dotenv": "^16.0.1",
        "express": "^4.18.1",
        "mysql2": "^2.3.3"
    },
    "devDependencies": {
        "nodemon": "^2.0.18"
    }
}
EOF
)

if [[ -f "$FILE" ]]; then
    rm $FILE
fi

touch $FILE

echo "$script" >> $FILE
# echo "$script"
