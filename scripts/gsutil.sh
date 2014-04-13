#!/usr/bin/env bash

set -e

CURRDIR=$(cd "$(dirname $0)" && pwd -P)

source "$CURRDIR/utils.sh"

mkdir -p $HOME/bin $HOME/Downloads
echo "Ensure ~/bin and ~/Downloads"

append_if_missing 'export PATH="$HOME/bin/gsutil:$PATH"' $HOME/.bashrc
export PATH="$HOME/bin/gsutil:$PATH"

wget -O $HOME/Downloads/gsutil.tar.gz http://commondatastorage.googleapis.com/pub/gsutil.tar.gz

tar xfz $HOME/Downloads/gsutil.tar.gz -C $HOME/Downloads
echo "Extract gsutil"

rm $HOME/bin/gsutil -rf

mv -f $HOME/Downloads/gsutil $HOME/bin/
echo "Move gsutil dir to ~/bin"

echo "$(which gsutil) has been successfully installed"
