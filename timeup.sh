#!/bin/bash

# This script syncs local time with a time server. 
# It also updates the hardware clock.

ntpdate -u time.server.ip.or.fqdn
hwclock --systohc
