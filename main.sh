#!/bin/bash

repo_url=$1
repo_name=`echo \$repo_url | cut -d '/' -f5`
repo_name=`echo \$repo_name | cut -d '.' -f1`
echo "$repo_name"

git clone $repo_url

chmod +x make_package_dot_json.sh make_src_directory.sh make_appserver.sh make_config.sh make_routes.sh
cd $repo_name
../make_package_dot_json.sh $repo_name $repo_url
../make_src_directory.sh
../make_appserver.sh
../make_config.sh
../make_routes.sh
ls

# npm install

git config --global user.name "\$2"
git config --global user.name 
git config --global user.email "\$3"
git config --global user.email
git config --global user.password "\$4"

git add .
git commit -m "init"
git push
# npm install
# npm start