#!/bin/bash

AUDIT_DIR="/exam_results/audit"
mkdir -p "$AUDIT_DIR"

touch "$AUDIT_DIR/notes.txt"

cwd_path=$(pwd)
echo "# Current Working Directory" > "$AUDIT_DIR/cwd.txt"
echo "$cwd_path" >> "$AUDIT_DIR/cwd.txt"


echo "# List of all users (from /etc/passwd)" > "$AUDIT_DIR/users.txt"
cut -d: -f1 /etc/passwd >> "$AUDIT_DIR/users.txt"

echo "# Users with /bin/bash shell" > "$AUDIT_DIR/bash_users.txt"
grep "/bin/bash" /etc/passwd | cut -d: -f1 >> "$AUDIT_DIR/bash_users.txt"

echo "# First 5 lines of /etc/passwd with /bin/bash replaced by /usr/bin/zsh" > "$AUDIT_DIR/shell_preview.txt"
sed 's/\/bin\/bash/\/usr\/bin\/zsh/g' /etc/passwd | head -n 5 >> "$AUDIT_DIR/shell_preview.txt"

echo "# Kernel name and version" > "$AUDIT_DIR/sysinfo.txt"
uname -a >> "$AUDIT_DIR/sysinfo.txt"
echo "# Architecture" >> "$AUDIT_DIR/sysinfo.txt"
arch >> "$AUDIT_DIR/sysinfo.txt"

echo "# First 3 lines of /etc/group" > "$AUDIT_DIR/group_summary.txt"
head -n 3 /etc/group >> "$AUDIT_DIR/group_summary.txt"
echo "# Last 2 lines of /etc/group" >> "$AUDIT_DIR/group_summary.txt"
tail -n 2 /etc/group >> "$AUDIT_DIR/group_summary.txt"

echo "# List of all files in /etc" > "$AUDIT_DIR/conf_files.txt"
find /etc -type f 2>/dev/null >> "$AUDIT_DIR/conf_files.txt"

echo "# Top 10 largest files in /var/log" > "$AUDIT_DIR/top_logs.txt"
find /var/log -type f -exec du -b {} + 2>/dev/null | sort -nr | head -n 10 >> "$AUDIT_DIR/top_logs.txt"

cp /etc/hosts "$AUDIT_DIR/hosts.bak"
chmod 600 "$AUDIT_DIR/hosts.bak"

echo "# Permission details of hosts.bak" > "$AUDIT_DIR/hosts_perm.txt"
ls -l "$AUDIT_DIR/hosts.bak" >> "$AUDIT_DIR/hosts_perm.txt"

rm -f "$AUDIT_DIR/hosts_perm.txt"
rm -f "$AUDIT_DIR/notes.txt"

echo "System audit completed. Results are in $AUDIT_DIR"