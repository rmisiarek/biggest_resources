#!/bin/sh

TOP=10
PARTITION_DEFAULT="/home"

clear

while :
do
	clear
	echo "1) Find biggest files and directories"
	echo "2) Find biggest directories"
	echo "3) Find biggest files"
	echo "4) Exit"
	echo "Select an option (1-3):"
	read OPTION

	if [ "$OPTION" == "4"  ]
	then
		echo "Bye ;)"
		break
	fi

	echo "Type partition or hit enter for default [ $PARTITION_DEFAULT ]"
	read PARTITION
	if [ "$PARTITION" == "" ]
	then
		$PARTITION = $PARTITION_DEFAULT
	fi

	case $OPTION in
		1) du -ha $PARTITION | sort -hr | head -n $TOP ;;
		2) du -Sh $PARTITION | sort -rh | head -n $TOP ;;
		3) find $PARTITION -type f -exec du -Sh {} + | sort -rh | head -n $TOP ;;
		*) echo "INVALID NUMBER!" ;;
	esac
	
	echo ""
	echo "Hit enter to continue [CTRL+C to stop]"
	read
done

