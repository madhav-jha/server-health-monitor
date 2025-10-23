#!/bin/bash

echo "==========================================="
echo "      SERVER HEALTH MONITORING REPORT"
echo "==========================================="
echo "Date: $(date)"
echo ""


# CPU Usage Check

echo "1. CPU USAGE:"
top -bn1 | grep "Cpu(s)" | awk '{print "CPU Load: " 100 - $8 "%"}'
echo ""

# Memory Usage Check
  
echo "2. MEMORY USAGE:"
free -h | grep -v total
echo ""

# Disk Usage Check
echo "3. DISK USAGE:"
df -h / | grep -v Filesystem
echo ""

# Running Services Check

echo "4. SERVICES STATUS:"
services=("nginx" "sshd" "docker")
for service in "${services[@]}"; do
    if systemctl is-active --quiet $service; then
        echo " $service: RUNNING"
    else
        echo " $service: STOPPED"
    fi
done
echo ""

echo "==========================================="




