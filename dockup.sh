#!/bin/bash

echo "Start Proxy Reverse Traefik"


cd corporate
make up
cd ../support
make up
cd ../university
make up
cd ..
make up

echo "Termine"