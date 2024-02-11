#!/bin/sh
bat=$(cat /sys/class/power_supply/BAT0/capacity)
remind20="false"
while true
do
    charing=`cat /sys/class/power_supply/BAT0/status`
    if [ "$charging" != "Discharging" ];
    then
        continue
    fi
    if [ "$bat" -le 10];
    then
        notify-send "10% Battery remaining"
    fi
    if [ "$bat" -le 20 -a "$remind20" == "false"  ];
    then
        notify-send "20% Battery remaining!"
        remind20="true"
    fi
    sleep 5
    bat=$(cat /sys/class/power_supply/BAT0/capacity)
done
