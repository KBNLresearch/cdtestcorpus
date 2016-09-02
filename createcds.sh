#!/bin/bash

# Create test CDs from data files in this repo
# See also: http://howto-pages.org/cdwriting/08.php
# Dependencies: mkisofs, wodim.

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

## Simple data CD-ROM 

# Make ISO
mkisofs -V "Simple cd-rom" -J -r -o simple1.iso $dataDir/jpylyzer/

# Burn to disc
wodim -tao dev=$cdDevice simple1.iso

changeCD

## Multisession data CD-ROM

# Write existing ISO to first session
wodim -multi -tao dev=$cdDevice simple1.iso

# Info needed for next session
msInfo=$(wodim dev=$cdDevice -msinfo)

# Make ISO for next session
mkisofs -V "Simple cd-rom 2" -C $msInfo -J -r -o simple2.iso $dataDir/jp2k-test/

# Burn image to session 2 and close disc
wodim -tao dev=$cdDevice simple1.iso

## Cleanup: remove all ISO files
rm *.iso
