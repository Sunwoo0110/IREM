#!/bin/bash


repo_url=$1
repo_name=`echo \$repo_url | cut -d '/' -f5`
repo_name=`echo \$repo_name | cut -d '.' -f1`
echo "$repo_name"

ls
git clone https://$2:$4@github.com/$2/$repo_name.git

cd $repo_name

## make src directory
mkdir -p $repo_name/src

## make config, routes directory
mkdir -p $repo_name/src/config
mkdir -p $repo_name/src/routes


## make app.js
APP=$repo_name/src/app.js
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

echo "hi" >> README.md

git config --global user.name $2
git config --global user.name 
git config --global user.email $3
git config --global user.email

git add .
git commit -m "init"
git push
