#!/bin/sh

TOP=10
PARTITION="/home"

echo "1) Find biggest files and directories"
echo "2) Find biggest directories"
echo "3) Find biggest files"
echo "Select an option (1-3):"
read OPTION

case $OPTION in
	1) du -h -a $PARTITION | sort -h -r | head -n $TOP ;;
	2) echo "" ;;
	3) echo "" ;;
esac

