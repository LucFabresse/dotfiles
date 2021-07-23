#!/bin/bash

# example:
# ./loadDconf.sh /org/gnome/ gnome.dconf

if [ "$#" -ne 2 ]; then
    dconf load / < settings.dconf
else
    dconf load $1 < $2
fi