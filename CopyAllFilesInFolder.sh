#!/bin/bash

# File Date
Inport=$1
Destination=$2


function CK_Dest_Folder(){
	# Check Destination Folder
	if [ ! -d $Destination ];then
		mkdir $Destination;
	fi
}

function CK_Inport_Folder(){
	# Check Inport Folder
	if [ ! -d $Inport ];then
		echo "(Error!) 來源資料夾錯誤";
		exit;
	fi
}

function CP_Files(){
	find $1 -type f -exec cp {} $2 \;
}


# Main Pro
if [ ! -z "$Inport" ]  && [ ! -z "$Destination" ];then
	# Check Destination Folder
	CK_Dest_Folder;
	# Check Inport Folder
	CK_Inport_Folder;
	# Run Inport Folder
	for File in $Inport*;
	do
		CP_Files $File $Destination;
	done

else
	echo "(Error!) 請輸入完整來源及目的資料夾";
fi

