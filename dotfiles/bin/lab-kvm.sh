#!/usr/bin/env bash

SERVICES="libvirtd libvirt-guests virtlogd"
LAB_SALT="salt1 minion1"
LAB_CEPH="ceph-admin mon1 osd1 osd2 osd3 client"

usage() {
cat << EOF
$(basename $0) start|stop salt
EOF
}

[ $# -eq 2 ] || { usage; exit 1; }

# support additional labs in the future
manage_domains() {
  for d in $DOMAINS; do
    virsh $1 $d
  done
}

manage_service() {
  for i in $SERVICES; do sudo service $i $1; done
}

check_supported_lab() {
  case $2 in
    salt)
      DOMAINS=$LAB_SALT
      ;;
    ceph)
      DOMAINS=$LAB_CEPH
      ;;
    *)
      usage
      exit 1
      ;;
  esac
}

create_tmuxp_profile() {
# dynamically create a tmuxp profile
# first time only
TMUX_PROFILE=~/.tmuxp/lab-$1.yaml
[ -f $TMUX_PROFILE ] && return

cat << EOF > $TMUX_PROFILE
session_name: lab-$1
windows:
- focus: 'true'
  options: {}
  panes:
  - pane
  start_directory: /home/akosmin/projects/lab-$1
  window_name: nvim
EOF

for d in $DOMAINS; do
cat << EOF >> $TMUX_PROFILE
- options:
    automatic-rename: 'off'
  panes:
  - focus: 'true'
    shell_command: ssh $d
  start_directory: /home/akosmin
  window_name: $d
EOF
done
}

# order will matter depending on operation
case $1 in
  start)
    manage_service $1
    manage_domains $1 $DOMAINS
    create_tmuxp_profile $2
    tmuxp load lab-$2
    ;;
  stop)
    manage_domains shutdown $DOMAINS
    manage_service $1

    # dnsmasq may still be running
    sudo killall -u libvirt-dnsmasq
    ;;
  *)
    usage
    exit 1
    ;;
esac

