# Introduction
This repository contains two Linux shell scripts that support mapping special function keys of a Microsoft Keyboard.
These keys are ordinarily unavailable to Linux. 
Some of the keys are even invisible to hardware event probing tools.
The scripts provide a basic structure of mapping to anything achievable with shell scripts.

# Technical Information
Each script looks into the hexdump of different device interfaces.
- hexdump /dev/input/event#
- hexdump /dev/hidraw#
  
# How to Use
Find out the corresponding event[ID] and hidraw[ID]

```ls -la /dev/input/by-id```
   
Run quick test commands

```sudo hexdump -e '24/2 "%04x " "\n"' -n 24 /dev/input/event21```

```sudo hexdump -e '16/2 "%04x " "\n"' -n 16 /dev/hidraw7```

Adapt the scripts to your own hardware IDs and desired commands and scripts.

# Test Machine
- Microsoft Keyboard 3000 v2.0 (13+5 new keys avaible to Linux)
- Linux Kernel 7.3.1
- Comsic Desktop(Wayland)
- PorteuX(Slackware)
