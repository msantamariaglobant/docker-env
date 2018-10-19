
# DOCKER ENV INSTALL by Ivan Villalba and Marcelo Santamaria

Before you start with this installation, please check your ssh credentials to the IL repositories.

1. Make sure that you have the last backup DB for each site in the path ./db/[site]/mysql.sql

2. Make sure the sql file doesn't create a new DB.

3. Update the `dockinit.sh` file, replacing _reponame_ with the respective git path for each site.

Example:
```
git clone -b develop --single-branch [PATH-TO-CORPORATE-REPOSITORY] corporate
```

4. With this command you clone the repositories in your local machine. 
```
./dockinit.sh
``` 

5. Creates the docker containers.
```
./dockup.sh
```

6. Execute composer install inside each project container. *CHECK TROUBLESHOTING*
```
./dockprovision.sh
```

7. Install the DB in each project.
```
./dockmysql.sh
```

8. Make sure that you have the last backup public files for each site. Move the backup files into your drupal public file directory site
Example path Drupal public files directory:
```
./projects/corporate/web/sites/default/files/
```

9. Set the settings.php and run the post install commands in each project.
```
./docksettings.sh
```

10. Build the theme files. *CHECK TROUBLESHOTING*
```
./themebuild.sh
```

## TROUBLESHOTING

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
