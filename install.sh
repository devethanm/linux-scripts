#!/bin/bash
#################################
# Artix linux installation script
#################################
# IMPORTATN NOTES:
# 
# This script assumes your installation disk is /dev/sda, if you want to install to a different disk change the $disk variable accordingly
#
# This script will make a 1GB boot, and 30GB root partition. The 3rd partition will use the rest of your remaining diskspace as a home partition.
# If you wish to change any of this, see the "PARTITIONING" section

