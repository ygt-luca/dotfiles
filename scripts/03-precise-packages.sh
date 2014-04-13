#!/usr/bin/env bash

set -e

CURRDIR=$(cd "$(dirname $0)" && pwd -P)

source "$CURRDIR/utils.sh"

#############################
# RUBY COMPILE DEPENDENCIES #
#############################

# Set a password for mysql-server
# This should work but actually doesn't: it doesn't prompt for the password
# but then it's impossible to login.
# mysql_pass=root
# export DEBIAN_FRONTEND=noninteractive
# sudo debconf-set-selections <<< "mysql-server-5.5 mysql-server/root_password password '$mysql_pass'"
# sudo debconf-set-selections <<< "mysql-server-5.5 mysql-server/root_password_again password '$mysql_pass'"

# Essential compile dependencies:
# See also:
# - "rvm requirements" https://github.com/wayneeseguin/rvm/tree/master/scripts/functions/requirements
# - https://www.digitalocean.com/community/articles/how-to-install-ruby-on-rails-on-ubuntu-12-04-from-source
# NOTE: gawk is already provided by the default "mawk" package

sudo apt-get -y install \
  autoconf \
  automake \
  bash \
  bison \
  bzip2 \
  ca-certificates \
  curl \
  g++ \
  mawk \
  gcc \
  libc6-dev \
  libffi-dev \
  libgdbm-dev \
  libncurses5-dev \
  libreadline6 \
  libreadline6-dev \
  libsqlite3-dev \
  libssl-dev \
  libtool \
  libyaml-dev \
  make \
  openssl \
  patch \
  pkg-config \
  sqlite3 \
  zlib1g \
  zlib1g-dev \

# Other ruby compile dependencies that proved to be required at some point:
sudo apt-get -y install \
  git \
  libxml2-dev \
  libxslt-dev \
  build-essential \
  ncurses-dev \

  # ncurses \
  # nodejs \
  # subversion \
  # libxslt1-dev \

# Compile dependencies for common gems:
# sudo apt-get  -y install \
#   imagemagick \
#   libcurl4-openssl-dev \
#   libgsl0-dev \
#   libmagic-dev \
#   libmagickwand-dev \
#   libmysqlclient-dev \
#   libpq-dev \
#   libqt4-dev \
#   libqtwebkit-dev \
#   libreadline-dev \
#   libsasl2-dev \
#   libsqlite3-0 \
#   libxslt-dev \
#   ncurses-dev \
#   ncurses-term \
#   python-software-properties \
#   subversion \
#   checkinstall \

###############################
# PPAs - PACKAGE REPOSITORIES #
###############################

add_ppa_if_missing "ppa:chris-lea/node.js"
add_ppa_if_missing "ppa:stebbins/handbrake-releases"
add_ppa_if_missing "ppa:videolan/stable-daily"
add_ppa_if_missing "ppa:langdalepl/gvfs-mtp" # backport to 12.04 of USB support for Android 4.0+
add_ppa_if_missing "ppa:git-core/ppa"

# add_ppa_if_missing "ppa:ubuntu-mozilla-daily/ppa" # firefox-trunk
# add_ppa_if_missing "ppa:cairo-dock-team/ppa"
# add_ppa_if_missing "ppa:tiheum/equinox" # faenza icons
# add_ppa_if_missing "ppa:webupd8team/themes"
# add_ppa_if_missing "ppa:tualatrix/ppa" # ubuntu-tweak
# add_ppa_if_missing "ppa:cassou/emacs" # emacs24
# add_ppa_if_missing "ppa:ubuntu-on-rails/ppa" # gedit extensions
# add_ppa_if_missing "ppa:xubuntu-dev/xfce-4.10"
# add_ppa_if_missing "ppa:git-core/ppa"
# add_ppa_if_missing "ppa:diesch/testing" # classicmenu-indicator
# add_ppa_if_missing "ppa:stebbins/handbrake-snapshots"
# add_ppa_if_missing "ppa:mitya57" # retext

# This should not be necessary anymore, it was used after a failed run.
# sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3E5C1192

# upgrade the MTP packages from the new PPA (USB storage for Android).
sudo apt-get update
sudo apt-get -y upgrade

########################
# INSTALL APPLICATIONS #
########################

sudo apt-get -y install \
  aspell-it \
  cabextract \
  chmsee \
  cpufrequtils \
  ctags \
  flashplugin-installer \
  gconf-editor \
  gdebi-core \
  gedit-plugins \
  giggle \
  git-core \
  git-gui \
  gitg \
  gparted \
  grsync \
  gthumb \
  htop \
  fonts-inconsolata \
  language-pack-it \
  meld \
  myspell-it \
  nautilus-actions \
  nautilus-open-terminal \
  nodejs \
  openjdk-6-jre \
  openssh-server \
  p7zip-full \
  pastebinit \
  pidgin \
  pep8 \
  python-dev \
  python-pip \
  python-gpgme \
  sshfs \
  synaptic \
  trash-cli \
  tree \
  unrar \
  vlc \
  witalian \
  xclip \
  xsel \
  xournal \
  xvfb \
  zsync \
  nfs-common \
  linux-headers-generic \
  handbrake-gtk \
  nfs-kernel-server \
  sysstat \
  iotop \
  yapet \
  yajl-tools \
  openjdk-6-jdk \
  maven2 \
  vpnc \
  rdesktop \
  ssh \
  pv \
  libdvdread4 \
  gcp \
  mercurial \
  perl-doc \
  dia-gnome \
  asunder \
  lame \
  realpath \
  nload \
  smbfs \

  # Moka GTK theme http://gnome-look.org/content/show.php?content=160565
  # glances \ it can also be install as python library with pip
  # gcolor2 \
  # redis-server \
  # vim-gnome \
  # faience-icon-theme \
  # faience-theme \
  # graphviz \
  # mysql-server \
  # tmux \
  # terminator \
  # pdftk \
  # gnome-tweak-tool \
  # chromium-browser \
  # chromium-codecs-ffmpeg-extra \
  # firefox-trunk \
  # firefox-trunk-globalmenu \
  # firefox-trunk-gnome-support \
  # cairo-dock-plug-ins \
  # cairo-dock \
  # faenza-blue-dark \
  # bluebird-gtk-theme \
  # mediterraneannight-gtk-theme \
  # faenza-icon-theme \
  # ubuntu-tweak \

sudo update-rc.d -f redis-server remove
sudo update-rc.d -f mysql remove

# Install libraries for DVD playback.
sudo /usr/share/doc/libdvdread4/install-css.sh

# Remove out of date cached packages
sudo apt-get autoclean

# Global menu for xfce (it's not very pretty, and it doesn't always work):
#   firefox-globalmenu \
#   appmenu-qt \
#   appmenu-gtk3 \
#   appmenu-gtk \
#   indicator-appmenu-gtk2 \
#   indicator-appmenu \
#   libgranite0 \

# libqt4-dev libqtwebkit-dev are for capybara-webkit
# dkms \ needed only in virtual machines for Guest Additions
# libruby is not needed anymore to compile 1.9.3, possibly still needed to compile as debian package
# emacs24-common-non-dfsg contains the emacs24 manual
#  emacs24-common-non-dfsg \
#  emacs24-nox \
# gedit-gmate \
# retext \
# nginx \
# konsole \
# xfce4-terminal \
# memcached \
# lynx \
# ack-grep \
