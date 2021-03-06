#!/bin/bash

# Script para montar discos ---> https://github.com/ledti

# sd: easily mount mass storage devices.
# last modified: 2014/08/15
# commands: none, '-m', '-u', or '--help'.

# visually exclude the following /dev/sd* device(s) from the listing:
# syntax example: "abc", to exclude drives a,b, and c.
# use "-" to show everything.
exclude="a"

# mount commands:
mount="udisksctl mount -b /dev/sd$2"
unmount="udisksctl unmount -b /dev/sd$2"

# enable the extglob shell option (required for the $devices function):
shopt -s extglob

# function to list attached mass storage devices, excluding some:
devices() {
    ls -1 /dev/sd!([$exclude]*)
}

if [[ $1 = -[mu] ]]; then
    if [[ $2 = [a-z]* ]]; then
        if [[ $1 = -m ]]; then
            $mount
        else
            $unmount
        fi
    elif [[ ! "$2" ]]; then
            echo "You must provide a variable, for example, 'c' or 'd1'."
    else
        echo "That is not a valid command, see --help."
    fi
elif [[ $1 = "--help" ]]; then
    echo "Commands:"
    echo "  -m: mount drive or partition."
    echo "  -u: unmount drive or partition."
    echo "  --help: show this help dialogue."
    echo "Example usage:"
    echo "  sd        # list devices."
    echo "  sd -m c   # mount /dev/sdc."
    echo "  sd -m d1  # mount /dev/sdd1."
    echo "  sd -u d   # unmount /dev/sdd."
elif [ ! "$1" ]; then
    if devices &> /dev/null; then
        echo "Available devices:"
        devices
    else
        echo "There are no mountable mass storage devices."
    fi
else
    echo "That is not a valid command, see --help."
fi
