#!/usr/bin/env bash

SERVICES="libvirtd libvirt-guests virtlogd"
LABS="salt ceph ids"
LAB_SALT="salt1 minion1"
LAB_CEPH="ceph-admin mon1 osd1 osd2 osd3 client"
LAB_IDS="ids1 influx1"

usage() {
cat << EOF
$(basename $0) start|stop|list lab-name
Use list to see a list of supported labs
EOF
}

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
  case $1 in
    salt)
      DOMAINS=$LAB_SALT
      ;;
    ceph)
      DOMAINS=$LAB_CEPH
      ;;
    ids)
      DOMAINS=$LAB_IDS
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
    shell_command: ssh $d.lab
  start_directory: /home/akosmin
  window_name: $d
EOF
done
}


[ $# -ge 1 ] || { usage; exit 1; }

# order will matter depending on operation
case $1 in
  list)
    echo "Supported labs: $LABS"
    exit
    ;;
  start)
    check_supported_lab $2
    manage_service $1
    manage_domains $1 $DOMAINS
    create_tmuxp_profile $2
    tmuxp load lab-$2
    ;;
  stop)
    check_supported_lab $2
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

