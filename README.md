### First of all, **create app folder and a .env file** with your own values (values can be anything you need) ### 
`mkdir app`

`cp conf/env_example conf/.env`

### **Create your app folder in app** (default app folder is yourappfolder defined in .env file like this: APP_FOLDER=yourappfolder) ### 
`mkdir app/yourappfolder`

### **Copy** your **files into APP_FOLDER**, can be done with git clone, or any other way: ### 
`cd app && git clone gitprojecturl yourappfolder && cd ..`

### **Build** the machines: ### 
`docker-compose build`

### **Run** the machines: ### 
`docker-compose up`

### Next commands (Set permissions, Install dev tools and rebuild Database)can be done with the Make File, there are grouped in one command: ###
`make rebuild_db_and_conf`

### Next are optional commands (no need it): ###

### In order to see all Make available commands just run make: ###
`make`

### **Excecute** this for fix/set permissions: ### 
`docker exec lamp1-http /usr/local/bin/set-permissions`

### Excecute this for **install** composer and other needed **dev tools**: (supose we use Laravel, so create .env, call migrate, etc, can be commented if not needed) ### 
`docker exec lamp1-http /usr/local/bin/install-dev-tools`

### Excecute this for **recreate database** ### 
`docker exec lamp1-http /usr/local/bin/rebuild-db`

### **Access** to the machine **bash** (if need do something in the machine): ### 
`docker exec -it lamp1-http bash`
