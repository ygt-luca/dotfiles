#!/usr/bin/env bash

set -e

CURRDIR=$(cd "$(dirname $0)" && pwd -P)

source "$CURRDIR/utils.sh"
source "$CURRDIR/config.sh"

if [[ -z $PRIVATE_DOTFILES || ! -e $PRIVATE_DOTFILES ]]; then
  echo "The \$PRIVATE_DOTFILES path is not defined. Aborting."
  exit 1
fi

echo "Set required shell options (shopt) for the current script"
shopt -s globstar # always expand the glob pattern (in ls and cd commands for example)
shopt -s extglob # enable the inverse detection, for example ls !(b*)

# # License
# mkdir -p "$HOME/.config/sublime-text-2/Settings"
# make_symlink  "$PRIVATE_DOTFILES/.config/sublime-text-2/Settings/License.sublime_license" \
#               "$HOME/.config/sublime-text-2/Settings/License.sublime_license"

# # User settings
# mkdir -p "$HOME/.config/sublime-text-2/Packages"
# make_symlink  "$PRIVATE_DOTFILES/.config/sublime-text-2/Packages/User" \
#               "$HOME/.config/sublime-text-2/Packages/User"

# add_ppa_if_missing "ppa:webupd8team/sublime-text-2"

# sudo apt-get -y install sublime-text-dev
