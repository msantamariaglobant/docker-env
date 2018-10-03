#!/bin/bash

echo "Start Proxy Reverse Traefik"
make up

cd corporate
make up
cd ../support
make up
cd ../university
make up
echo "Termine"