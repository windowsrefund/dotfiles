#!/usr/bin/env bash

SERVICES="libvirtd libvirt-guests virtlogd"

usage() {
cat << EOF
$(basename $0) start|stop
EOF
}

[ $# -eq 1 ] || { usage; exit 1; }

case $1 in
  up|start)
    for i in $SERVICES; do sudo service $i start; done
    ;;
  down|stop)
    for i in $SERVICES; do sudo service $i stop; done
    # dnsmasq may still be running
    sudo killall -u libvirt-dnsmasq
    ;;
  *)
    usage
    exit 1
    ;;
esac
