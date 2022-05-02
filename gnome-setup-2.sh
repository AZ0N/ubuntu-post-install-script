#!/bin/bash

# Make sure the extensions are enabled
gnome-extensions enable dash-to-panel@jderose9.github.com
gnome-extensions enable ding@rastersoft.com
gnome-extensions enable ubuntu-appindicators@ubuntu.com
gnome-extensions enable places-menu@gnome-shell-extensions.gcampax.github.com
gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com

# Gnome tweaks settings
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.desktop.calendar show-weekdate true
gsettings set org.gnome.desktop.interface clock-format '24h'
gsettings set org.gnome.desktop.interface icon-theme "Yaru-purple-dark"

# Download and install Dracula GTK theme. See https://draculatheme.com/gtk
wget https://github.com/dracula/gtk/archive/master.zip
unzip master.zip &> /dev/null
rm master.zip
sudo mv gtk-master /usr/share/themes/Dracula

# Apply the theme
gsettings set org.gnome.desktop.interface gtk-theme "Dracula"
gsettings set org.gnome.desktop.wm.preferences theme "Dracula" # This is probably obsolete, however the Dracula website mentions it
gsettings set org.gnome.shell.extensions.user-theme name "Dracula"

# Apply Gnome terminal profile
dconf reset -f /org/gnome/terminal/ # Reset settings to default
dconf load /org/gnome/terminal/ < gnome_terminal_settings.txt # Load settings from saved file

# Wallpaper
mkdir -p ~/Pictures/Wallpapers
cp Mandelbulb.png ~/Pictures/Wallpapers/
gsettings set org.gnome.desktop.background picture-uri "file:///home/$USER/Pictures/Wallpapers/Mandelbulb.png"
gsettings set org.gnome.desktop.background picture-uri-dark "file:///home/$USER/Pictures/Wallpapers/Mandelbulb.png"