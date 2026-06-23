#!/bin/bash

REPORT_FILE="connectivity_report"

echo "===== Connectivity Report =====" > "$REPORT_FILE"
echo "Generated on: $(date)" >> "$REPORT_FILE"

echo -e "\n===== Ping Test: 8.8.8.8 =====" >> "$REPORT_FILE"
ping -c 5 8.8.8.8 >> "$REPORT_FILE" 2>&1

echo -e "\n===== Ping Test: google.com =====" >> "$REPORT_FILE"
ping -c 5 google.com >> "$REPORT_FILE" 2>&1

echo -e "\n===== DNS Resolution Test: github.com =====" >> "$REPORT_FILE"

if command -v nslookup &> /dev/null; then
    nslookup github.com >> "$REPORT_FILE" 2>&1
elif command -v dig &> /dev/null; then
    dig github.com >> "$REPORT_FILE" 2>&1
else
    getent hosts github.com >> "$REPORT_FILE" 2>&1
fi

echo -e "\nReport saved to $REPORT_FILE"