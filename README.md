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

## Full Installation

```bash
git clone --recursive https://github.com/lucfabresse/dotfiles $HOME/.dotfiles && $HOME/.dotfiles && ./install_full
# Log out and log in
```

## To do / To look at

- dotbot-local
  - local / private customization
  - https://www.anishathalye.com/2014/08/03/managing-your-dotfiles/
- dotbot-gsettings
- save the git config in a 2nd user-specific path (`~/.config/git/config`), so I can override stuff in the local machine (in `~/.gitconfig`), such as the email.
- dotbot-apt do not show a progress bar or so. could we use `debconf-apt-progress`?
- what about passwords/credentials?
  - https://chrisschuld.com/2019/06/securing-information-in-dotfiles-and-aliases-with-pass/
  - https://www.passwordstore.org/
  - https://www.dyne.org/software/tomb/
  - https://www.passwordstore.org/#extensions
  - https://f-droid.org/packages/dev.msfjarvis.aps/
- Tresorit
- android remote app
- copy/paste terminal (tilix?)
- clipboard manager
  - https://extensions.gnome.org/extension/779/clipboard-indicator/
  - https://esite.ch/tag/diodon/
- custom bin scripts ~/.dotfiles/bin
  - in .zshrc add export PATH=~/.dotfiles/bin:${PATH}

## sudo problem

Another solution:

sudo -v && ./install
sudo -v && ./install_full

```
- shell:
 - command: sudo -n install -D -m644 systemd/timesyncd.conf /etc/systemd/timesyncd.conf
    stderr: true
```