#!/bin/bash

read -p "Number of queries: " queries
for ((i=1; i<=queries; i++)); do
    remaining=$((queries - i + 1))
    echo "You have $remaining queries remaining"
    read -p "Filename: " filename
    lines=$(wc -l < "$filename")
    echo "Number of lines: $lines"

    if [[ $lines -eq 0 ]]; then
        echo "$filename is empty!"
    elif [[ $lines -ge 1 && $lines -lt 10 ]]; then
        echo "$filename is small!"
    else
        echo "$filename is large!"
    fi
done

