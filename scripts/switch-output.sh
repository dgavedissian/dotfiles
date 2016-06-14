#!/bin/bash
CURRENT_SINK=$(pacmd stat | grep "Default sink name" | awk '{ print $4 }')

# Switch sink
if [[ $CURRENT_SINK == "alsa_output.pci-0000_00_1b.0.analog-stereo" ]]; then
    NEW_SINK="alsa_output.usb-Corsair_Vengeance_2000-00.iec958-stereo"
else
    NEW_SINK="alsa_output.pci-0000_00_1b.0.analog-stereo"
fi

pacmd set-default-sink $NEW_SINK
PROGRAMS=$(pacmd list-sink-inputs | grep index: | awk '{ print $2 }')
for p in $PROGRAMS; do
    pacmd move-sink-input $p $NEW_SINK
done
