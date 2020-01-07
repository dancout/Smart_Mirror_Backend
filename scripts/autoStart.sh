#!/bin/bash
echo "Adding a line to your autostart file to bring up the Smart Mirror Backend"
echo '@lxterminal -e /bin/bash /home/pi/Smart_Mirror_Backend/scripts/run.sh' | sudo tee -a /etc/xdg/lxsession/LXDE-pi/autostart
