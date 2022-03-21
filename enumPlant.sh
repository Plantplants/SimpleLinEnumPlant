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
printRed "Kernel Version" # cat /proc/version
cat /proc/version

printRed "Users with Home Directories" # grep -v "nologin\|false" /etc/passwd
grep -v "nologin\|false" /etc/passwd

} > $output

# Outro Message.
echo "Done!"
echo "Run 'cat $output'"
