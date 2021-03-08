#!/bin/bash
set -e -x
[ `id -u` -eq 0 ] || ( echo Must be run with sudo, exiting. && exit 1)
snap install zoom-client teams
apt update
apt -y dist-upgrade
apt install -y webext-ublock-origin vim
# add zoom, teams, lowriter, loimpress, firefox launchers to the panel
# just put the config file from github to /etc/skel for new users
APPLETS_CFG=plasma-org.kde.plasma.desktop-appletsrc
wget https://github.com/eudoxos/skoly/raw/main/$APPLETS_CFG -O /etc/skel/.config/$APPLETS_CFG
##
## most laptops don't need this
##
# apt install -y lm-sensors fancontrol
# sensors-detect # this is interactive
# /etc/init.d/kmod start
# pwmconfig
