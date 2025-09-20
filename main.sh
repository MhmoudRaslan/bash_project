#!/bin/bash
while true
do
source ./funmain.sh
echo "----------------------------"
echo "Main manu"
echo "----------------------------"
echo "1-Create Database."
echo "2-List Database."
echo "3-Connect to Database."
echo "4-Drop Database."
echo "5-EXIT."
read option
case $option in 
	1)
		echo "you want to Create new Database"
		create
		;;
	2)
		echo "List database"
		list
		;;
	3)
		echo "connect to database"
		connect
		
		;;
	4)
		echo "Drop database"
		drop
		;;
	5)
		echo "GOODBYE"
		exit 0
		;;
	*)
		echo "not an option"
		;;
esac
done
