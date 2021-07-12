#!/bin/bash
#################################
# Artix linux post installation script
#################################
# IMPORTANT NOTES:
# 
# RUN THIS SCRIPT IN YOUR HOME DIRECTORY AFTER BOOTING INTO SYSTEM FOR THE FIRST TIME
# MAKE A USER AND GIVE IT A PASSWORD BEFOREHAND
#
# RUN THIS SCRIPT USER SUDO 

# UPDATING SYSTEM
pacman -Syu

# INSTALLING WINDOW MANAGER, TERMINAL, X, AND YAY
pacman -S xorg-server xorg-xinit libx11 libxinerama libxft webkit2gtk
git clone https://github.com/devethanm/dwm-fork
git clone https://github.com/devethanm/st-fork
git clone https://git.suckless.org/slstatus

# SETUP XINITRC
echo "exec dwm" >> .xinitrc

## SETUP DWM and dwm autostart
mkdir .dwm
touch .dwm/autostart.sh 
touch .dwm/autostart_blocking.sh 
chmod +x .dwm/autostart.sh
chmod +x .dwm/autostart_blocking.sh
make -C dwm-fork/ clean install
make -C st-fork/ clean install
make -C slstatus clean install

