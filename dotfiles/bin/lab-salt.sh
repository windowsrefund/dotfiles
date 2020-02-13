#!/bin/bash

usage() {
cat << EOF
$(basename $0) up|down
EOF
}

[ $# -eq 1 ] || { usage; exit 1; }

case $1 in
  up)
    VBoxManage startvm --type headless salt-master1 salt-minion1 salt-minion2
    sleep 5
    tmuxp load lab-salt
    ;;
  down)
    for i in master1 minion1 minion2; do
      VBoxManage controlvm salt-$i poweroff
    done
    ;;
  *)
    usage
    exit 1
    ;;
esac
