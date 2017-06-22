#!/bin/bash
# Crypto miner for Microsoft Azure
# Script by Ben Thompson
echo -e "\e[31;43m***** Installing Drivers and Prerequisites *****\e[0m"
sudo apt-get update
sudo apt-get dist-upgrade
sudo apt-get install gcc g++ build-essential libssl-dev automake linux-headers-$(uname -r) git gawk libcurl4-openssl-dev libjansson-dev xorg libc++-dev libgmp-dev python-dev
wget http://uk.download.nvidia.com/XFree86/Linux-x86_64/375.26/NVIDIA-Linux-x86_64-375.26.run
sudo chmod +x NVIDIA-Linux-x86_64-375.26.run
sudo ./NVIDIA-Linux-x86_64-375.26.run --accept-license --no-questions --no-install-compat32-libs
wget https://developer.nvidia.com/compute/cuda/8.0/prod/local_installers/cuda-repo-ubuntu1604-8-0-local_8.0.44-1_amd64-deb
sudo dpkg -i cuda-repo-ubuntu1604-8-0-local_8.0.44-1_amd64-deb
sudo apt-get update
sudo apt-get install cuda-toolkit-8-0
sudo usermod -a -G video $USER
echo "" >> ~/.bashrc
echo "export PATH=/usr/local/cuda-8.0/bin:$PATH" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=/usr/local/cuda8.0/lib64:$LD_LIBRARY_PATH" >> ~/.bashrc
git clone https://github.com/tpruvot/ccminer.git
cd ccminer
./autogen.sh
./configure
make
sudo make install
echo -e "\e[31;43m***** Rebooting... *****\e[0m"
