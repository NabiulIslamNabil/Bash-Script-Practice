#!/bin/bash

read -p "Enter directory name: " directory_name

if [[ -d $directory_name ]]; then
	echo "Next step."
else 
	echo "No such directory. Creating New."
	mkdir $directory_name
fi

touch print2.log
>print2.log
cd $directory_name

read -p "Enter file extension: " file_ext

for file in $(find -type f -name "*.$file_ext"); do
	if [[ -w "$file" ]]; then
		words=$(wc -w < "$file")
		if [[ $words -eq 0 ]]; then
			echo "File name: $file Words: $words Empty" >> ../print2.log
		elif [[ $words -ge 1 && $words -le 50 ]]; then
			echo "File name: $file Words: $words Small" >> ../print2.log
		else
			echo "File name: $file Words: $words Big" >> ../print2.log
		fi
	fi
done