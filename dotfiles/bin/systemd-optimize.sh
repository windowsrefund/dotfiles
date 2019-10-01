#!/usr/bin/env bash
user[0]=gvfs-afc-volume-monitor
user[1]=gvfs-daemon
user[2]=gvfs-goa-volume-monitor
user[3]=gvfs-gphoto2-volume-monitor
user[4]=gvfs-metadata
user[5]=gvfs-mtp-volume-monitor
user[6]=gvfs-udisks2-volume-monitor

system[0]=accounts-daemon
system[1]=apport
system[2]=atd
system[3]=avahi-daemon-service
system[4]=bgpd
system[5]=brltty
system[6]=debug-shell
system[7]=isisd
system[8]=ModemManager
system[9]=opssd
system[10]=pppd-dns
system[11]=rsync
system[12]=whoopsie

usage() {
  echo "Usage: $0 user|system start|stop|status"
}

set_service() {
  case $2 in
    status)
      $1
      ;;
    start)
      echo Starting for $3
      for i in $3
      do
        $1 unmask $i
        $1 start $i
      done
      ;;
    stop)
      for i in $3
      do
        $1 stop $i
        $1 mask $i
      done
      ;;
  esac
}

[[ $# -eq 2 ]] || { usage; exit 1; }

case $1 in
  user)
    SYSTEMCTL="systemctl --user"
    SERVICES="${user[@]}"
    ;;
  system)
    SYSTEMCTL="sudo systemctl"
    SERVICES="${system[@]}"
    ;;
  *)
    usage
    exit 1
    ;;
esac

set_service "$SYSTEMCTL" $2 "$SERVICES"
