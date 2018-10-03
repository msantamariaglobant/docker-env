#!/bin/bash

echo "Stop Proxy Reverse Traefik"
cd corporate
make down
cd ../support
make down
cd ../university
make down
cd ..
make down
echo "Termine"