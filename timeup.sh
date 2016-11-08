#!/bin/bash

# This script syncs local time with a time server. 
# It also updates the hardware clock.

ntpdate -u 172.17.100.43
hwclock --systohc
