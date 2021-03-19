#!/bin/bash
set -e -x
sudo apt install -y curl git unrar

## firmware loader
[ -d facetimehd-firmware ] || git clone https://github.com/patjak/facetimehd-firmware.git
cd facetimehd-firmware
make
sudo make install
cd ..

## firmware data (already extracted in this repo)
sudo cp firmware/*.dat /usr/lib/firmware/facetimehd

## driver
[ -d bcwc_pcie ] || git clone https://github.com/patjak/bcwc_pcie.git
cd bcwc_pcie
make
sudo make install
cd ..

# you may get SSL errors, but it appears these are safe to ignore
sudo depmod
sudo modprobe -r bdc_pci
sudo modprobe facetimehd
echo facetimehd | sudo tee -a /etc/modules > /dev/null
