#!/usr/bin/env bash

SERVICES="libvirtd libvirt-guests virtlogd"
LAB_SALT="salt1 minion1"

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
    *)
      usage
      exit 1
      ;;
  esac

  TMUX_PROFILE=~/.tmuxp/lab-$2.yaml
}

# order will matter depending on operation
case $1 in
  start)
    manage_service $1
    manage_domains $1 $DOMAINS
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

# dynamically create a tmuxp profile
# first time only
[ -f $TMUX_PROFILE ] && exit

cat << EOF > $TMUX_PROFILE
session_name: lab-$2
windows:
- focus: 'true'
  options: {}

  panes:
  - pane
  start_directory: /home/akosmin/projects/lab-$2
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
