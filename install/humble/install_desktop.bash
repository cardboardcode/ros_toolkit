#!/usr/bin/env bash

# Copyright 2022 Bey Hao Yun
# Static Analysis: shellcheck install_desktop.bash -x -e SC1091

# Set Locale to UTF-8
sudo apt-get update 
sudo apt-get install -y locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8
locale

# Set up Sources
sudo apt-get install -y software-properties-common
sudo add-apt-repository universe
sudo apt-get update
sudo apt-get install -y curl gnupg2 lsb-release
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key  -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(source /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

# Install ROS2 packages
sudo apt-get update
sudo apt-get install -y ros-humble-desktop

# Install colcon build tools
sudo apt-get install -y python3-colcon-common-extensions
