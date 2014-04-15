#!/usr/bin/env bash

CURRDIR=$(cd "$(dirname $0)" && pwd -P)

source "$CURRDIR/utils.sh"
source "$CURRDIR/config.sh"

if [[ -z $PUBLIC_DOTFILES || ! -e $PUBLIC_DOTFILES ]]; then
  echo "The \$PUBLIC_DOTFILES path is not defined. Aborting."
  exit 1
fi

make_symlink $PUBLIC_DOTFILES/bashrc                $HOME/.bashrc
make_symlink $PUBLIC_DOTFILES/bundle                $HOME/.bundle
make_symlink $PUBLIC_DOTFILES/gemrc                 $HOME/.gemrc
make_symlink $PUBLIC_DOTFILES/ackrc                 $HOME/.ackrc
make_symlink $PUBLIC_DOTFILES/htoprc                $HOME/.htoprc
make_symlink $PUBLIC_DOTFILES/config/htop/htoprc    $HOME/.config/htop/htoprc
make_symlink $PUBLIC_DOTFILES/irbrc                 $HOME/.irbrc
make_symlink $PUBLIC_DOTFILES/jrubyrc               $HOME/.jrubyrc
make_symlink $PUBLIC_DOTFILES/pythonrc              $HOME/.pythonrc
make_symlink $PUBLIC_DOTFILES/pryrc                 $HOME/.pryrc
make_symlink $PUBLIC_DOTFILES/rvmrc                 $HOME/.rvmrc
make_symlink $PUBLIC_DOTFILES/diakonos              $HOME/.diakonos
make_symlink $PUBLIC_DOTFILES/gitignore_global      $HOME/.gitignore_global
make_symlink $PUBLIC_DOTFILES/gitconfig             $HOME/.gitconfig
make_symlink $PUBLIC_DOTFILES/vnc/default.tigervnc  $HOME/.vnc/default.tigervnc
make_symlink $PUBLIC_DOTFILES/vnc/xstartup          $HOME/.vnc/xstartup
make_symlink $PUBLIC_DOTFILES/bash_aliases          $HOME/.bash_aliases
make_symlink $PUBLIC_DOTFILES/vimrc.after           $HOME/.vimrc.after
