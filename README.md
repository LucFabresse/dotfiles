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
$ git config submodule.dotbot-apt.ignore untracked

$ ./install_minimal
./install_minimal
Updating APT
Installing the APT packages: apt-transport-https, ca-certificates, curl, gnupg-agent
APT packages installed successfully
...

==> All tasks executed successfully
```

Note, to ignore __pycache__ in `dotbot-apt` submodule:
```
git config submodule.dotbot-apt.ignore untracked
```

## Full Installation

```bash
git clone --recursive https://github.com/lucfabresse/dotfiles $HOME/.dotfiles && $HOME/.dotfiles && ./install_full
# Log out and log in
```

# Internal notes

## To do / To look at

- android remote app
- clipboard manager
  - https://extensions.gnome.org/extension/779/clipboard-indicator/
  - https://esite.ch/tag/diodon/
- custom bin scripts ~/.dotfiles/bin
  - in .zshrc add export PATH=~/.dotfiles/bin:${PATH}
- tmux / split term

- dotbot-apt do not show a progress bar or so. could we use `debconf-apt-progress`?

## Excluded

- dotbot-gsettings plugin