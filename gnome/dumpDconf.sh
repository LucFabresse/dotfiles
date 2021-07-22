#!/bin/bash

# example: 
# ./dumpDconf.sh /org/gnome/ gnome.dconf
# ./dumpDconf.sh /org/gnome/terminal/ gterm.dconf

dconf dump $1 > $2