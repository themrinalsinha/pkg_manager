#!/bin/bash

SYSTEM=$(uname -s)

# defining color encoding
tput clear
RED=`tput setaf 1`
GREEN=`tput setaf 2`
YELLOW=`tput setaf 3`
RESET=`tput sgr0`
BOLD=`tput bold`


# function to check last executed command status
check_status() {
    if [ $? -eq 0 ]; then
        echo "✅ ${GREEN}${BOLD}Successful${RESET}"
    else
        echo "❌ ${RED}${BOLD}Failed${RESET}"
    fi
}


if [[ "$SYSTEM" == "Linux" ]]; then

    if [ -f /etc/lsb-release ]; then
        echo -e "🐧 ${BOLD}Debian based machine${RESET}\n"

    fi

    if [ -f /etc/redhat-release ]; then
        echo -e "🎩 ${BOLD}Redhat based machine${RESET}\n"
    fi

fi


if [[ "$SYSTEM" == "Darwin" ]]; then
    echo -e "🖥 ${BOLD}Mac based machine${RESET}\n"

fi
