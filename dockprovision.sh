#!/bin/bash

echo "Start Provision"
cd projects/corporate
docker exec --user wodby ilcorporate_php composer install
cd ../support
docker exec --user wodby ilsupport_php composer install
cd ../university
docker exec --user wodby iluniversity_php composer install

echo "Finish Provision"