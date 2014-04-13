#!/usr/bin/env bash

set -e

postgres_version="9.3"

declare -a supported_ubuntu_versions=('precise' 'lucid')
ubuntu_version_is_supported=false
ubuntu_version=$(lsb_release --codename | awk '{print $2}')

for VERSION in ${supported_ubuntu_versions[@]}; do
  if [[ "$ubuntu_version" == "$VERSION" ]]; then
    ubuntu_version_is_supported=true
  fi
done

if ! $ubuntu_version_is_supported; then
  echo "Version '$ubuntu_version' is not supported by Postgres official repository."
  exit 1
fi

sudo bash -c "echo 'deb http://apt.postgresql.org/pub/repos/apt/ ${ubuntu_version}-pgdg main' > /etc/apt/sources.list.d/pgdg.list"
echo "Added official Postgres apt repository for relase '${ubuntu_version}' at /etc/apt/sources.list.d/pgdg.list"

wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
echo "Added apt-key for Postgres repository."

echo "updating apt index..."
sudo apt-get update -qq
echo "OK"

# Uncomment this if you want to upgrade all the ubuntu packages
echo "upgrading the packages..."
sudo apt-get dist-upgrade -qq -y
echo "OK"

# contrib packages are for extensions like HSTORE and JSON
echo "installing postgres and libraries..."
sudo apt-get install -qq -y \
  autoconf \
  automake \
  g++ \
  gcc \
  git-core \
  libc6-dev \
  libffi-dev \
  libpq-dev \
  libreadline6 \
  libreadline6-dev \
  libssl-dev \
  make \
  pgadmin3 \
  "postgresql-${postgres_version}" \
  "postgresql-client-${postgres_version}" \
  "postgresql-contrib-${postgres_version}" \
  zlib1g \
  zlib1g-dev \

echo "OK"

sudo -u postgres psql -c "ALTER USER postgres PASSWORD 'postgres';"
echo "Set password 'postgres' for DB USER 'postgres'"

echo "It's now possible to connect to the local database with either of the two following options:"
echo "    $ sudo -i -u postgres psql        # => peer authentication, no password required"
echo "    $ psql -U postgres -h localhost   # => password authentication with password 'postgres'"
