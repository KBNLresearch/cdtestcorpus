#!/bin/bash

# Create mixed audio / data CD with 1 session
# First track contains data; remaining tracks are audio tracks
# Adapted from: http://howto-pages.org/cdwriting/11.php

# Device path of cd writer (modify if needed)
cdDevice="/dev/sr0"

# Installation directory
instDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Data directory
dataDir="$instDir"/data

# Audio directory
audioDir="$instDir"/audio

function changeCD {
                eject $cdDevice
                read -p "Insert a blank CD then press enter... "
           }

changeCD

# Make ISO for data 
mkisofs -V "Data" -J -r -o simple1.iso $dataDir/jpylyzer/

# Burn to disc
wodim -v -dao -nofix dev=$cdDevice -data simple1.iso -audio -pad $audioDir/*.wav

# Cleanup: remove all ISO files
rm *.iso

