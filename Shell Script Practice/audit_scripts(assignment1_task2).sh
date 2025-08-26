#!/bin/bash

read -p "Enter a directory to scan for shell scripts: " directory
read -p "Enter a keyword to count in found scripts: " word

files=($(find "$directory" -type f -name "*.sh"))

for file in "${files[@]}"; do
    count=$(grep -iwc "$word" "$file")
    echo "$file : $count occurrences"
done


