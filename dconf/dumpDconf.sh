#!/bin/bash

# example:
# ./dumpDconf.sh /org/gnome/ gnome.dconf
# ./dumpDconf.sh /org/gnome/terminal/ gterm.dconf


if [ "$#" -ne 2 ]; then
    rm -f dump.dconf
    dconf dump / > dump.dconf
else
    dconf dump $1 > $2
fi

