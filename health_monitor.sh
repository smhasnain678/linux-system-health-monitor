#!/bin/bash


echo "=============================="
echo "    SYSTEM HEALTH MONITOR"
echo "=============================="

# Basic System Information
echo "Hostname   : $(hostname)"
echo "Date       : $(date)"
echo "Uptime	   : $(uptime -p)"

echo "=============================="

# CPU Usage
echo "CPU Usage:" 
top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8 "%"}'

echo "=============================="

# Memory Usage
echo "Memory Usage:" 
free -h

echo "=============================="

# Disk Usage
echo "Disk Usage:"
df -h /

echo "=============================="

# Logged-in Users
echo "Logged-in Users:"
w

echo "=============================="
