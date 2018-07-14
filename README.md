First of all, create app folder and a .env file with your own values (values can be anything you need)
mkdir app
cp conf/env_example conf/.env

Create your app folder in app (default app folder is yourappfolder defined in .env file like this: APP_FOLDER=yourappfolder)
mkdir app/yourappfolder

Copy your files into APP_FOLDER, can be done with git clone, or any other way:
cd app/yourappfolder && git clone gitprojecturl yourappfolder

Excecute this for fix/set permissions
docker exec -it lamp1-http /usr/local/bin/set-permissions

Excecute this for install composer and other needed dev tools: (supose we use Laravel, so create .env, call migrate, etc, can be commented if not needed)
docker exec  lamp1-http /usr/local/bin/install-dev-tools

Excecute this for recreate database
docker exec -it lamp1-http /usr/local/bin/rebuild-db

Access to the machine:
docker exec -it lamp1-http bash

Inside the machine, in project folder, use this for install vendors
sudo -u usr1 composer update

