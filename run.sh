#!/bin/bash
set -e -x
[ `id -u` -eq 0 ] || ( echo Must be run with sudo, exiting. && exit 1)
snap install zoom-client teams
apt update
apt -y dist-upgrade
apt install -y webext-ublock-origin vim
# install full language support
apt install $(check-language-support)
## this is for KDE Plasma
# add zoom, teams, lowriter, loimpress, firefox launchers to the panel
# just put the config file from github to /etc/skel for new users
APPLETS_CFG=plasma-org.kde.plasma.desktop-appletsrc
mkdir -p /etc/skel/.config
wget https://github.com/eudoxos/skoly/raw/main/$APPLETS_CFG -O /etc/skel/.config/$APPLETS_CFG
## this is for gnome-shell
# see https://askubuntu.com/a/1193560/24839
# and https://help.gnome.org/admin/system-admin-guide/stable/dconf-custom-defaults.html.en
# gsettings set org.gnome.shell favorite-apps ""
echo -e "user-db:user\nsystem-db:local\n" > /etc/dconf/profile/user
mkdir -p /etc/dconf/db/local.d
echo > /etc/dconf/db/local.d/10-skoly-default-favorites <<FAVORITES
[org/gnome/shell]
favorite-apps=['org.gnome.Nautilus.desktop','firefox.desktop','teams_teams.desktop','zoom-client_zoom-client.desktop','libreoffice-writer.desktop','libreoffice-impress.desktop','snap-store_ubuntu-software.desktop','yelp.desktop']
FAVORITES
dconfig update
## most laptops don't need this
##
# apt install -y lm-sensors fancontrol
# sensors-detect # this is interactive
# /etc/init.d/kmod start
# pwmconfig
