#!/bin/bash
#################################
# Artix linux installation script part 2
#################################
# IMPORTANT NOTES:
# 
# This script assumes you live in denver, change the time zone if needed

# TIME ZONE & CLOCk
ln -sf /usr/share/zoneinfo/America/Denver /etc/localtime
hwclock --systohc # syncing hardware clock

# LOCALE
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "en_US ISO-8859-1" >> /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf

# OTHER NECCECARY PACKAGES
pacman -S networkmanager networkmanager-runit openssh openssh-runit man git neofetch htop grub efibootmgr # SOME OF THESE PACKAGES ARE OPTIONAL

# SETUP SSH
ln -s /etc/runit/sv/sshd/ /etc/runit/runsvdir/current

# SETUP NETWORK MANAGER
ln -s /etc/runit/sv/NetworkManager/ /etc/runit/runsvdir/current

# HOSTNAME & HOSTS
echo "desktop" >> /etc/hostname
echo "127.0.0.1		localhost" >> /etc/hosts
echo "::1		localhost" >> /etc/hosts
echo "127.0.0.1		desktop.localdomain desktop" >> /etc/hosts # MAKE HOSTNAME A VARIABLE

# SETUP GRUB AND BOOTLOADER
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB 
grub-mkconfig -o /boot/grub/grub.cfg

# EDIT SUDOERS FILE FOR WHEEL GROUP
echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# THE LAST THING YOU HAVE TO DO IS MANUALLY SET A PASSWORD, YOU HAVE TO DO THIS
