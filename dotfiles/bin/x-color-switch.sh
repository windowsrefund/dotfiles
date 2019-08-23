#!/usr/bin/env bash
# x-color-switch.sh - change Xresources colors and restart i3
#
error() {
  echo $@
  exit 1
}

usage() {
  echo Usage: $(basename $0) [-l] [-t theme]
}

[ $# -ge 1 ] || { usage; exit 1; }

TEMPLATE_DIR=~/.Xresources.d/colors.d
SCRIPT_DIR=~/.config/i3
while getopts "lt:" opt; do
  case $opt in
    l)
      for i in ${TEMPLATE_DIR}/*.termite; do
        echo $(basename $i .termite)
      done
      exit
      ;;
    t)
      THEME=$OPTARG
      [ -f $TEMPLATE_DIR/$THEME ] || error Missing theme: $THEME
      ln -sf $TEMPLATE_DIR/$THEME $TEMPLATE_DIR/../colors
      xrdb -merge ~/.Xresources
      notify-send i3 "Restarting with $TEMPLATE"
      $SCRIPT_DIR/i3_config reload
      $SCRIPT_DIR/termite_config
      ;;
    *)
      exit
      ;;
  esac
done

