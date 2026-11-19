#!/bin/bash

# Microsoft Keyboard Special Function Keys support in Linux
# This script is for 13 special keys not mapped in Linux. Some of them were not even shown under showkey command.
# For special numbered macro key 1 2 3 4 5 keys, use another script.

# Tested with Microsoft Keyboard 3000 v2.0 
# Tested with Linux Kernel 7.3.1 on Comsic/Wayland/PorteuX

# Change event ID according to your own system.
# ls -la /dev/input/by-id
# hexdump -e '24/2 "%04x " "\n"' -n 24 /dev/input/event21

while true
do
    read -r -a elements < <(hexdump -e '24/2 "%04x " "\n"' -n 24 /dev/input/event21)  
        
    if [[ "${elements[10]}" == "00cd" ]]; then
        echo "Media Play"
        # runuser -u guest /home/guest/script/hdmi3.sh
    fi  
    if [[ "${elements[10]}" == "00b6" ]]; then
        echo "Media Backward"
    fi  
    if [[ "${elements[10]}" == "00b5" ]]; then
        echo "Media Forward"
    fi  
    if [[ "${elements[10]}" == "00b7" ]]; then
        echo "Media Stop"
    fi  
        
    if [[ "${elements[10]}" == "0182" ]]; then
        echo "Star"
    fi    
    
    if [[ "${elements[10]}" == "018a" ]]; then
        echo "Email"
    fi  
    if [[ "${elements[10]}" == "0223" ]]; then
        echo "Home"
    fi  
    if [[ "${elements[10]}" == "0199" ]]; then
        echo "Team"
    fi  
    if [[ "${elements[10]}" == "0183" ]]; then
        echo "Headphone"
    fi    
    
    if [[ "${elements[10]}" == "01a7" ]]; then
        echo "Document"
    fi  
    if [[ "${elements[10]}" == "01b6" ]]; then
        echo "Camera"
    fi  
    if [[ "${elements[10]}" == "022d" ]]; then
        echo "ZoomIn"
    fi  
    if [[ "${elements[10]}" == "022e" ]]; then
        echo "ZoomOut"
    fi      
done    
