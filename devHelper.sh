#!/bin/bash

# A tool for your common tasks

# ANSI Color Codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

# Reset SSH Agent
ssh_reset() {
    echo -e "Running ${YELLOW} eval `ssh-agent -s` ${NC} ..."
    eval `ssh-agent -s`
    echo -e "Running ${YELLOW} ssh-add ~/.ssh/id_rsa ${NC} ..."
    ssh-add ~/.ssh/id_rsa
    echo ""   
}

# Main menu loop
while true; do
    echo -e "${GREEN}Choose an option:${YELLOW}"
    echo -e "1) Reset SSH Agent"
    echo -e "q) Exit${NC}"

    read -p "Enter your choice [1-6]: " choice

    case $choice in
        1)
            ssh_reset
            ;;
        q)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid choice."
            ;;
    esac
done