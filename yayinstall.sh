# QUICK YAY INSTALLATION SCRIPT
# RUN THIS BEFORE RUNNING POST INSTALLATION SCRIPT
# DONT RUN THIS SCRIPT AS ROOT
cd $HOME
git clone https://aur.archlinux.org/yay.git
chown -R ethan:wheel ./yay
cd yay
makepkg -si
cd $HOME
