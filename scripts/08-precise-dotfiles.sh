#!/usr/bin/env bash

set -e

CURRDIR=$(cd "$(dirname $0)" && pwd -P)

source "$CURRDIR/utils.sh"

PRIVATE_DOTFILES=$HOME/Dropbox/dotfiles-private

echo "Set required shell options (shopt) for the current script"
shopt -s globstar # always expand the glob pattern (in ls and cd commands for example)
shopt -s extglob # enable the inverse detection, for example ls !(b*)

#######################
# DOTFILES & SYMLINKS #
#######################

# make_symlink $HOME/Desktop      $HOME/desktop
# make_symlink $HOME/Downloads    $HOME/downloads

rm -rf $HOME/Templates
rm -rf $HOME/Public
rm -rf $HOME/Documents
rm -rf $HOME/Music
rm -rf $HOME/Pictures
rm -rf $HOME/Videos
rm -rf $HOME/Examples

# mkdir -p $HOME/Dropbox
# make_symlink $HOME/Dropbox                    $HOME/dropbox

make_symlink $PRIVATE_DOTFILES/etc/hosts              /etc/hosts
make_symlink $PRIVATE_DOTFILES/etc/rc.local           /etc/rc.local

make_symlink $PRIVATE_DOTFILES/bash_aliases_private $HOME/.bash_aliases_private
make_symlink $PRIVATE_DOTFILES/bash_history         $HOME/.bash_history
make_symlink $PRIVATE_DOTFILES/emacs                $HOME/.emacs
make_symlink $PRIVATE_DOTFILES/hgrc                 $HOME/.hgrc
make_symlink $PRIVATE_DOTFILES/mysql_history        $HOME/.mysql_history
make_symlink $PRIVATE_DOTFILES/pry_history          $HOME/.pry_history
make_symlink $PRIVATE_DOTFILES/psql_history         $HOME/.psql_history

make_symlink $PRIVATE_DOTFILES/config/autostart        $HOME/.config/autostart
make_symlink $PRIVATE_DOTFILES/config/user-dirs.dirs   $HOME/.config/user-dirs.dirs
# make_symlink $PRIVATE_DOTFILES/config/cairo-dock       $HOME/.config/cairo-dock
# make_symlink $PRIVATE_DOTFILES/config/libreoffice/4    $HOME/.config/libreoffice/4

# handbrake
make_symlink $PRIVATE_DOTFILES/config/ghb/preferences  $HOME/.config/ghb/preferences
make_symlink $PRIVATE_DOTFILES/config/ghb/presets      $HOME/.config/ghb/presets

# Link to the fonts and rebuild the font cache.
make_symlink $PRIVATE_DOTFILES/fonts                 $HOME/.fonts
sudo fc-cache -f -v

# Custom Firefox dictionary and settings
firefox_default_profile=$(ls "$HOME/.mozilla/firefox/" | grep -e ".*\.\?default" | head -n 1)
make_symlink $PRIVATE_DOTFILES/firefox-dict.dat $HOME/.mozilla/firefox/$firefox_default_profile/persdict.dat
# Linking the prefs for some reason tricks firefox into behaving as if it is the first run every time
# make_symlink $PRIVATE_DOTFILES/firefox-prefs.js $HOME/.mozilla/firefox/$firefox_default_profile/prefs.js

if [[ -d "$HOME/.mozilla/firefox-trunk/" ]]; then
  nightly_default_profile=$(ls "$HOME/.mozilla/firefox-trunk/" | grep -e ".*\.\?default" | head -n 1)
  make_symlink $PRIVATE_DOTFILES/firefox-dict.dat $HOME/.mozilla/firefox-trunk/$nightly_default_profile/persdict.dat
  # Linking the prefs for some reason tricks firefox into behaving as if it is the first run every time
  # make_symlink $PRIVATE_DOTFILES/firefox-trunk-prefs.js $HOME/.mozilla/firefox-trunk/$firefox_default_profile/prefs.js
fi

# Mime types (WARNING: ubuntu tweak will remove the symlink with a real file on every change)
mkdir -p "$HOME/.local/share/applications/"
echo "Ensure dir $HOME/.local/share/applications/"
make_symlink \
  "$PRIVATE_DOTFILES/.local/share/applications/mimeapps.list" \
  "$HOME/.local/share/applications/mimeapps.list"

sudo mkdir -p /opt/nginx/conf
echo "Ensure dir /opt/nginx/conf"
make_symlink "$PRIVATE_DOTFILES/opt/nginx/conf/nginx.conf"  /opt/nginx/conf/nginx.conf
sudo mkdir -p /etc/nginx/conf
echo "Ensure dir /etc/nginx/conf"
make_symlink "$PRIVATE_DOTFILES/opt/nginx/conf/nginx.conf"  /etc/nginx/nginx.conf

make_symlink $PRIVATE_DOTFILES/netrc $HOME/.netrc
echo "Ensure correct permissions for netrc"
chmod 0400 $HOME/.netrc

# Auto login
append_if_missing "autologin-user=$USER" /etc/lightdm/lightdm.conf
append_if_missing "autologin-user-timeout=0" /etc/lightdm/lightdm.conf
