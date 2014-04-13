# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# append immediately, not only when closing the terminal
# PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000000
HISTFILESIZE=20000000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# always expand the glob pattern (in ls and cd commands for example)
shopt -s globstar
# enable the inverse detection, for example ls !(b*)
shopt -s extglob

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
  xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
  else
    color_prompt=
  fi
fi

if [ "$color_prompt" = yes ]; then
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
  PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
  ;;
*)
  ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto --group-directories-first'
  alias dir='dir --color=auto'
  alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# some more ls aliases

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# emulate Mac's pbcopy and pbpaste for scripts compatibility
if [[ $(command -v xsel) ]]; then
  alias pbcopy='xsel --clipboard --input'
  alias pbpaste='xsel --clipboard --output'
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

if [ -f ~/.bash_aliases_private ]; then
  . ~/.bash_aliases_private
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
  . /etc/bash_completion
fi

################################################################################
# Bash prompt
#

parse_git_branch () {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

my_custom_prompt () {
  local          RED="\[\033[0;31m\]"
  local    LIGHT_RED="\[\033[1;31m\]"
  local       YELLOW="\[\033[0;33m\]"
  local  LIGHT_GREEN="\[\033[1;32m\]"
  local        WHITE="\[\033[1;37m\]"
  local   LIGHT_GRAY="\[\033[0;37m\]"
  local LIGHT_PURPLE="\[\033[1;34m\]"
  case $TERM in
    xterm*)
      TITLEBAR='\[\033]0;\u@\h:\w\007\]'
      ;;
    *)
      TITLEBAR=""
      ;;
  esac

PS1="${TITLEBAR}\
$LIGHT_GREEN$USER$LIGHT_RED@$LIGHT_GREEN$(hostname)$WHITE:$LIGHT_PURPLE\w$YELLOW\$(parse_git_branch)\
\n\[\e[0m\]\$ "
PS2='> '
PS4='+ '
}

my_custom_prompt

## git columnar log, lessened with colours <http://superuser.com/a/117842>

loglog () {
  git log \
    --pretty=format:"%C(yellow)%h|%C(red)%ad|%C(blue)%an|%C(reset)%s%C(green)%d" --date=local \
    | column -t -s '|' \
    | less -R
}

######################
# Encrypted archives #

enctar () {
  tar c "${1}" | openssl enc -aes-256-cbc -salt > "${1}.tar"

  # read -r -p "Remove original? "
  # The -p option is not available in zsh
  echo "Remove original? "
  read -r
  if [[ $REPLY =~ ^[Yy] ]]; then
    rm -r "${1}"
  fi
}

dectar () {
  cat "${1}" | openssl aes-256-cbc -d -salt | tar -xv

  # read -r -p "Remove archive? "
  # The -p option is not available in zsh
  echo "Remove original? "
  read -r
  if [[ "${REPLY}" =~ ^[Yy] ]]; then
    rm -r "${1}"
  fi
}

# RVM
# # This loads RVM into a shell session.
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
# # Add RVM to PATH for scripting
# PATH=$PATH:$HOME/.rvm/bin

# Tmuxinator
[[ -s "$HOME/.tmuxinator/scripts/tmuxinator" ]] && source "$HOME/.tmuxinator/scripts/tmuxinator"

# RBENV
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export PATH="$HOME/bin/sbt/bin:$PATH" # scala build tools
export PATH="/usr/local/heroku/bin:$PATH" # standard heroku installation
export PATH="$HOME/bin:$PATH" # Local bin directory

# Google App Engine
export APPENGINE_PATH="$HOME/bin/google_appengine"
export PATH="$APPENGINE_PATH:$PATH"

export EDITOR='/usr/bin/vim'

# for tmux: export 256color
if [[ -n "$TMUX" ]]; then
  export TERM=screen-256color
else
  export TERM=xterm-256color
fi

################################################################################
# golang configuration

# Not needed if golang is installed in its standard location /usr/local/go/bin
# export GOROOT="$HOME/bin/go"
# export PATH="$GOROOT/bin:$PATH"

export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:/usr/local/go/bin"

################################################################################
# gsutil (google cloud storage command line)

# TODO: remove if not needed anymore
# export PATH="$HOME/bin/gsutil:$PATH"

################################################################################
# File compression settings
#
# set gzip and bz2 compression level to the max
# the default is 5 or 6
export GZIP=-9
export BZIP2=-9
# set compression level for lzma2
# (lzma2 is the fastest and with highest compression)
# Usage:
# tar -Jcvf file.tar.xz /path/to/directory
export XZ_OPT=-9

# Pass CTRL+S and CTRL+Q through instead of suspending/resuming the terminal output
#
# ...only for vim...
#
# <http://vim.wikia.com/wiki/Map_Ctrl-S_to_save_current_or_new_files>
vim() {
  local STTYOPTS="$(stty --save)"
  # Prevent CTRL-S from suspending the output stream
  stty stop '' -ixoff
  # Prevent CTRL-Q from waking up the output stream
  stty start '' -ixon
  command vim "$@"
  stty "$STTYOPTS"
}
#
# ...always...
#
# # Prevent CTRL-S from suspending the output stream
# stty stop '' -ixoff
# # Prevent CTRL-Q from waking up the output stream
# stty start '' -ixon

# export PYTHONSTARTUP="~/.pythonrc"
export PYTHONSTARTUP="~/.pythonrc:$PYTHONSTARTUP"

# Per directory .ackrc file
# <http://www.rustyrazorblade.com/2012/03/making-better-use-of-your-ackrc-file/>
export ACKRC=".ackrc"

export PSQL_EDITOR="/usr/bin/vim"
test -r ~/algs4/bin/config.sh && source ~/algs4/bin/config.sh

# The next line updates PATH for the Google Cloud SDK.
google_cloud_path_rc="${HOME}/google-cloud-sdk/path.bash.inc"
if [[ -f "${google_cloud_path_rc}" ]]; then
  source "${google_cloud_path_rc}"
fi

# The next line enables bash completion for gcloud.
google_cloud_autocompletion_rc="${HOME}/google-cloud-sdk/completion.bash.inc"
if [[ -f "${google_cloud_autocompletion_rc}" ]]; then
  source "${google_cloud_autocompletion_rc}"
fi
