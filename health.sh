#!/bin/bash

# ==========================================
# SYSTEM HEALTH CHECK SCRIPT
# ==========================================

LOGFILE="system_health.log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')

{
    echo "=================================="
    echo "System Health Report - $DATE"
    echo "=================================="

    echo -e "\nHostname:"
    hostname

    echo -e "\nSystem Uptime:"
    uptime

    echo -e "\nMemory Usage:"
    free -h

    echo -e "\nDisk Usage:"
    df -h

    echo -e "\nCPU Load:"
    uptime | awk -F'load average:' '{print $2}'

    echo -e "\nDisk Alert Check:"
    DISK_USAGE=$(df --output=pcent / | tail -n 1 | tr -d ' %')

    if [ "$DISK_USAGE" -gt 80 ]; then
        echo "WARNING: Disk usage is above 80% (Current: ${DISK_USAGE}%)"
    else
        echo "Disk usage is normal (Current: ${DISK_USAGE}%)"
    fi

    echo -e "\nHealth check completed successfully.\n"
} >> "$LOGFILE"
