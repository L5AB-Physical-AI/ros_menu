#!/bin/sh

echo "Installing Neuron Startup Menu..."

menu_root="${ROS_MENU_ROOT:-$HOME/physical-ai/repos/ros_menu}"
mkdir -p "$(dirname "$menu_root")"
if [ ! -d "$menu_root" ]; then
    if [ -z $MENU_VERSION ]; then
        git clone https://github.com/Adlink-ROS/ros_menu.git "$menu_root"
    else
        git clone https://github.com/Adlink-ROS/ros_menu.git -b $MENU_VERSION "$menu_root"
    fi
fi
cd "$menu_root"
USE_CONTAINER=$USE_CONTAINER ./install.sh $MENU_CONFIG
cd - > /dev/null
