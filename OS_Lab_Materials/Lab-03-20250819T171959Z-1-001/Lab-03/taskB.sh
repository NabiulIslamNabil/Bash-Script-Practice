#!/bin/bash
read -p "Enter a directory to scan for shell scripts: " dir
read -p "Enter a keyword to count in found scripts: " word

files=$(find . -type f -name "*.sh")
for file in "${files[@]}"; do
	count = $(grep -iw "$word" "$file")
	echo "$file: $count occurences"
done
