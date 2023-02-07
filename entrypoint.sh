#!/bin/bash


repo_url=$1
repo_name=`echo \$repo_url | cut -d '/' -f5`
repo_name=`echo \$repo_name | cut -d '.' -f1`
echo "$repo_name"

cd ../../
pwd
ls
git clone https://$2:$4@github.com/$2/$repo_name.git


cd src
chmod +x make_package_dot_json.sh make_src_directory.sh make_appserver.sh make_config.sh make_routes.sh make_env_sample.sh make_gitignore.sh
cd ..
src/make_package_dot_json.sh $repo_name $repo_url
src/make_src_directory.sh $repo_name
src/make_appserver.sh $repo_name
src/make_config.sh $repo_name
src/make_routes.sh $repo_name
src/make_env_sample.sh $repo_name
src/make_gitignore.sh $repo_name
ls


cd $repo_name
git config --global user.name $2
git config --global user.name 
git config --global user.email $3
git config --global user.email

git add .
git commit -m "init"
git push
