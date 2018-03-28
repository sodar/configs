#!/bin/bash

G_COLOR="org.gnome.settings-daemon.plugins.color"
G_NIGHT_TEMP="night-light-temperature"
G_NIGHT_TEMP_VALUE=4000

if gsettings get "${G_COLOR}" "${G_NIGHT_TEMP}" &> /dev/null; then
	gsettings set "${G_COLOR}" "${G_NIGHT_TEMP}" "${G_NIGHT_TEMP_VALUE}"
else
	echo "${0}: consider installing Gnome with Night Light"
fi
