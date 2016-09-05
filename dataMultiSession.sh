#!/bin/bash

# Create data CD with 2 sessions

# Installation directory
instDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Read device name from config file
source $instDir/config.txt

# Data directory
dataDir="$instDir"/data

# Make ISO
mkisofs -V "Simple" -J -r -o simple1.iso $dataDir/jpylyzer/

# Write existing ISO to first session
wodim -v -multi -dev=$cdDevice -data simple1.iso

# Info needed for next session
msInfo=$(wodim dev=$cdDevice -msinfo)

# Make ISO for next session
mkisofs -V "Simple2" -C $msInfo -J -r -o simple2.iso $dataDir/jp2k-test/

# Burn image to session 2 and close disc
wodim -v -dev=$cdDevice -data simple2.iso

# Cleanup: remove all ISO files
rm *.iso

# Eject disc
eject $cdDevice

