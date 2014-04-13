#!/usr/bin/env bash

set -e

CURRDIR=$(cd "$(dirname $0)" && pwd -P)

source "$CURRDIR/utils.sh"

download_if_missing "http://cdn.mysql.com/Downloads/MySQLGUITools/mysql-workbench-gpl-$MYSQL_WORKBENCH_VERSION-amd64.deb"

# if [[ ! $(command -v mysql-workbench) ]]; then
#   sudo gdebi -n -o APT::Install-Recommends="0" ~/Downloads/mysql-workbench-gpl-$MYSQL_WORKBENCH_VERSION-amd64.deb
# else
#   echo "mysql-workbench is already installed"
# fi

