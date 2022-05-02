#!/bin/bash

# Install the tools (and dependencies)
sudo apt install gnome-tweaks gnome-shell-extensions gnome-shell-extension-prefs curl wget jq unzip -y

# Install extensions. See https://github.com/cyfrost/install-gnome-extensions
wget -O ./install-gnome-extensions.sh -N -q "https://raw.githubusercontent.com/cyfrost/install-gnome-extensions/master/install-gnome-extensions.sh"
chmod +x install-gnome-extensions.sh
./install-gnome-extensions.sh --enable 6 8 19 1160
rm ./install-gnome-extensions.sh

# 6 = https://extensions.gnome.org/extension/6/applications-menu/
# 8 = https://extensions.gnome.org/extension/8/places-status-indicator/
# 19 = https://extensions.gnome.org/extension/19/user-themes/
# 1160 = https://extensions.gnome.org/extension/1160/dash-to-panel/

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