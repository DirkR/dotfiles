#!/bin/bash
#shell script to backup MySql database 
# To backup mysql databases file to a dir and later pick up by your 
# script. You can skip few databases from backup too.
# For more info please see (Installation info):
# http://www.cyberciti.biz/nixcraft/vivek/blogger/2005/01/mysql-backup-script.html 
# Last updated: Aug - 2005
# THIS IS NOT AN ORIGINAL COPY - IT HAS BEEN MODIFIED!
# GOTO NIXCRAFT TO GET AN ORIGINAL COPY
# Modified by Kieran Whitbread in 2007
# --------------------------------------------------------------------
# This is a free shell script under GNU GPL version 2.0 or above
# Copyright (C) 2004, 2005 nixCraft project
# Feedback/comment/suggestions : http://cyberciti.biz/fb/
# -------------------------------------------------------------------------
# This script is part of nixCraft shell script collection (NSSC)
# Visit http://bash.cyberciti.biz/ for more information.
# -------------------------------------------------------------------------
#

#drue: user and password defined in ~/.my.cnf
#MyUSER="backup_user"     # USERNAME
#MyPASS="backup_password"       # PASSWORD 
MyHOST="localhost"          # Hostname

# Linux bin paths, change this if it can't be autodetected via which command
MYSQL="$(which mysql)"
MYSQLDUMP="$(which mysqldump)"
CHOWN="$(which chown)"
CHMOD="$(which chmod)"
GZIP="$(which gzip)"

# Backup Dest directory, change this if you have someother location
DEST="$PWD"

# Get data in dd-mm-yyyy format
NOW="$(date +"%d-%m-%Y")"

# File to store current backup file
FILE=""
# Store list of databases 
DBS=""

# DO NOT BACKUP these databases
IGGY="mysql test information_schema performance_schema"

[ ! -d $DEST ] && mkdir -p $DEST || :

# Only root can access it!
#$CHOWN 0.0 -R $DEST
#$CHMOD 0600 $DEST

# Get all database list first
DBS="$($MYSQL -Bse 'show databases')"

for db in $DBS
do
    skipdb=-1
    if [ "$IGGY" != "" ];
    then
        for i in $IGGY
        do
            [ "$db" == "$i" ] && skipdb=1 || :
        done
    fi

    if [ "$skipdb" == "-1" ] ; then
        FILE="$DEST/$db.sql.gz"
        $MYSQLDUMP --events --ignore-table=mysql.events --skip-lock-tables $db | $GZIP -9 > $FILE
    fi
done
