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

        # package list
        ESSENTIAL_PACKAGES=(
            'git'
            'zip'
            'zsh'
            'gcc'
            'curl'
            'htop'
            'make'
            'unzip'
            'nginx'
            'libc-dev'
            'libffi-dev'
            'python3-pip'
            'python3-dev'
            'libxml2-utils'
            'build-essential'
            'apt-transport-https'
        )

        sudo apt-get update && sudo apt-get upgrade -y
        check_status

        echo -e "\n🐣 ${BOLD}Initiating package installation${RESET}\n"
        for pkg in "${ESSENTIAL_PACKAGES[@]}"; do
            echo -e "\n💿 ${YELLOW}Installing - ${RESET} ${BOLD}$pkg${RESET}"
            sudo apt-get install "$pkg" -y
            check_status
        done

        echo -e "\n🌀 ${BOLD}Cleaning up the mess${RESET}\n"
        sudo apt autoclean && sudo apt autoremove
        check_status
    fi

    if [ -f /etc/redhat-release ]; then
        echo -e "🎩 ${BOLD}Redhat based machine${RESET}\n"

        # TODO: add package support for redhat based machines
    fi

fi
