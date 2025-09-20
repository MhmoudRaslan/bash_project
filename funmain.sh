#!/bin/bash
function create(){
	local data
	read data
	mkdir $data
	cp datamain.sh ./$data/datamain.sh
}
function list(){
	 ls
}
function connect(){
	local data
	read -p "Enter database name: " data
	if [ -d "$data" ]; then
        cd "$data" || return 1
        echo "Connected to database: $dbname"
        
        bash datamain.sh
        
        	cd - > /dev/null
    	else
        	echo "Database '$data' does not exist."
    	fi

}
function drop(){
	local data
        read data
        rm -r $data
}
