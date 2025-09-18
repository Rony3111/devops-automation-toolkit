#!/bin/bash

#!/bin/bash

# Name of the container
CONTAINER_NAME="mariadb_server"

# Check if container exists
if ! docker ps -a --format '{{.Names}}' | grep -wq "$CONTAINER_NAME"; then
    echo "[ERROR] Container '$CONTAINER_NAME' does not exist."
    exit 1
fi

# Check container status
STATUS=$(docker inspect -f '{{.State.Status}}' "$CONTAINER_NAME")

echo "[INFO] Container '$CONTAINER_NAME' status: $STATUS"

# Check container health (if defined)
HEALTH_STATUS=$(docker inspect --format='{{if .State.Health}}{{.State.Health.Status}}{{else}}not defined{{end}}' "$CONTAINER_NAME")

echo "[INFO] Container health: $HEALTH_STATUS"

# Show last 10 lines of logs
echo "[INFO] Last 10 lines of container logs:"
docker logs --tail 10 "$CONTAINER_NAME"

