#!/bin/bash

## make package.json file

FILE=package.json
script=$(cat <<EOF
{
    "name": "YOUR_PROJECT_NAME",
    "version": "1.0.0",
    "description": "YOUR_PROJECT_DESCRIPTION",
    "main": "index.js",
    "scripts": {
        "start": "nodemon --watch src/ src/server.js"
    },
    "repository": {
        "type": "git",
        "url": "git+YOUR_GITHUB_REPOSITORY_URL"
    },
    "author": "",
    "license": "ISC",
    "bugs": {
        "url": "YOUR_GITHUB_REPOSITORY_URL/issues"
    },
    "homepage": "YOUR_GITHUB_REPOSITORY_URL#readme",
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