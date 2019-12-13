#!/bin/sh
EXT=HDMI1
EXT_RES=1920x1080
INT=eDP1
INT_RES=1920x1080
BRIGHTNESS=600

case $1 in
  2)
    xrandr --output $INT --mode $INT_RES --output $EXT --auto --right-of $INT
    ;;
  1)
    xrandr --output $INT --off --output $EXT --auto --primary --scale 1.0x1.0
    # xrandr --output $INT --off --output $EXT --auto --primary --scale .9x.9
    ;;
  *)
    # xrandr --output $EXT --off --output $INT --mode $INT_RES
    xrandr --output $EXT --off --output $INT --mode $INT_RES --scale .80x.80
    ;;
esac

# echo $BRIGHTNESS | \
  # sudo tee /sys/class/backlight/intel_backlight/brightness > /dev/null
