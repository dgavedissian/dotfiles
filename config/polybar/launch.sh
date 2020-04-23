#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

source ~/.dotfiles/polybar-variables.sh

PRIMARY=$(xrandr --query | grep " connected" | grep "primary" | cut -d" " -f1)
OTHERS=$(xrandr --query | grep " connected" | grep -v "primary" | cut -d" " -f1)

# Launch on primary monitor
MONITOR=$PRIMARY POLYBAR_TRAY_POSITION=right polybar --reload top &
MONITOR=$PRIMARY POLYBAR_TRAY_POSITION=right polybar --reload bottom &

# Launch on all other monitors
for m in $OTHERS; do
    MONITOR=$m polybar --reload top &
    MONITOR=$m polybar --reload bottom &
done
