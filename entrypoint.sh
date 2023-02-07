#!/bin/bash


repo_url=$1
repo_name=`echo \$repo_url | cut -d '/' -f5`
repo_name=`echo \$repo_name | cut -d '.' -f1`
echo "$repo_name"


pwd
ls
git clone https://$2:$4@github.com/$2/$repo_name.git

cd $repo_name
echo "hig" >> README.md

git config --global user.name $2
git config --global user.name 
git config --global user.email $3
git config --global user.email

git add .
git commit -m "init"
git push
