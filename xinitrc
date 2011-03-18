#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

#export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

/usr/bin/xrdb -load /home/jesse/.Xdefaults
/usr/bin/xkbcomp -I$HOME/.xkb $HOME/.xkb/keymap ${DISPLAY}

exec awesome
# setxkbmap de
