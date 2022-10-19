#!/bin/bash

function backup {
    local directory=$1
    local date=$2

    if [ -a "$HOME/backups/${date}-${directory}.tar.gz" ]; then
        printf "The file $HOME/backups/${date}-${directory} exists. Do you want to overwrite it? [y/n]"
        read response
        if [ "$response" == "y" ]; then
            tar -cvzf "$HOME/backups/${date}-${directory}.tar.gz" $directory
        else
            exit 0
        fi
    else
        printf "A file will be created in $HOME/backups/${date}-${directory}.tar.gz. Press any key to confirm!"
        read
        printf "\n"
        if ! [ -d "$HOME/backups" ]; then # if the directory not exists
            mkdir $HOME/backups/
        fi
        tar -cvzf "$HOME/backups/${date}-${directory}.tar.gz" $directory
    fi
}

function help {
    echo "Info:"
    printf "Create .tar.gz archive on $HOME/backups/"
    echo -e "\n"
    echo "Usage:"
    printf "./backup.sh <directory>\n"
}

if [ -d "$1" ]; then # if directory exists
    directory=$1
    date=`date +%Y-%m-%d`
    backup $directory $date
elif [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
    help
elif [ -z "$1" ]; then # if the length of string is not zero
    help
else
    echo "Not a directory"
    echo "Type --help to help"
fi
