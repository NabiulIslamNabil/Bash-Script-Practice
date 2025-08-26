#!/bin/bash

read -p "Enter the year: " year

if [[ $(($year%400)) -eq 0 ]]; then
	echo "$year is a Leap Year"
elif [[ $(($year%100)) -ne 0 && $(($year%4)) -eq 0 ]]; then
	echo "$year is a Leap Year"
else 
	echo "$year is not a Leap Year."
fi