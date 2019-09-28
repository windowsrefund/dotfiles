#!/usr/bin/env bash

error() {
  echo $@
  exit 1
}

go() {
	read -p "Install termite? (y/N): "
	[[ "$REPLY" == [Yy] ]] && ./termite-install.sh
	read -p "Manage packages? (y/N): "
	[[ "$REPLY" == [Yy] ]] && {
		sudo $REMOVE $PACKAGES_REMOVE
		sudo $INSTALL $PACKAGES_INSTALL
	}
  read -p "Install python packages? (y/N): "
	[[ "$REPLY" == [Yy] ]] && {
    pip3 install --user \
    dotdrop \
    python-language-server[all]
  }
}

[ -f /etc/debian_version ] && {
	OS=debian
	INSTALL="apt install"
	REMOVE="apt -f remove"
	. packages.debian
}

case $OS in
  debian)
    go
    ;;
  *)
    error Unsupported OS
    ;;
esac

mkdir ~/bin 2> /dev/null
