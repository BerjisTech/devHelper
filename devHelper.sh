#!/bin/bash

# A tool for your common tasks

# ANSI Color Codes
RED='\033[0;31m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

# Reset SSH Agent
ssh_reset() {
    printf "Running ${YELLOW}%s${NC} ...\n" "eval \$(ssh-agent -s)"
    eval "$(ssh-agent -s)"
    ssh-add -D # Clear all identities from the agent first
    printf "Running ${YELLOW}%s${NC} ...\n" "ssh-add ~/.ssh/id_rsa"
    ssh-add ~/.ssh/id_rsa
    printf "\n"
}

# Main menu loop
while true; do
    printf "${GREEN}Choose an option:${YELLOW}\n"
    printf "1) Reset SSH Agent\n"
    printf "q) Exit${NC}\n"

    read -p "Enter your choice [1 or q]: " choice

    case $choice in
        1)
            ssh_reset
            ;;
        q)
            printf "Exiting...\n"
            exit 0
            ;;
        *)
            printf "${RED}Invalid choice.${NC}\n"
            ;;
    esac
done
