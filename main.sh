#!/bin/bash

repo_url=$1
repo_name=`echo \$repo_url | cut -d '/' -f5`
repo_name=`echo \$repo_name | cut -d '.' -f1`
echo "$repo_name"

git clone https://$2:$3@github.com/$2/$repo_name.git

cd src
chmod +x make_package_dot_json.sh make_src_directory.sh make_appserver.sh make_config.sh make_routes.sh
cd ../$repo_name
../src/make_package_dot_json.sh $repo_name $repo_url
../src/make_src_directory.sh
../src/make_appserver.sh
../src/make_config.sh
../src/make_routes.sh
ls

git config --global user.name $2
git config --global user.name 
git config --global user.email $3
git config --global user.email

git add .
git commit -m "init"
git push