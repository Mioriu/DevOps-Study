#!/bin/bash
REPORT_FILE="/tmp/security_report_$(date +%Y%m%d).txt"
{
echo "=== Security Analysis Report ==="
echo "Date: $(date)"
FAILATTEMPTS=$(journalctl -u ssh --since "24 hours ago" | grep -E "Failed password|authentication failure|Invalid user|invalid|No supported authentication" | wc -l)
SUCCESSFULLOG=$(journalctl -u ssh --since "24 hours ago" | grep -E "Accepted (password|publickey|keyboard-interactive)" | wc -l)
CRITERR=$(journalctl --system -p 0..2 --since "1 hour ago" | grep -v "\-- No entries \--" | wc -l)
echo "Failed SSH attempts (last 24h): $FAILATTEMPTS"
echo "Top 5 attacking IPs:"
journalctl -u ssh --since "24 hours ago"\
 | grep -E "Failed password|authentication failure|Invalid user|invalid|No supported authentication"\
 | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'\
 | sort\
 | uniq -c\
 | sort -rn\
 | head -5
echo "Successful logins (last 24h): $SUCCESSFULLOG"
echo "Critical errors (last hour): $CRITERR"
} | tee $REPORT_FILE
echo "Report saved to: $REPORT_FILE"