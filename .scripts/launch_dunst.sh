#!/bin/sh
cp ~/.cache/wal/dunstrc ~/.config/dunst
pkill dunst > /dev/null
setsid dunst &
