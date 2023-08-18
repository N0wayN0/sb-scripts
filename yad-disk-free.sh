#!/bin/bash

df -T | tail -n +2 | awk '{printf "%s\n%s\n%s\n%s\n%s\n%s\n", $1,$7, $2, $3, $4, $6}' |\
  yad  --image=drive-harddisk --mouse --close-on-unfocus --width=800 --height=350  \
      --no-buttons --text="Disk space usage" --list --no-selection --title="Disk usage" \
      --column="Device" --column="Mountpoint" --column="Type" \
      --column="Total:sz" --column="Free:sz" --column="Usage:bar" 
