#!/bin/bash

# Set default rutorrent lsio path
rutorrent_path="/app/rutorrent"

echo "*** Checking for ratiocolor ***"
if [ ! -d $rutorrent_path/plugins/ratiocolor ]
then
	echo "*** Installing ratiocolor ***"
	# Installing and configuring ratiocolor plugin
	cd $rutorrent_path/plugins/
	svn co https://github.com/Gyran/rutorrent-ratiocolor.git/trunk ratiocolor

	echo "*** Swapping colors from background to text ***"
	# Swap the colors from backgrounds to text colors
	sed -i "s:changeWhat = \"cell-background\";:changeWhat = \"font\";:g" $rutorrent_path/plugins/ratiocolor/init.js
else
	echo "*** Updating ratiocolor ***"
	cd $rutorrent_path/plugins/
	svn co https://github.com/Gyran/rutorrent-ratiocolor.git/trunk ratiocolor
fi

