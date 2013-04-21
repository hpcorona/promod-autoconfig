#!/bin/bash

LOCAL_PATH=~/promod-autoconfig
mkdir ~/bin
chmod ugo+x $LOCAL_PATH/*.sh

for f in ad_*.sh
do	
	ln -s $LOCAL_PATH/$f ~/bin/$f
done
