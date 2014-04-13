#!/usr/bin/env bash

set -e

CURRDIR=$(cd "$(dirname $0)" && pwd -P)

source "$CURRDIR/utils.sh"

append_if_missing 'cext.enabled=true' "$HOME/.jrubyrc"

install_ruby_with_rbenv_build "$HOME/.rbenv" 1.9.3-p484
install_ruby_with_rbenv_build "$HOME/.rbenv" 2.1.1

enable_rbenv_for_this_script

rbenv global 2.1.1
