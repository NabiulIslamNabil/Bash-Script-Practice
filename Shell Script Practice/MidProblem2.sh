#!/bin/bash

# In this problem, you will generate a list of odd numbers within a user-defined range.
# Write a shell script that prompts the user for two integers, a and b. 
# Then, output all odd numbers i in the range 0<a<b to a file named odd_nums.txt, 
# with each number written on a separate line.

read -p "Enter lower limit(a): " a 
read -p "Enter lower limit(b): " b
touch odd_nums.txt
>odd_nums.txt
for((i=a; i<=b; i++)); do
	if [[ $(($i%2)) -eq 1 ]]; then 
		echo  "$i" >> odd_nums.txt
	fi
done
