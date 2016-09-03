#!/bin/bash

# Create simple audio CD with 1 session

# Installation directory
instDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Read device name from config file
source $instDir/config.txt

# Audio directory
audioDir="$instDir"/audio

# Burn to disc
wodim -v -dao -nofix dev=$cdDevice -audio -pad $audioDir/*.wav

# Eject disc
eject $cdDevice

