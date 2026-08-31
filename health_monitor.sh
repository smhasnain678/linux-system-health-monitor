#!/bin/bash

LOG_FILE="logs/system_health_$(date +%Y-%m-%d_%H-%M-%S).log"
exec > >(tee -a "$LOG_FILE") 2>&1

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

# Disk Warning
DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')
if [ "$DISK_USAGE" -gt 80 ]; then
	echo "WARNING: Disk Usage is above 80%!"
else
	echo "Disk Usage is normal"
fi

echo "==============================="

# Memory Warning
MEMORY_USAGE=$(free | awk '/Mem:/ {printf "%.0f", $3/$2 * 100}')
echo "Memory Usage: $MEMORY_USAGE%"
if [ "$MEMORY_USAGE" -gt 80 ]; then
	echo "WARNING: Memory Usage is above 80%"
else
	echo "Memory Usage is normal"
fi
