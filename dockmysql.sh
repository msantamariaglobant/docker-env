#!/bin/bash

echo "Start Mysql migration"
cd corporate
docker exec --user wodby ilcorporate_php mysql -hmariadb -ucorporate -pcorporate_pass corporate_test < ../db/corporate/mysql.sql
cd ../support
docker exec --user wodby ilsupport_php mysql -hmariadb -usupport -psupport_pass support_test < ../db/support/mysql.sql
cd ../university
docker exec --user wodby iluniversity_php mysql -hmariadb -uuniversity -puniversity_pass university_test < ../db/university/mysql.sql
echo "Finish Mysql migration"