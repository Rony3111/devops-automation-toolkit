#!/bin/bash


# Variables
CONTAINER_NAME="mariadb_server"
DB_USER="toolkit"
DB_PASS="12shsql"
DB_NAME="toolkit_db"
BACKUP_PATH="/home/devops/db_bkp/mariadb_backup"
DATE=$(date +%F_%H-%M-%S)

# Create Backup folder
ls -lrth /opt/

if [ ! -d "$BACKUP_PATH" ]
then
    echo "[INFO] Creating backup folder at $BACKUP_PATH..."
    mkdir -p "$BACKUP_PATH" || {
        echo "[ERROR] Failed to create $BACKUP_PATH. Run with sudo or fix permissions."
        exit 1
    }
fi

if [ ! -w "$BACKUP_PATH" ]; then
    echo "[ERROR] Cannot write to $BACKUP_PATH. Check permissions."
    exit 1
fi


# Create backup
echo "[INFO] Starting database backup..."
docker exec $CONTAINER_NAME mysqldump -u$DB_USER -p$DB_PASS $DB_NAME > "$BACKUP_PATH/${DB_NAME}_backup_$DATE.sql"

if [ $? -eq 0 ]; then
    echo "[SUCCESS] Backup created at $BACKUP_PATH/${DB_NAME}_backup_$DATE.sql"
else
    echo "[ERROR] Backup failed!"
fi

