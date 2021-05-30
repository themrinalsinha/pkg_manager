# 🐧 `Linux` Package Managing Scripts

[![DEPLOY ( dl.mrinal.xyz/x/ )](https://github.com/themrinalsinha/pkg_manager/actions/workflows/deploy.yml/badge.svg)](https://github.com/themrinalsinha/pkg_manager/actions/workflows/deploy.yml)

Repo containing helper shell scripts to install all the necessary packages while setting up desktop or servers. It mostly contains tools/packages that i use on daily basis.

## Documentation
- **`bensh.sh`** System benchmarking (for both desktop or server)
  ```
  $ wget -O - https://dl.mrinal.xyz/x/bench.sh | bash
  ```

- **`desktop/setup.sh`** Desktop setup script
  ```shell
  $ wget -O - https://dl.mrinal.xyz/x/desktop/setup.sh | bash
  ```
  - List of packages it installs
    ```
    git, zip, zsh,gcc,htop,make,unzip,libc-dev,mitmproxy,libffi-dev, terminator, python3-pip, python3-dev, dconf-editor, gnome-tweaks, libxml2-utils, build-essential, apt-transport-https, indicator-multiload, gnome-shell-extensions
    ```
  - Setting up the default terminal
    ```shell
    $ sudo update-alternatives --config x-terminal-emulator
    ```
  - Setting up custom `zsh` prompt
    ```shell
    $ wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
    ```
    Enabling `zsh` shell as default
    ```shell
    $ chsh
    $ /bin/zsh # enter in the prompt
    ```
  - Installs flat icon theme from [snwh](https://launchpad.net/~snwh/+archive/ubuntu/ppa?field.series_filter=bionic)
  - Run docker without `sudo`
    ```shell
    $ sudo usermod -aG docker ${USER}
    $ su - ${USER}
    $ id -nG
    $ sudo usermod -aG docker ${USER}
    ```
- **`server/setup.sh`** Server setup script
  ```shell
  $ wget -O - https://dl.mrinal.xyz/x/server/setup.sh | bash
  ```
  - List of packages it installs on server
    ```
    git, zip, zsh, gcc, curl, htop, make, unzip, nginx, libc-dev, libffi-dev, python3-pip, python3-dev, libxml2-utils, build-essential, apt-transport-https
    ```
  - Rest other setting if required can be followed from above.

---
### Support
- [x] Debian Based Machine
- [ ] Redhat Based Machine
- [ ] Mac Based Machine
