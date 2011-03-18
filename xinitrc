#!/bin/sh

/usr/bin/xrdb -load $HOME/.Xdefaults
/usr/bin/xkbcomp -I$HOME/.xkb $HOME/.xkb/keymap ${DISPLAY}

exec awesome
