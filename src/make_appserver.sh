#!/bin/bash

## make app.js
APP=../$1/src/app.js
app_script=$(cat <<EOF
const express = require("express");

class App {
    constructor() {
        
        this.app = express();

        this.middleware();

        /* body parsing */
        this.bodyParsing();

        /* router */
        this.getRouting();

        /* 404 error */
        this.status404();

        /* error handling */
        this.errorHandler();
    }

    middleware() {
        /* Add your middleware */
    }
    
    bodyParsing() {
        this.app.use(express.json());
        this.app.use(express.urlencoded({ extended: true }));
    }

    getRouting() {
        this.app.use(require("./routes"));
    }

    status404() {
        this.app.use((req, res, _) => {
            res.status(404).send("Error Code 400");
        });
    }

    errorHandler() {
        this.app.use((errreq, res, _) => {
            res.status(500).send("Error Code 400");
        });
    }
}

module.exports = new App().app;
EOF
)

if [[ -f "$APP" ]]; then
    rm $APP
fi

touch $APP

echo "$app_script" >> $APP

## make server.js
SERVER=src/server.js
server_script=$(cat <<EOF
const app = require("./app.js");
const port = 3000;

const server = app.listen(port, () => {
    console.log('[server] Express listening on port:3000');
    console.log('[baseURL] http://localhost:3000');
});
EOF
)

if [[ -f "$SERVER" ]]; then
    rm $SERVER
fi

touch $SERVER

echo "$server_script" >> $SERVER
