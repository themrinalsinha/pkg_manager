# 🐧 `Linux` Package Managing Scripts
Repo containing helper shell scripts to install all the necessary packages while setting up desktop or servers. It mostly contains tools/packages that i use on daily basis.

## Documentation

- **`desktop/setup.sh`** Desktop setup script
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

---
### Support
- [x] Debian Based Machine
- [ ] Redhat Based Machine
- [ ] Mac Based Machine
