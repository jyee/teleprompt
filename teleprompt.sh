#!/bin/bash

# List the available devices.
# We use the AVFoundation input device because that's the Apple recommended framework.
# See https://ffmpeg.org/ffmpeg-devices.html#avfoundation
# You can try changing this for other platforms, but it's untested.
input="avfoundation"

# Get all available devices.
raw_devices=$(ffmpeg -f "$input" -list_devices true -nostdin -i "" -hide_banner 2>&1)

# Print video devices available to mirror.
device_range=-2
while IFS= read -r device; do
  # Use regex to remove the additional AVFoundation info.
  device=$(sed "s/^\[[^]]*\] //g" <<< "$device")

  # Stop if list gets to audio devices.
  if [ "$device" = "AVFoundation audio devices:" ]; then
    break
  fi

  echo "$device"
  ((device_range++))
done <<< "$raw_devices"


# Device list is too short to have options, so we exit.
if [ $device_range -lt 0 ]; then
  echo "No valid devices found."
  exit

# Device list only has one option, so we use it.
elif [ $device_range -eq 0 ]; then
  device=0

# Mulitple options exist, so ask the user which device to use.
else
  # Read the device to mirror (yes, we're reusing the variable).
  read -r -p "Enter the number for the device to mirror [0 - $device_range]: " device
fi

# Run ffplay to mirror the selected video device.
# We're suppressing all output because ffplay still throws weird warnings that
# are note suppressed by loglevel.
echo "Close the mirrored window or hit ctrl+c to exit."
ffplay -f avfoundation -i "$device:none" -vf hflip -hide_banner -loglevel quiet -nostats &> /dev/null
