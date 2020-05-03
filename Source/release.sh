#!/usr/bin/env bash

version=$(git symbolic-ref --short HEAD)

git checkout master
git merge "$version"
git tag "$version"
git push --tags github

make all

upload_url=$(curl -X POST -d '{"tag_name": "'$version'", "draft": true}' https://github.com/the-nick-of-time/Cookbook/releases |
	jq '.upload_url')

curl -X POST -d $(cat ../Cookbook.pdf) "$upload_url?name=Cookbook.pdf"
curl -X POST -d $(cat ../Cookbook-Tested_only.pdf) "$upload_url?name=Cookbook_tested.pdf"
