#!/bin/bash

echo "init sites"

mkdir -p projects

cd projects/

git clone -b develop --single-branch reponame corporate
git clone -b develop --single-branch reponame support
git clone -b develop --single-branch reponame university

cd support/
git submodule update --init --recursive

echo "finish init"
