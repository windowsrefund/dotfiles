#!/bin/bash

usage() {
cat << EOF
$(basename $0) up|down
EOF
}

[ $# -eq 1 ] || { usage; exit 1; }

case $1 in
  up)
    VBoxManage startvm --type headless k8smaster k8snode1 k8snode2
    sleep 5
    tmuxp load k8slab
    ;;
  down)
    for i in master node1 node2; do
      VBoxManage controlvm k8s$i poweroff
    done
    ;;
  *)
    usage
    exit 1
    ;;
esac
