#!/usr/bin/env bash

set -e

CURRDIR=$(cd "$(dirname $0)" && pwd -P)

source "$CURRDIR/utils.sh"

add_ppa_if_missing "ppa:numix/ppa" # numix theme and icons

echo "Update apt index"
sudo apt-get update -qq

echo "Install numix packages"
sudo apt-get -y -qq install \
  numix-gtk-theme \
  numix-icon-theme \
  numix-icon-theme-utouch \
  numix-wallpaper-notd
