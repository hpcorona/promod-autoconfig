#!/bin/bash

#Autoconfig for Promod

#Temporal directory for promod downloads
LOCAL_PATH=~/promod-autoconfig
PROMOD_PATH=$LOCAL_PATH/temp

#L4D2 directories
L4D2_PATH=~/hlds/left4dead2/left4dead2
CONFIG_PATH=$L4D2_PATH/cfg/confogl_personalize.cfg
CONFIG_DEFAULT_PATH=$L4D2_PATH/cfg/server.cfg

#Metamod
METAMOD_URL=http://newyork.download.maverickservers.com/source/mmsource-1.9.2-linux.tar.gz
METAMOD_FILE=metamod.tar.gz

#Metamod.vdf
METAMODVDF_URL=http://www.metamodsource.net/vdf?vdf_game=left4dead2
METAMODVDF_FILE=metamod.vdf

#Sourcemod
SOURCEMOD_URL=http://newyork.download.maverickservers.com/source/sourcemod-1.4.7-linux.tar.gz
SOURCEMOD_FILE=sourcemod.tar.gz

#Confogl (full package) 2.2.2
CONFOGL_URL=http://left4fail_files.s3.amazonaws.com/confogl.tar.gz
CONFOGL_FILE=confogl.tar.gz

#Promod 3.2
PROMOD_URL=http://left4fail_files.s3.amazonaws.com/promod.tar.gz
PROMOD_FILE=promod.tar.gz

#SpecListener 2.0
#From here: https://forums.alliedmods.net/showthread.php?t=95474&page=3
SPECLISTENER_URL=http://www.sourcemod.net/vbcompiler.php?file_id=60884
SPECLISTENER_FILE=SpecListener2.0.smx

cd $LOCAL_PATH

echo "Cleaning paths..."
rm -rf $PROMOD_PATH
mkdir $PROMOD_PATH
cd $PROMOD_PATH

echo "Downloading..."
wget -O $METAMOD_FILE $METAMOD_URL
wget -O $METAMODVDF_FILE $METAMODVDF_URL
wget -O $SOURCEMOD_FILE $SOURCEMOD_URL
wget -O $CONFOGL_FILE $CONFOGL_URL
wget -O $PROMOD_FILE $PROMOD_URL
wget -O $SPECLISTENER_FILE $SPECLISTENER_URL

echo "Extracting..."
tar -zxf $METAMOD_FILE -C $L4D2_PATH
cp $METAMODVDF_FILE $L4D2_PATH/addons/$METAMODVDF_FILE
tar -zxf $SOURCEMOD_FILE -C $L4D2_PATH
tar -zxf $CONFOGL_FILE -C $L4D2_PATH
tar -zxf $PROMOD_FILE -C $L4D2_PATH
cp $SPECLISTENER_FILE $L4D2_PATH/addons/sourcemod/plugins/$SPECLISTENER_FILE
cat $LOCAL_PATH/server.cfg >> $CONFIG_PATH
cat $LOCAL_PATH/server.cfg >> $CONFIG_DEFAULT_PATH
cat $LOCAL_PATH/admins.ini >> $L4D2_PATH/addons/sourcemod/configs/admins_simple.ini

echo "Finito!"
