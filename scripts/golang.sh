#!/usr/bin/env bash

set -e

CURRDIR=$(cd "$(dirname $0)" && pwd -P)

source "$CURRDIR/utils.sh"

GO_VERSION=1.2.1
GO_WORKSPACE="$HOME/go"

download_if_missing "http://go.googlecode.com/files/go${GO_VERSION}.linux-amd64.tar.gz"

echo "Ensure dir $HOME/bin"
mkdir -p "$HOME/bin"

echo "Ensure go projects dirs: $GO_WORKSPACE and $GO_WORKSPACE/src"
mkdir -p "$GO_WORKSPACE/src"

echo "Remove old installation (dir /usr/local/go)"
sudo rm -rf "/usr/local/go"

append_if_missing 'export GOPATH="$HOME/go"' "$HOME/.bashrc"
append_if_missing 'export PATH="$PATH:$GOPATH/bin"' "$HOME/.bashrc"
append_if_missing 'export PATH="$PATH:/usr/local/go/bin"' "$HOME/.bashrc"

. "${HOME}/.bashrc"

echo "Extract $HOME/Downloads/go${GO_VERSION}.linux-amd64.tar.gz -> /usr/local"
sudo tar -C /usr/local -xzf "$HOME/Downloads/go${GO_VERSION}.linux-amd64.tar.gz"

echo "Checking installation: $(go version) installed in /usr/local"
