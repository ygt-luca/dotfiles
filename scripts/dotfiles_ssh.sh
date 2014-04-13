#!/usr/bin/env bash

set -e

echo
echo "Have you created the ~/.ssh with your private keys?"
echo

read -p "If not, you might want to do that first. Continue? "

if [[ ! "${REPLY}" =~ ^[Yy] ]]; then
  echo "Abort."
  exit 1
fi

CURRDIR=$(cd "$(dirname $0)" && pwd -P)

source "$CURRDIR/utils.sh"
source "$CURRDIR/config.sh"

if [[ -z $PRIVATE_DOTFILES || ! -e $PRIVATE_DOTFILES ]]; then
  echo "The \$PRIVATE_DOTFILES path is not defined. Aborting."
  exit 1
fi

# Ensure that the settings for safe SSH are in place (no password auth...)
# make_symlink $HOME/Dropbox/private/ssh $HOME/.ssh
echo "Ensure correct permissions for ssh config"
chmod 0700 $HOME/.ssh
chmod 0400 $HOME/.ssh/id_rsa*
chmod 0600 $HOME/.ssh/authorized_keys
chmod 0600 $HOME/.ssh/config

# Add all the private keys (files with at most one dot in the name)
ls $HOME/.ssh/ | perl -nle 'print if /\Aid_rsa\.?[^\.]*\Z/' | while read private_key; do
  ssh-add $HOME/.ssh/$private_key
done

# Global config
make_symlink $PRIVATE_DOTFILES/etc/ssh/sshd_config /etc/ssh/sshd_config
sudo service ssh restart
