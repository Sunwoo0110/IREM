#!/bin/bash

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