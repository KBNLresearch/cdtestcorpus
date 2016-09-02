#!/bin/bash

# Create simple data CD with 1 sessions

# Device path of cd writer (modify if needed)
cdDevice="/dev/sr0"

# Installation directory
instDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Data directory
dataDir="$instDir"/data

function changeCD {
                eject $cdDevice
                read -p "Insert a blank CD then press enter... "
           }

changeCD

# Make ISO
mkisofs -V "Simple cd-rom" -J -r -o simple1.iso $dataDir/jpylyzer/

# Burn to disc
wodim -tao dev=$cdDevice simple1.iso

# Cleanup: remove all ISO files
rm *.iso
