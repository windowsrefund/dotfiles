#!/usr/bin/env bash

error() {
  echo $@
  exit 1
}

[ -f /etc/debian_version ] && OS=debian

case $OS in
  debian)
    read -p "Install termite? (y/N): "
    [[ "$REPLY" == [Yy] ]] && ./termite-install.sh
    . packages.debian
    INSTALL="apt install"
    REMOVE="apt -f remove"
    ;;
  *)
    error Unsupported OS
    ;;
esac

sudo $REMOVE $PACKAGES_REMOVE
sudo $INSTALL $PACKAGES_INSTALL

read -p "Install dotdrop? (y/N): "
[[ "$REPLY" == [Yy] ]] && pip3 install --user dotdrop

mkdir ~/bin 2> /dev/null
