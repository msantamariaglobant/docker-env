#!/bin/bash

echo "init sites"
mkdir -p projects
#mkdir -p projects/support
#mkdir -p projects/university

cd projects/

git clone -b develop --single-branch git@github.com:ImagineLearning/website-corporate.git corporate
git clone -b develop --single-branch git@github.com:ImagineLearning/website-support.git support
git clone -b develop --single-branch git@github.com:ImagineLearning/website-university.git university

cd support/
git submodule update --init --recursive

echo "finish init"
