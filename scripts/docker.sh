#!/usr/bin/env bash

curl -s https://get.docker.io/ubuntu/ | sudo sh

# Give non-root access
# --------------------
#
# (http://docs.docker.io/en/latest/installation/ubuntulinux/#giving-non-root-access)

# Add the docker group if it doesn't already exist.
sudo groupadd docker

# Add the connected user "${USER}" to the docker group.
# Change the user name to match your preferred user.
# You may have to logout and log back in again for this to take effect.
sudo gpasswd -a ${USER} docker

# Restart the Docker daemon.
sudo service docker restart
