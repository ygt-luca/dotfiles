#!/usr/bin/env bash

set -e

CURRDIR=$(cd "$(dirname $0)" && pwd -P)

source "$CURRDIR/utils.sh"

VAGRANT_VERSION=1.4.3

download_if_missing "https://dl.bintray.com/mitchellh/vagrant/vagrant_${VAGRANT_VERSION}_x86_64.deb"

sudo apt-get install -y gdebi

sudo gdebi -n "${HOME}/Downloads/vagrant_${VAGRANT_VERSION}_x86_64.deb"
