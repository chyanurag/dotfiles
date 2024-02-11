#!/bin/sh
choice=`echo -e "shutdown\nreboot\nlogout\n" | dmenu`
case $choice in
	"shutdown") shutdown -P now ;;
	"reboot") reboot ;;
	"logout") pkill -u $USER ;;
esac
