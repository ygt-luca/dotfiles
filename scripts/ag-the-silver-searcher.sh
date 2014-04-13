#!/usr/bin/env bash

if [[ $(command -v ag) ]]; then
  echo "ag, the silver searcher is already installed"
  exit 0
fi

set -e

CURRDIR=$(cd "$(dirname $0)" && pwd -P)

source "$CURRDIR/utils.sh"

echo "Ensure ~/Downloads directory"
mkdir -p ~/Downloads

echo "Update apt index..."
sudo apt-get update -qq

echo "Install compile dependencies..."
sudo apt-get install -y -qq \
  git-core \
  automake \
  pkg-config \
  libpcre3-dev \
  zlib1g-dev \
  liblzma-dev \

ag_source=~/Downloads/the_silver_searcher

if [[ ! -d $ag_source ]]; then
  git clone https://github.com/ggreer/the_silver_searcher.git "$ag_source"
fi

cd $ag_source
./build.sh

sudo make install

archive_filename="ag-silver-searcher-compiled-$(date -d "today" +"%Y-%m-%d_%H-%M-%S")"
echo "Archive compiled source to $archive_filename for uninstall"
tar cfz "$archive_filename" "$ag_source"

rm -rf "$ag_source"

echo

if [[ $(command -v ag) ]]; then
  echo "silver searcher ($(command -v ag)) successfully installed"
else
  echo "error while installing silver searcher"
fi
