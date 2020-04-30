#!/bin/bash

echo "*** Installing or updating themes ***"
REPOQB=https://github.com/QuickBox/club-QuickBox.git
REPOMD=https://github.com/phlooo/ruTorrent-MaterialDesign.git
LOCALQB=/app/rutorrent/plugins/theme/themes/club-QuickBox
LOCALMD=/app/rutorrent/plugins/theme/themes/MaterialDesign

LOCALQB_GIT=$LOCALQB/.git
LOCALMD_GIT=$LOCALMD/.git

echo "*** Checking for club-Quickbox ***"
if [ ! -d $LOCALQB_GIT ]
then
	echo "*** Installing club-Quickbox theme ***"
    git clone $REPOQB $LOCALQB
    chown -R abc:users $LOCALQB
else
	echo "*** Updating club-Quickbox theme ***"
    cd $LOCALQB
    git pull $REPOQB
fi

echo "*** Checking for MaterialDesign ***"
if [ ! -d $LOCALMD_GIT ]
then
	echo "*** Installing MaterialDesign theme ***"
    git clone $REPOMD $LOCALMD
    chown -R abc:users $LOCALMD
else
	echo "*** Updating MaterialDesign theme ***"
    cd $LOCALMD
    git pull $REPOMD
fi

echo "*** Done with themes ***"
