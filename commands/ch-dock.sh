#!/bin/bash

# Clear the screen for a clean prompt
clear

# Prompt for parameters
echo "Please enter the following parameters:"

# Prompt for container name
read -p "Enter container name (default: firefox): " CONTAINER_NAME
CONTAINER_NAME=${CONTAINER_NAME:-firefox}

# Prompt for PUID
read -p "Enter PUID (default: 1000): " PUID
PUID=${PUID:-1000}

# Prompt for PGID
read -p "Enter PGID (default: 1000): " PGID
PGID=${PGID:-1000}

# Prompt for Timezone
read -p "Enter Timezone (default: Etc/UTC): " TZ
TZ=${TZ:-Etc/UTC}

# Prompt for Firefox CLI URL
read -p "Enter Firefox CLI URL (default: https://google.com/): " FIREFOX_CLI
FIREFOX_CLI=${FIREFOX_CLI:-https://google.com/}

# Prompt for port 1 mapping
read -p "Enter port mapping for 3000 (default: 3000): " PORT1
PORT1=${PORT1:-3000}

# Prompt for port 2 mapping
read -p "Enter port mapping for 3001 (default: 3001): " PORT2
PORT2=${PORT2:-3001}

# Prompt for shared memory size
read -p "Enter shared memory size (default: 1gb): " SHM_SIZE
SHM_SIZE=${SHM_SIZE:-1gb}

# Construct and execute the docker run command
docker run -d \
  --name "$CONTAINER_NAME" \
  -e PUID="$PUID" \
  -e PGID="$PGID" \
  -e TZ="$TZ" \
  -e FIREFOX_CLI="$FIREFOX_CLI" \
  -p "$PORT1":3000 \
  -p "$PORT2":3001 \
  --shm-size="$SHM_SIZE" \
  --restart unless-stopped \
  lscr.io/linuxserver/firefox:latest

# Notify the user
echo "Docker container '$CONTAINER_NAME' is being started with the specified configuration."
echo "Follow the link to access the Firefox container at http://localhost:$PORT1"
