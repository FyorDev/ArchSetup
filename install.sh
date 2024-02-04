#!/bin/bash

usage() {
    echo "Usage: $0 [-s]"
    echo "  -s, Install ALL my software"
    exit 1
}

# Parse command-line options
while getopts ":s" opt; do
  case $opt in
    s)
      run_software=true
      ;;
    \?)
      echo "Invalid option: -$OPTARG"
      usage
      ;;
  esac
done

if [ "$EUID" -ne 0 ]; then
    echo "Please run this script with sudo."
    exit 1
fi

if ping -c 1 aur.archlinux.org &> /dev/null; then
    echo "aur.archlinux.org is reachable. Proceeding with the script."
else
    echo "Error: Unable to ping aur.archlinux.org. Exiting."
    exit 1
fi

if sudo pacman -Syu --noconfirm; then
    echo "System updated successfully. Proceeding with the script."
else
    echo "Error: Unable to update the system with pacman -Syu. Exiting."
    exit 1
fi

./scripts/setup/setup.sh

./scripts/gnome/gnome.sh

./scripts/theme/theme.sh

if [ "$run_software" = true ]; then
  ./scripts/software/software.sh
fi

pacman -R gnome-console --noconfirm # ew go away
