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
            'clang'
            'cmake'
            'unzip'
            'libc-dev'
            'mitmproxy'
            'libffi-dev'
            'terminator'
            'ninja-build'
            'python3-pip'
            'python3-dev'
            'python3-cffi'
            'python3-brotli'
            'libyaml-dev'
            'libmagic-dev'
            'libgtk-3-dev'
            'dconf-editor'
            'gnome-tweaks'
            'libxml2-utils'
            'build-essential'
            'apt-transport-https'
            'indicator-multiload'
            'gnome-shell-extensions'
        )

        sudo apt-get update && sudo apt-get upgrade -y
        check_status

        echo -e "\n🐣 ${BOLD}Initiating package installation${RESET}\n"
        for pkg in "${ESSENTIAL_PACKAGES[@]}"; do
            echo -e "\n💿 ${YELLOW}Installing - ${RESET} ${BOLD}$pkg${RESET}"
            sudo apt-get install "$pkg" -y
            check_status
        done

        echo -e "\n🐣 ${BOLD}Enabling minimize & maximize option${RESET}\n"
        gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
        gsettings set org.gnome.desktop.wm.preferences action-double-click-titlebar 'toggle-maximize'
        check_status

        echo -e "\n🐣 ${BOLD}Setting up lazygit${RESET}\n"
        if ! [ -x "$(command -v lazygit)" ]; then
            sudo add-apt-repository ppa:lazygit-team/release -y
            sudo apt-get update
            sudo apt-get install lazygit -y
            check_status
        fi

        echo -e "\n🐣 ${BOLD}Setting up lazydocker${RESET}\n"
        if ! [ -x "$(command -v lazydocker)" ]; then
            curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
            check_status
        fi

        echo -e "\n🌀 ${BOLD}Cleaning up the mess${RESET}\n"
        sudo apt autoclean && sudo apt autoremove
        check_status
    fi

    if [ -f /etc/redhat-release ]; then
        echo -e "🎩 ${BOLD}Redhat based machine${RESET}\n"

        # TODO: add package support for redhat ecosystem
    fi

fi


if [[ "$SYSTEM" == "Darwin" ]]; then
    echo -e "🖥 ${BOLD}Mac based machine${RESET}\n"

    # checking if brew is install: MacOS package manager
    if test ! $(which brew); then
        echo -e "🏠 Installing brew package manager\n"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        check_status
    fi

    # TODO: add package support for mac
fi
