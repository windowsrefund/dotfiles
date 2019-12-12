#!/usr/bin/env bash

error() {
  echo $@
  exit 1
}

[ -f /etc/debian_version ] && . debian.conf

case $OS in
  debian)
    read -p "Install termite? (y/N): "
    [[ "$REPLY" == [Yy] ]]  && ./termite-install.sh

    read -p "Manage packages? (y/N): "
    [[ "$REPLY" == [Yy] ]] && {
        sudo $REMOVE $PACKAGES_REMOVE
        sudo $INSTALL $PACKAGES_INSTALL
    }
    read -p "Install python packages? (y/N): "
    [[ "$REPLY" == [Yy] ]] && ./pip-packages.sh

    ;;
  *)
    error Unsupported OS
    ;;
esac

read -p "Configure legacy vim? (y/N): "
[[ "$REPLY" == [Yy] ]] && {
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
/usr/bin/vim.basic +PLuginInstall +qall
}

mkdir ~/bin 2> /dev/null
wget -q -O ~/bin/safe.sh https://raw.githubusercontent.com/windowsrefund/safe/master/safe.sh

sudo systemctl disable lightdm

dotdrop install -p libretop
dotdrop install -p mtf8

cat <<EOF
Things to do manually:

  * Compile and configure latest neovim from source
    * Setup vim-plug 

  * Configure sudoers
EOF
