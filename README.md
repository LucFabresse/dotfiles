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

- dotbot-local
  - local / private customization
  - https://www.anishathalye.com/2014/08/03/managing-your-dotfiles/
- save the git config in a 2nd user-specific path (`~/.config/git/config`), so I can override stuff in the local machine (in `~/.gitconfig`), such as the email.
- dotbot-apt do not show a progress bar or so. could we use `debconf-apt-progress`?
- android remote app
- clipboard manager
  - https://extensions.gnome.org/extension/779/clipboard-indicator/
  - https://esite.ch/tag/diodon/
- custom bin scripts ~/.dotfiles/bin
  - in .zshrc add export PATH=~/.dotfiles/bin:${PATH}
- tmux / split term

## Excluded

- dotbot-gsettings plugin