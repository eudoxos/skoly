#!/bin/bash
snap install zoom-client teams
apt update
apt -y dist-upgrade
apt install webext-ublock-origin
# add zoom, teams, lowriter, loimpress, firefox launchers to the panel
APPLETSRC=plasma-org.kde.plasma.desktop-appletsrc
echo > ~/.config/$APPLETSRC <<END
[Containments][0][Applets][xx][Configuration
localPath=...
url=...


END
cp ~/.config/$APPLETSRC /etc/skel/.config/
