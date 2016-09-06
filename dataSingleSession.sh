#!/bin/bash

# Create simple data CD with 1 sessions

# Installation directory
instDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Read device name from config file
source $instDir/config.txt

# Data directory
dataDir="$instDir"/data

# Make ISO
mkisofs -V "Simple cd-rom" -J -r -R -o simple1.iso $dataDir/jpylyzer/

# Burn to disc
cdrecord -v dev=$cdDevice -data simple1.iso

# Cleanup: remove all ISO files
rm *.iso

# Eject disc
eject $cdDevice

