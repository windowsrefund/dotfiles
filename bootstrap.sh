#!/usr/bin/env bash

error() {
  echo $@
  exit 1
}

[ -f /etc/debian_version ] && ./debian.conf

case $OS in
  debian)
    read -p "Install termite? (y/N): "
    [[ "$REPLY" == [Yy] ]]  && ./termite-install.sh

    read -p "Manage packages? (y/N): "
    [[ "$REPLY" == [Yy] ]] && {
        sudo $REMOVE $PACKAGES_REMOVE
        sudo $INSTALL $PACKAGES_INSTALL

    read -p "Install python packages? (y/N): "
    [[ "$REPLY" == [Yy] ]] && ./pip-packages.sh

    ;;
  *)
    error Unsupported OS
    ;;
esac



mkdir ~/bin 2> /dev/null
wget -q -O ~/bin/safe.sh https://raw.githubusercontent.com/windowsrefund/safe/master/safe.sh
