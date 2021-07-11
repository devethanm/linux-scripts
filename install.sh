#!/bin/bash
#################################
# Artix linux installation script
#################################
# IMPORTANT NOTES:
# 
# This script assumes your installation disk is /dev/sda, if you want to install to a different disk change the $disk variable accordingly
# It also assumes that /dev/sda is an empty disk. If it is not, make sure to delete all existing partitions before running this script.
#
# This script will make a 1GB boot, and 30GB root partition. The 3rd partition will use the rest of your remaining diskspace as a home partition.
# If you wish to change any of this, see the "PARTITIONING" section
#
#

disk=/dev/sda

fdisk $disk < fdisk_cmds


