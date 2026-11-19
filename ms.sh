#!/bin/bash

# Microsoft Keyboard Special Function Keys support in Linux
# This script is for numbered macro key 1 2 3 4 5 only.

# Tested with Microsoft Keyboard 3000 v2.0 
# Tested with Linux Kernel 7.3.1 on Comsic/Wayland/PorteuX

# Change hid raw ID according to your own system.
# Do not press the same key repeatively or the report boundary will be off.
# ls -la /dev/input/by-id
# sudo hexdump /dev/hidraw7
# sudo hexdump -e '16/2 "%04x " "\n"' -n 16 /dev/hidraw7

while true
do
    #XXX read -r -a elements <<< "$(hexdump /dev/input/event21)" # not working
    read -r -a elements < <(sudo hexdump -e '16/2 "%04x " "\n"' -n 16 /dev/hidraw7)  
   
    if [[ "${elements[2]}" == "0500" ]]; then
        echo "S1"
        # runuser -u guest /home/guest/script/hdmi3.sh
    fi  
    if [[ "${elements[2]}" == "0900" ]]; then
        echo "S2"
    fi    
    if [[ "${elements[2]}" == "1100" ]]; then
        echo "S3"
    fi   
    if [[ "${elements[2]}" == "2100" ]]; then
        echo "S4"
    fi             
    if [[ "${elements[2]}" == "4100" ]]; then
        echo "S5"
    fi             
done    