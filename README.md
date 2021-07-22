# Luc's dotfiles

It uses:
- [dotbot](https://github.com/anishathalye/dotbot)
- [dotbot-apt](https://github.com/bryant1410/dotbot-apt)

## Prerequisites

- Pop!_OS 21.04
- Ubuntu 21.04
- other apt-based distro?

## Minimal Installation

```bash
$ git clone --recursive https://github.com/lucfabresse/dotfiles $HOME/.dotfiles
$ cd $HOME/.dotfiles

$ ./install_minimal
./install_minimal                            
Updating APT
Installing the APT packages: apt-transport-https, ca-certificates, curl, gnupg-agent
APT packages installed successfully
Install oh-my-zsh [[ ! -d $HOME/.oh-my-zsh ] && sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh) --unattended" || :]
VScode APT source [[ ! -f /etc/apt/trusted.gpg.d/microsoft.gpg ] && wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /tmp/microsoft.gpg && install -o root -g root -m 644 /tmp/microsoft.gpg /etc/apt/trusted.gpg.d/ && echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list || :]
All commands have been executed
Updating APT
Installing the APT packages: code, btrfs-progs, gnome-tweaks, neofetch, zsh, bridge-utils, build-essential, cmake, llvm, clang, gdb, gdbserver, lldb, cpu-checker, default-jdk, diffutils, e2fsprogs, findutils, firefox, flatpak, fonts-firacode, git, gparted, grep, gwenview, gzip, htop, aspell-en, hunspell-en-us, hyphen-en-us, jq, libffi-dev, libgl1-mesa-glx:i386, libreadline-dev, libssl-dev, libxml2-dev, libreoffice, mythes-en-us, mlocate, mosh, ncurses-base, ncurses-bin, python-is-python3, python3-gpg, python3-pip, python3-venv, rclone, shellcheck, tmux, tree, vim, wireshark-qt, xclip, xz-utils
APT packages installed successfully
Installing Google Chrome [TEMP_DEB=$(mktemp) && wget -O "$TEMP_DEB" 'https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb' && dpkg --skip-same-version -i "$TEMP_DEB" && rm -f "$TEMP_DEB"]
Installing Google Chrome dependencies [apt --fix-broken -y install]
All commands have been executed
Change SHELL to zsh [chsh -s $(which zsh)]
All commands have been executed
Adding the Flathub repository to Flatpak [flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo]
Install Postman [flatpak install -y flathub com.getpostman.Postman]
All commands have been executed

==> All tasks executed successfully
All targets have been cleaned
Install powerline fonts [./fonts/powerline-fonts/install.sh]
Load GTerm conf into dconf [./gnome/terminal/loadGTermConf.sh]
All commands have been executed
Link exists ~/.zshrc -> /home/luc2104/.dotfiles/zsh/zshrc_minimal
Link exists ~/.oh-my-zsh/custom -> /home/luc2104/.dotfiles/zsh/custom
Link exists ~/.config/Code/User/settings.json -> /home/luc2104/.dotfiles/vscode/settings_minimal.json
All links have been set up
Path exists /home/luc2104/.local/bin
All paths have been set up
Installing Visual Studio Code extensions...
Installing extension fkrull.gtk-dark-titlebar
All extensions installed successfully
0 extensions were already installed

==> All tasks executed successfully
```

## Full Installation

```bash
git clone --recursive https://github.com/lucfabresse/dotfiles $HOME/.dotfiles && $HOME/.dotfiles && ./install_full
```

Run the following to finish the Docker installation:

```bash
sudo usermod -aG docker $USER
# Log out and log in 
```

## To look at

- dotbot-gsettings
- save the git config in a 2nd user-specific path (`~/.config/git/config`), so I can override stuff in the local machine (in `~/.gitconfig`), such as the email. 
