#!/usr/bin/env bash

# gnome-tweaks -> dconf
# org.gnome.desktop.input-sources sources [('xkb', 'us+altgr-intl')]
# org.gnome.desktop.input-sources xkb-options ['ctrl:swap_lwin_lctl']

if [ ! -f /usr/share/X11/xkb/symbols/us.backup ]; then
    cp /usr/share/X11/xkb/symbols/us /usr/share/X11/xkb/symbols/us.backup
    cp -f keyboard/us.luc /usr/share/X11/xkb/symbols/us
fi

