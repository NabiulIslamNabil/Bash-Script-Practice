#!/bin/bash
read -p "Enter directory name: " directory_name 
if [[ -d $directory_name ]]; then
 echo "Exists" 
else 
	echo "No such directory. Creating new. " 
	mkdir $directory_name 
fi 
touch print.log
cd $directory_name
read -p "Enter an username: " user_name
for file in $(find . -type f -user "$user_name" -name "*.txt"); do 
	charCount=$(wc -c < "$file") 
	if [[ $charCount -eq 0 ]]; then 
		echo "File name: $file Character Count: 0 Size Class: Empty" >> ../print.log 
	elif [[ $charCount -ge 1 && $charCount -le 250 ]]; then 
		echo "File name: $file Character count: $charCount Size Class: Small" >> ../print.log 
	else
 		echo "File name: $file Character Count: $charCount Size Class: Big" >> ../print.log 
	fi
done