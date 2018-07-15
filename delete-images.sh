#!/bin/bash
WEB_CONT=$1
WEB_IMG=$2
MYSQL_CONT=$3
MYSQL_IMG=$4
VOLUME_DB=$5

deleteContainerAndImg() {
    if [ "$1" != "" ]; then
        echo "Stopping the containr $1 ... "
        docker stop $1
        echo "Deleting the containr $1 ... "
        docker rm $1
    fi
    IMG=$(docker images | grep "$2" | cut -d " " -f 1)
    if [ "$IMG" != "" ]; then
        echo "Deleting container image $IMG ..."
        docker rmi $IMG
    fi
}

read -p "This will delete the machines, volumes and images, are you sure? (yes/NO): " RESP

WEB_ID=$(docker ps -a | grep -i "$WEB_CONT" | cut -d " " -f 1)

	if [ "$RESP" = "yes" ]; then 
		deleteContainerAndImg "$WEB_ID" "$WEB_IMG"
        deleteContainerAndImg "$MYSQL_CONT" "$MYSQL_IMG"

DB_VOL_ID=$(docker volume  ls | grep "$VOLUME_DB" | awk '{print $2}')
        if [ "$DB_VOL_ID" != "" ]; then
            echo "Deleting $DB_VOL_ID volume..."
            docker volume rm $DB_VOL_ID
        fi
    fi