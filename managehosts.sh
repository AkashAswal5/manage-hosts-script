#!/bin/bash

# Script to ADD or REMOVE entries from /etc/hosts
# Usage:
#   sudo ./managehosts.sh add <IP_ADDRESS> <HOSTNAME>
#   sudo ./managehosts.sh remove <IP_ADDRESS> <HOSTNAME>

ACTION="$1"
IP="$2"
HOSTNAME="$3"

# Function to print usage
usage() {
    echo "Usage:"
    echo "  sudo $0 add <IP_ADDRESS> <HOSTNAME>     # To add entry"
    echo "  sudo $0 remove <IP_ADDRESS> <HOSTNAME>  # To remove entry"
    exit 1
}

# Validate input
if [[ -z "$ACTION" || -z "$IP" || -z "$HOSTNAME" ]]; then
    usage
fi

# Perform action
case "$ACTION" in
    add)
        if grep -qE "^$IP[[:space:]]+$HOSTNAME" /etc/hosts; then
            echo "⚠️  Entry '$IP $HOSTNAME' already exists in /etc/hosts"
        else
            echo "$IP    $HOSTNAME" | sudo tee -a /etc/hosts > /dev/null
            echo "✅ Added '$IP $HOSTNAME' to /etc/hosts"
        fi
        ;;
    remove)
        if grep -qE "^$IP[[:space:]]+$HOSTNAME" /etc/hosts; then
            sudo sed -i "/^$IP[[:space:]]\+$HOSTNAME/d" /etc/hosts
            echo "✅ Removed '$IP $HOSTNAME' from /etc/hosts"
        else
            echo "⚠️  Entry '$IP $HOSTNAME' not found in /etc/hosts"
        fi
        ;;
    *)
        usage
        ;;
esac
