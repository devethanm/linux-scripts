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
# This script is written for UEFI bios and doesnt have support for legacy bios installation
#
# This script installs the runit init system for artix

# MAKE OTHER SCRIPTS EXECUTABLE
chmod +x install2.sh
chmod +x postinstall.sh
chmod +x postinstall2.sh
chmod +x yayinstall.sh

# PARTITIONING
disk=/dev/sda
fdisk $disk < fdisk_cmds

# FILESYSTEMS
mkfs.ext4 ${disk}3 # home partition
mkfs.ext4 ${disk}2 # root partition
mkfs.fat -F32 ${disk}1 # boot partition

# MOUNT PARTITIONS
mount ${disk}2 /mnt # mount root partition 
mkdir /mnt/home
mkdir /mnt/boot
mount ${disk}1 /mnt/boot # mount boot partition 
mount ${disk}3 /mnt/home # mount home partition 

# RUN INSTALLATION COMMANDS
basestrap /mnt base base-devel runit elogind-runit linux linux-firmware vim git neofetch

# CREATE FSTAB
fstabgen -U /mnt >> /mnt/etc/fstab

# CHROOT
mv install2.sh /mnt/home/ # move the 2nd install script to somewhere artix-chroot can access
artix-chroot /mnt

