#!/bin/sh
cd /home/pi
sudo apt install mason
sudo apt install ninja

echo Installing dependencies
sudo apt install dh-autoreconf libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev xcb libxcb1-dev libxcb-icccm4-dev libyajl-dev libev-dev libxcb-xkb-dev libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev libxcb-shape0 libxcb-shape0-dev

echo cloning the repository
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps

echo compiling & installing
mkdir -p build && cd build
meson ..
ninja

cd /etc/xdg/lxsession/LXDE-pi 
echo Change Windows Manager To i3 ctrl x y enter
sudo nano desktop.conf
echo # lxpanel and #pcmanfm Then Do ctrl x y enter
sudo nano autostart
sudo apt install i3status
sudo apt install rofi
cd .config/i3
echo Find # startdmenu under it remove dmenu_rn and type rofi -show drun width 400 -lines 5
sudo nano config
sudo reboot
exit 0