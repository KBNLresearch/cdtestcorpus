#!/bin/bash

# Create simple audio CD with 1 session

# Device path of cd writer (modify if needed)
cdDevice="/dev/sr0"

# Installation directory
instDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Audio directory
audioDir="$instDir"/audio

function changeCD {
                eject $cdDevice
                read -p "Insert a blank CD then press enter... "
           }

changeCD

# Burn to disc
wodim -v -dao -nofix dev=$cdDevice -audio -pad $audioDir/*.wav

