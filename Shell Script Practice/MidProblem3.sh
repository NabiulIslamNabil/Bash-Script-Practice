#!/bin/bash

# In this problem, you will search for lines containing numbers in a file.
# Write a shell script that prompts the user for a file name. 
# If the file doesn't exist, print an error and keep prompting again. 
# When a valid file is found, print the total number of lines with digits (0-9) 
# and the total number of lines without digits in the file.

linesWithDigits=0
linesWithoutDigits=0

for((i=1;;i++)); do
	read -p "Enter filename: " filename

	if [[ -f "$filename" ]]; then
		linesWithDigits=$(grep -cE '[0-9]' "$filename")
		linesWithoutDigits=$(grep -vcE '[0-9]' "$filename")
		echo "Digit_LINES = $linesWithDigits, NO_DIGIT_LINES=$linesWithoutDigits"
		break
	else
		echo "No such file. Try again"
	fi
done


