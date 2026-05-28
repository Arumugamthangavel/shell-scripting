#!/bin/bash

# ==========================================
# SYSTEM HEALTH CHECK SCRIPT
# ==========================================

LOGFILE="system_health.log"
DATE=$(date)

echo "==================================" >> $LOGFILE
echo "System Health Report - $DATE" >> $LOGFILE
echo "==================================" >> $LOGFILE

# HOSTNAME
echo "" >> $LOGFILE
echo "Hostname:" >> $LOGFILE
hostname >> $LOGFILE

# UPTIME
echo "" >> $LOGFILE
echo "System Uptime:" >> $LOGFILE
uptime >> $LOGFILE

# MEMORY USAGE
echo "" >> $LOGFILE
echo "Memory Usage:" >> $LOGFILE
free -h >> $LOGFILE

# DISK USAGE
echo "" >> $LOGFILE
echo "Disk Usage:" >> $LOGFILE
df -h >> $LOGFILE

# CPU LOAD
echo "" >> $LOGFILE
echo "CPU Load:" >> $LOGFILE
top -bn1 | grep "load average" >> $LOGFILE

# DISK ALERT CHECK
DISK_USAGE=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')

echo "" >> $LOGFILE

if [ $DISK_USAGE -gt 80 ]
then
    echo "WARNING: Disk usage is above 80%" >> $LOGFILE
else
    echo "Disk usage is normal" >> $LOGFILE
fi

echo "" >> $LOGFILE
echo "Health check completed successfully." >> $LOGFILE
