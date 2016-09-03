#!/bin/bash

# Create simple data CD with 1 sessions

# Installation directory
instDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Read device name from config file
source $instDir/config.txt

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
