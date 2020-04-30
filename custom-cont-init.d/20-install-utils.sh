#!/bin/bash

echo "*** Installing utilities to support plugins ***"
apk add subversion zip
apk add --no-cache findutils # Required for filemanager
apk add php-sockets # Required for filemanager
apk add --no-cache --upgrade grep # Updated grep required for -p regex flag

echo "*** Checking for rar ***"
if [ ! -f /usr/local/bin/rar ]
then
	echo "*** Downloading rar ***"
	cd /tmp
	if [ `getconf LONG_BIT` = "64" ]
		then
			wget -O rarlinux.tar.gz http://www.rarlab.com/rar/rarlinux-x64-5.5.0.tar.gz
		else
			wget -O rarlinux.tar.gz http://www.rarlab.com/rar/rarlinux-5.5.0.tar.gz
		fi
	echo "*** Installing rar ***"
	tar -xzf rarlinux.tar.gz
	rm rarlinux.tar.gz
	mv rar/rar /usr/local/bin/rar
	rm -rf rar
	chmod 755 /usr/local/bin/rar
	cd /
else
	echo "*** Rar already installed ***"
fi

echo "*** Done installing prerequisites ***"
