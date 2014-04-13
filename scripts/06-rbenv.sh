#!/usr/bin/env bash

set -e

CURRDIR=$(cd "$(dirname $0)" && pwd -P)

source "$CURRDIR/utils.sh"

RBENV_USERNAME=$USER

setup_rbenv "$HOME/.rbenv" "$RBENV_USERNAME" "$RBENV_USERNAME" "$HOME"
