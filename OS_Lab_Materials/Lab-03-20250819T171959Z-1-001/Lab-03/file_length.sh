#!/bin/bash
read -p "Number of queries: " queries

for ((i=queries; i>0; i--)); do
	echo "You have $i queries remaining"
	read -p "Filename: " file
	lines=$(wc -l < "$file")
	echo "Number of lines: $lines"

	if [[ lines -eq 0 ]]; then
		echo "$file is empty"
	elif [[ lines -ge 0 && lines -le 10 ]]; then
		echo "$file is small"
	else
		echo "$file is large"
	fi
done
