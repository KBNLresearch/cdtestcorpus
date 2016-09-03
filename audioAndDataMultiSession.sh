#!/bin/bash

# Create mixed audio / data CD with 2 sessions
# First session contains the audio tracks, second session contains data track
# Adapted from: http://howto-pages.org/cdwriting/11.php

# Installation directory
instDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Read device name from config file
source $instDir/config.txt

# Data directory
dataDir="$instDir"/data

# Audio directory
audioDir="$instDir"/audio

# Write audio to first session of disc
wodim -multi -v -dao -nofix dev=$cdDevice -audio -pad $audioDir/*.wav

# Info needed for next session
msInfo=$(wodim dev=$cdDevice -msinfo)

# Make ISO for next session
mkisofs -V "Data" -C $msInfo -J -r -o simple1.iso $dataDir/jpylyzer/

# Write data to new session and close the disc
wodim -v -dao dev=$cdDevice simple1.iso

# Cleanup: remove all ISO files
rm *.iso

# Eject disc
eject $cdDevice

