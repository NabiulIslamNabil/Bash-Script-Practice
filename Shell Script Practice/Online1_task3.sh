#!/bin/bash

read -p "Enter directory name: " directory_name

if [[ -d $directory_name ]]; then
	cd $directory_name
	read -p "Enter username: " user_name

	for file in $(find -type f -user "$user_name" -name "*.txt"); do
		words=$(wc -w < "$file")
		if [[ words -eq 0 ]]; then
			echo "File name: $file Word Count: $words Size Class: Empty"
		elif [[ $words -ge 1 && $words -le 50 ]]; then
			echo "File name: $file Word Count: $words Size Class: Small"
		else
			echo "File name: $file Word Count: $words Size Class: Big"
		fi
	done

else
	echo "No such directory."
	exit 1
fi
