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