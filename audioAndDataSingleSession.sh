#!/bin/bash

# Create mixed audio / data CD with 1 session
# First track contains data; remaining tracks are audio tracks
# Adapted from: http://howto-pages.org/cdwriting/11.php

# Installation directory
instDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Read device name from config file
source $instDir/config.txt

# Data directory
dataDir="$instDir"/data

# Audio directory
audioDir="$instDir"/audio

# Make ISO for data 
mkisofs -V "Data" -J -r -R -o simple1.iso $dataDir/jpylyzer/

# Burn to disc
cdrecord -v -dao -nofix dev=$cdDevice -data simple1.iso -audio -pad $audioDir/*.wav

# Cleanup: remove all ISO files
rm *.iso

# Eject disc
eject $cdDevice

