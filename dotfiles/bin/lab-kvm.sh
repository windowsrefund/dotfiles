#!/usr/bin/env bash


usage() {
cat << EOF
$(basename $0) up|down
EOF
}

[ $# -eq 1 ] || { usage; exit 1; }

case $1 in
  up)
    sudo systemctl start libvirtd
    sudo systemctl start libvirt-guests
    # tmuxp load lab-salt
    ;;
  down)
    sudo systemctl stop libvirtd
    sudo systemctl stop libvirt-guests
    ;;
  *)
    usage
    exit 1
    ;;
esac
