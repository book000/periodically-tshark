#!/bin/bash
cd "$(dirname "$0")" || exit

# INTERFACE=XXX
# SAVEDIR=/path/to/dir
# FILENAME=$(date '+%Y-%m-%d_%H-%M').cap

# shellcheck source=/dev/null
source .env

mkdir -p "$SAVEDIR"

find "$SAVEDIR" -type f -name "*.cap" -mtime +30 -exec rm -f {} \;
tshark -i "$INTERFACE" -a duration:3600 -w "$SAVEDIR/$FILENAME"