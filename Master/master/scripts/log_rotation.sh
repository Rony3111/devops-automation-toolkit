#!/bin/bash

LOG_DIR="/var/log"
ARCHIVE_DIR="$LOG_DIR/archive"
TODAY=$(date +%F)

# List of log files safe to archive
FILES_TO_ARCHIVE=(
  "messages"
  "secure"
  "cron"
  "maillog"
  "dnf.log"
  "dnf.rpm.log"
)

sudo mkdir -p $ARCHIVE_DIR

# Loop through and archive if older than 7 days
for LOG_FILE in "${FILES_TO_ARCHIVE[@]}"; do
	FILE_PATH="$LOG_DIR/$LOG_FILE"

    # Skip if file doesn't exist
    if [ ! -f "$FILE_PATH" ]; then
	sudo mkdir -p $ARCHIVE_DIR/$LOG_FILE    
        continue
    fi

    # Check if file is older than 7 days
    if [ $(sudo find "$FILE_PATH" -mtime +7 -print) ]; then
        ARCHIVE_NAME="${LOG_FILE%.*}_$TODAY.tar.gz"

	 # Create a subdirectory inside archive folder for this log (optional)
        DEST_DIR="$ARCHIVE_DIR/$LOG_FILE"
        sudo mkdir -p "$DEST_DIR"

        echo "Archiving $LOG_FILE to $ARCHIVE_NAME"

        sudo tar -czf "$DEST_DIR/$ARCHIVE_NAME" -C "$LOG_DIR" "$LOG_FILE"

        if [ $? -eq 0 ]; then
            echo "Archived. Removing $LOG_FILE"
            sudo truncate -s 0 "$FILE_PATH"  # safer than rm for active logs
        else
            echo "Failed to archive $LOG_FILE"
        fi
    fi
done

