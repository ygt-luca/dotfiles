#!/usr/bin/env bash

set -e

CURRDIR=$(cd "$(dirname $0)" && pwd -P)

source "$CURRDIR/utils.sh"

PHANTOMJS=1.9.7-linux-x86_64

download_if_missing "https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-$PHANTOMJS.tar.bz2"

mkdir -p "$HOME/Downloads"
echo "Ensure dir $HOME/Downloads"

rm -rf "$HOME/Downloads/phantomjs-$PHANTOMJS"
echo "Removed old extracted directory $HOME/Downloads/phantomjs-$PHANTOMJS"

tar xjf "$HOME/Downloads/phantomjs-$PHANTOMJS.tar.bz2" -C "$HOME/Downloads/"
echo "Extracted $HOME/Downloads/phantomjs-$PHANTOMJS.tar.bz2"

mkdir -p "$HOME/bin/src"
echo "Ensure dir $HOME/bin/src"

rm -f "$HOME/bin/phantomjs"
echo "Removed binary or symlink $HOME/bin/phantomjs"

rm -rf "$HOME/bin/src/phantomjs-$PHANTOMJS"
echo "Removed old source $HOME/bin/src/phantomjs-$PHANTOMJS"

mv "$HOME/Downloads/phantomjs-$PHANTOMJS" "$HOME/bin/src/"
echo "Moved new source $HOME/Downloads/phantomjs-$PHANTOMJS to $HOME/bin/src/"

make_symlink "$HOME/bin/src/phantomjs-$PHANTOMJS/bin/phantomjs" "$HOME/bin/phantomjs"
echo "Created symlink $HOME/bin/phantomjs"

echo "phantomjs version $(phantomjs -v) successfully installed"
