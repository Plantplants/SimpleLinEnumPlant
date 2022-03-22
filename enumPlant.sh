#!/bin/bash

# Variables.
output=plant.txt

# Colours.
RED='\033[0;31m'
NONE='\033[0m'

# Functions.
printRed () {
echo -e "\n${RED}$1${NONE}"
}

# Intro Message.
echo "Running Simple Linux Enumeration Plant..."
echo "The script will write to $output"

# Enumeration process and writing to a file.
{
echo "Simple Linux Enumeration Plant Output"
printRed "Kernel Version"
cat /proc/version

printRed "Current User Information"
id

printRed "Sudo Version"
sudo -V

printRed "Writable /etc/passwd?"
ls -la /etc/passwd

printRed "Users with Home Directories"
grep -v "nologin\|false" /etc/passwd

printRed "Reading /etc/crontab"
cat /etc/crontab

printRed "Listening Ports"
netstat -antup | grep "LISTEN"

printRed "SUID"
find / -perm /4000 -type f -exec ls -ld {} \; 2>/dev/null

printRed "Capabilities"
getcap -r / 2>/dev/null

printRed "No Root Squash"
cat /etc/exports | grep no_root_squash

printRed "World Writable folders"
#find / -perm -o+w -type d -exec ls -la {} + 2>/dev/null
#More test needed

printRed "World Writable Files"
#find / -perm -o+w -type f -exec ls -la {} + 2>/dev/null
#More test needed

} > $output

# Outro Message.
echo "Done!"
echo "Run 'cat $output'"
