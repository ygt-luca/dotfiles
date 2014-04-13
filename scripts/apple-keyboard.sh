#!/usr/bin/env bash

set -e

CURRDIR=$(cd "$(dirname $0)" && pwd -P)

source "$CURRDIR/utils.sh"

# https://help.ubuntu.com/community/AppleKeyboard

echo options hid_apple fnmode=2 | sudo tee -a /etc/modprobe.d/hid_apple.conf
echo options hid_apple iso_layout=0 | sudo tee -a /etc/modprobe.d/hid_apple.conf
sudo update-initramfs -u -k all
