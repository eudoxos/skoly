#!/bin/bash
snap install zoom-client teams
apt update
apt -y dist-upgrade
apt install webext-ublock-origin
# add zoom, teams, lowriter, loimpress, firefox launchers to the panel
APPLETSRC=~/.config/plasma-org.kde.plasma.desktop-appletsrc
cp $APPLETSRC $APPLETSRC~
echo > $APPLETSRC <<END
[Containments][0][Applets][xx][Configuration
localPath=...
url=...


END
cp $APPLETSRC /etc/skel/.config/
