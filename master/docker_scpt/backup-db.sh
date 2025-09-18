#!/bin/bash


# Variables
CONTAINER_NAME="mariadb_server"
DB_USER="toolkit"
DB_PASS="12shsql"
DB_NAME="toolkit_db"
BACKUP_PATH="/opt/mariadb_backup"
DATE=$(date +%F_%H-%M-%S)

# Create backup
echo "[INFO] Starting database backup..."
docker exec $CONTAINER_NAME mysqldump -u$DB_USER -p$DB_PASS $DB_NAME > "$BACKUP_PATH/${DB_NAME}_backup_$DATE.sql"

if [ $? -eq 0 ]; then
    echo "[SUCCESS] Backup created at $BACKUP_PATH/${DB_NAME}_backup_$DATE.sql"
else
    echo "[ERROR] Backup failed!"
fi

