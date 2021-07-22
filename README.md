# chia-plot-mover
Simple script to move Chia *.plot files to another directory using inotifywait

This bash script uses inotifywait and rsync to detect newly created plot files in one directory and then moves them to another destination (local or remote) automatically.

## Why did I make this?
Essentially, I am replotting my chia plots using https://github.com/madMAx43v3r/chia-plotter I wanted to plot on another more powerful machine and leave my farming machine (less powerful) to continue plotting. Therefore, I came up with this script to watch a directory 'SRCDIR' for *.plot files and move them to another machine by using rsync


## Getting Started

1. You will need to install 'inotify-tools' on your system.
2. Modify the 'plotmover.sh' script to include your source directory 'SRCDIR' and your desitnation directory 'DESTDIR'
3. Save the file and make it executable by 'chmod u+x plotmover.sh'
4. Run the script, preferably in a tmux or screen session so if you close the terminal it will keep doing it's thing

## Tips
- As plot files are named with the extension *.tmp, it won't move files until they are actually named *.plot
- If using rsync and SSH, be sure that your keys are setup so you don't have to enter a password
- You can use rsync to sync to a remote server or change it to sync to a local directory
- You could also use 'mv' instead of rsync if you wish or another command
- This script will DELETE the files from your original SRCDIR once they have been transferred


Hope you find it useful while you (re)plot.
