#!/bin/bash
# https://askubuntu.com/a/1302912/379494
STATUS=$(gsettings get org.gnome.desktop.input-sources xkb-options)
case $STATUS in
    "@as []" )
        gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape', 'shift:both_capslock', 'altwin:swap_alt_win']"
    ;;
    "['caps:escape', 'shift:both_capslock']" )
        echo "Toggling altwin swap on"
        gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape', 'shift:both_capslock', 'altwin:swap_alt_win']"
    ;;
    "['caps:escape', 'shift:both_capslock', 'altwin:swap_alt_win']" )
        echo "Toggling altwin swap off"
        gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape', 'shift:both_capslock']"
    ;;
    *)
       echo -e "gsettings keyboard options already exist. Leaving them alone:\n\t$STATUS" 
esac
