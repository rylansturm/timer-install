#!/bin/bash
# updates Raspberry Pi and makes a working version of the TaktTimer app

echo "Running Update..."

# install dependencies
sudo apt-get update
sudo apt-get -y upgrade
echo

sudo apt-get -y install xscreensaver 
# TODO: add command to edit xscreensaver file to disable screensaver
# TODO: add other dependencies that I'm not thinking of now

echo
# Downloading and installing TaktTimer
echo "Installing TaktTimer app..."
cd ~/
mkdir TaktTimer
cd TaktTimer
git init
git remote add origin https://github.com/rylansturm/TaktTimer
git pull origin master

# shortcuts
echo
echo "Making desktop shortcuts..."
chmod -x add_shortcuts.sh
bash add_shortcuts.sh
chmod -x ~/timer_update.sh
cd ~/
sudo cp timer-install/icon.png /usr/share/icons/takt.png
sudo cp Desktop/Timer.desktop .local/share/applications/Timer.desktop

# Everything is ready! Let's run it.
echo "Running TaktTimer..."
python3 TaktTimer/Timer.py