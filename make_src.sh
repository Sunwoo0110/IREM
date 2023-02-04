#!/bin/bash

## make src directory
mkdir -p src

## make config, routes directory
mkdir -p src/config
mkdir -p src/routes

## make app.js
APP=src/app.js
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

## make config/config.js
CONFIG=src/config/config.js
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

## make routes/db.js
DB=src/routes/db.js
db_script=$(cat <<EOF
const dotenv = require("dotenv");
const config = require('../config/config');
const mysql = require('mysql2');

dotenv.config(); //LOAD CONFIG

const connection = mysql.createConnection(config);

try {
    connection.connect();
    console.log("[server] DB connection is sucessfull")
} catch (e) {
    console.error(e);
}

module.exports = connection;
EOF
)

if [[ -f "$DB" ]]; then
    rm $DB
fi

touch $DB

echo "$db_script" >> $DB

## make routes/index.js
ROUTES=src/routes/index.js
routes_script=$(cat <<EOF
const router = require("express").Router();

router.use("/test", require("./test"));

module.exports = router;
EOF
)

if [[ -f "$ROUTES" ]]; then
    rm $ROUTES
fi

touch $ROUTES

echo "$routes_script" >> $ROUTES

## make routes/test directory
mkdir -p src/routes/test

## make routes/test/test.ctrl.js
CTRL=src/routes/test/test.ctrl.js
ctrl_script=$(cat <<EOF
/* Test API file */

const db = require("../db");

exports.get_root = (req,res) => {
    db.query('SELECT * from test', (error, rows) => {
        if (error) {
            throw error;
        }
        console.log(rows);
        res.send(rows);
    });
};
EOF
)

if [[ -f "$CTRL" ]]; then
    rm $CTRL
fi

touch $CTRL

echo "$ctrl_script" >> $CTRL

## make routes/test/index.js
TEST=src/routes/test/index.js
test_script=$(cat <<EOF
/* Test APIs */
const router = require("express").Router();
const ctrl = require("./test.ctrl");

/* GET */
router.get("/", ctrl.get_root);

module.exports = router;
EOF
)

if [[ -f "$TEST" ]]; then
    rm $TEST
fi

touch $TEST

echo "$test_script" >> $TEST
