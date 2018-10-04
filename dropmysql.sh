#!/bin/bash

echo "Start Mysql migration"
#mysql -u [username] -p -e "create database somedb"

docker exec --user wodby ilcorporate_php mysql -hmariadb -ucorporate -pcorporate_pass -e "drop database corporate_test"
docker exec --user wodby ilsupport_php mysql -hmariadb -usupport -psupport_pass -e "drop database support_test"
docker exec --user wodby iluniversity_php mysql -hmariadb -uuniversity -puniversity_pass -e "drop database university_test"
docker exec --user wodby ilcorporate_php mysql -hmariadb -ucorporate -pcorporate_pass -e "create database corporate_test"
docker exec --user wodby ilsupport_php mysql -hmariadb -usupport -psupport_pass -e "create database support_test"
docker exec --user wodby iluniversity_php mysql -hmariadb -uuniversity -puniversity_pass -e "create database university_test"


docker exec --user wodby ilcorporate_php mysql -hmariadb -ucorporate -pcorporate_pass corporate_test -e "source db/corporate/mysql.sql"
docker exec --user wodby ilsupport_php mysql -hmariadb -usupport -psupport_pass support_test -e "source db/support/mysql.sql"
docker exec --user wodby iluniversity_php mysql -hmariadb -uuniversity -puniversity_pass university_test -e "source db/university/mysql.sql"

echo "Finish Mysql migration"