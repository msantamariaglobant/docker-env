
# DOCKER ENV INSTALL by Ivan Villalba and Marcelo Santamaria

Before you start with this installation, please check your ssh credentials to the IL repositories.

1. Git clone this repo. Inside you will see main folders like 'db' 'projects' and a folder for each site ('corporate', 'support', and 'university').

2. Make sure that you have the last backup DB for each site in the path docker-env/db/[site]/mysql.sql

3. Make sure the sql file doesn't create a new DB.

4. Update the `dockinit.sh` file, replacing _reponame_ with the respective git path for each site.

Example:
```
git clone -b develop --single-branch [PATH-TO-CORPORATE-REPOSITORY] corporate
```

5. With this command you clone the repositories in your local machine. 
```
./dockinit.sh
``` 

6. Creates the docker containers.
```
./dockup.sh
```

7. Execute composer install inside each project container. *CHECK TROUBLESHOTING*
```
./dockprovision.sh
```

8. Install the DB in each project.
```
./dockmysql.sh
```

9. Make sure that you have the last backup public files for each site. Move the backup files into your drupal public file directory site
Example path Drupal public files directory:
```
./projects/corporate/web/sites/default/files/
```

10. Set the settings.php and run the post install commands in each project.
```
./docksettings.sh
```

11. Build the theme files. *CHECK TROUBLESHOTING*
You should make sure you have your gulp and npm setup correct initially.(See package.json and the gulp require lines in the gulpfile.)
When you make changes inside the theme, you should run 'gulp dist' to prepare the javascript and css files.

## Regularly Using Your Environment

### Starting Up a Site
1. Each time you want to start up a site, you will want to go to the docker-env folder and run 'make up'.
2. Then cd into the specific site's folder (docker-env/SITEFOLDER), for instance docker-env/corporate.  and run ‘make up’

## Using composer/drush and other commands INSIDE the docker container
You need to run commands like composer inside the docker container.
1. Go to docker-env/SITENAME like docker-env/corporate. Run 'make shell' and you will connect to the docker container.
2. Then you can execute commands like 'composer install'. Or you can run drush commands.
3. Type 'exit' to exit the connection.

### Drush
You need to run commands like composer inside the docker container.
1. Go to docker-env/SITENAME like docker-env/corporate. Run 'make shell' and you will connect to the docker container.
2. Then you’ll be in that container. Cd to the 'web' folder and run drush commands, like ‘drush updatedb’ or ‘drush cr’


## TROUBLESHOTING

## Sites not hosting properly
Try restarting docker (closing all docker containers) and redoing the steps above for Starting Up a Site. 

### If you are a globant user and use centrify

- Enter to each project container and set the owner files the `wodby` user before run the step 5.

Example: 
```
  cd ./corporate
  make shell
  sudo chown -R wodby:wodby *
  cd ..
```

- Set the permission of your user for the themes folder before run the step 9.

Example:
```
sudo chown -R ./project/corporate/web/themes/custom/institutional_theme
```
