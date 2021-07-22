#!/bin/bash

# example: 
# ./loadDconf.sh /org/gnome/ gnome.dconf 

dconf load $1 < $2