#!/bin/bash

read -p "Enter directory name: " directory_name

if [[ -d $directory_name ]]; then
	cd $directory_name

	read -p "Enter file extension: " file_ext

	for file in $(find -type f -name "*.$file_ext"); do
		if [[ -w "$file" ]]; then
			charCount=$(wc -c < "$file")
			if [[ $charCount -eq 0 ]]; then
				echo "File name: $file Character count: $charCount Size Class: Empty"
			elif [[ $charCount -ge 1 && $charCount -le 250 ]]; then
				echo "File name: $file Character count: $charCount Size Class: Small"
			else 
				echo "File name: $file Character count: $charCount Size Class: Big"
			fi 
		fi
	done

else
	echo "No such directory."
	exit 1
fi