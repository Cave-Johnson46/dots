#!/bin/bash

##var=`sed -n '16p' ~/.config/hypr/monitors.conf`
var=`awk 'NR==16{print $3}' ~/.config/hypr/monitors.conf`
var2="false"
var3="true"

if [[ $var == $var2 ]]; then
    awk ' {gsub(/false/, "true"); print}' ~/.config/hypr/monitors.conf > ~/.config/hypr/test
    mv ~/.config/hypr/test ~/.config/hypr/monitors.conf
    hyprctl --batch " reload; dispatch exec hyprpaper"
elif [[ "$var" == $var3 ]]; then
    awk ' {gsub(/true/, "false"); print}' ~/.config/hypr/monitors.conf > ~/.config/hypr/test
    mv ~/.config/hypr/test ~/.config/hypr/monitors.conf
    hyprctl --batch " reload; dispatch exec hyprpaper"
fi


