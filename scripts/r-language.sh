#!/usr/bin/env bash

set -e

CURRDIR=$(cd "$(dirname $0)" && pwd -P)

source "$CURRDIR/utils.sh"

UBUNTU_VERSION="$(get_ubuntu_version)"

if [[ -f "/etc/apt/sources.list.d/r-cran-${UBUNTU_VERSION}.list"  ]]; then
  echo "CRAN repository already registered, skipping"
else
  sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
  sudo sh -c "echo \"deb http://cran.ma.imperial.ac.uk/bin/linux/ubuntu $UBUNTU_VERSION/\" > /etc/apt/sources.list.d/r-cran-$UBUNTU_VERSION.list"
fi

echo "Updating apt index..."
sudo apt-get update -qq
sudo apt-get install -y r-base r-recommended gdebi

# RStudio
# extract url of the last version from the webpage
# - grep for the first occurrence of the download link for 64bit version, match only
# - remove what's before the url
# - remove what's after the url
deb_url=$(curl -s http://www.rstudio.com/ide/download/desktop | grep -oi -m 1 -E '<a.+?href=.+?amd64\.deb.+?a>' | sed 's|<a .*href="||g' | sed 's|".*$||g')

# Get filename (for example: rstudio-0.97.551-amd64.deb)
deb_filename=$(echo $deb_url | sed 's|^.*\/||g')

if [[ -f ~/Downloads/$deb_filename ]]; then
  echo "Latest version of RStudio already downloaded, skipping"
else
  mkdir -p ~/Downloads
  wget "$deb_url" -P ~/Downloads/
fi

rstudio_downloaded_version=$(echo $deb_filename | grep -o -E '([[:digit:]]+\.)+[[:digit:]]+' | head)
rstudio_installed_version=$(get_package_version rstudio)

if [[ $rstudio_downloaded_version > $rstudio_installed_version ]]; then
  sudo gdebi -n ~/Downloads/$deb_filename
else
  echo "Latest version of RStudio already installed, skipping"
fi
