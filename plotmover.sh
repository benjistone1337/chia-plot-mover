#!/bin/bash

# Script to move chia *.plot files from one directory to another location automatically using inotifywait
# Coded (badly) by benjistone1337

#Color definitions here
RED='\033[0;31m'
NC='\033[0m' # No Color
GRN='\033[0;32m'


# Be sure to change SRCDIR and DESTDIR to the appropriate paths on your system
SRCDIR="/path/to/your/dir/to/watch"
DESTDIR="/path/to/your/remote/directory"

echo -e "${RED}Looking for *.plot files in: $SRCDIR"
echo " "
echo -e "${NC}Destination directory is: $DESTDIR"



inotifywait -m $SRCDIR -e create -e moved_to |
    while read path action file; do
        if [[ "$file" =~ .*plot$ ]]; then # Does the file end with .plot?
            	echo " "
		echo -e "${GRN}FOUND NEW *.plot file!! ${NC}Let's rsync that to $DESTDIR" 
		
#Change the line below to your actual username@server 
            	rsync --remove-source-files -avP "$SRCDIR/$file" username@server:"$DESTDIR/$file"
		echo -e "${NC}"        
	fi
    done
