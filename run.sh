#!/bin/bash
# run this script with sudo
snap install zoom-client teams
apt update
apt -y dist-upgrade
apt install webext-ublock-origin
# add zoom, teams, lowriter, loimpress, firefox launchers to the panel
# just put the config file from github to /etc/skel for new users
APPLETS_CFG=plasma-org.kde.plasma.desktop-appletsrc
wget https://github.com/eudoxos/skoly/blob/main/$APPLETS_CFG -O /etc/skel/.config/$APPLETS_CFG
##
apt install -y lm-sensors fancontrol
sensors-detect # this is interactive
/etc/init.d/kmod start
pwmconfig
