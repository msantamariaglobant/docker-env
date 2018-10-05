#!/bin/bash

echo "Start config settings install"

cp ./config/corporate/settings.php ./projects/corporate/web/sites/default/settings.php
cp ./config/support/settings.php ./projects/support/web/sites/default/settings.php
cp ./config/university/settings.php ./projects/university/web/sites/default/settings.php

cd corporate
make drush updb 
make drush cim 
make drush cr

cd ../support
make drush updb 
make drush cim 
make drush cr

cd ../university
make drush updb 
make drush cim 
make drush cr

echo "Finish config settings install"