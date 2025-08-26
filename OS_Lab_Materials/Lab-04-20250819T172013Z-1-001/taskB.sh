#!/bin/bash
read -p "a=" a
read -p "b=" b
read -p "c=" c

if [[ $a -gt $b && $a -gt $c ]]; then
	echo "$a is greater"
elif [[ $b -gt $a && $b -gt $c ]]; then
	echo "$b is greater"
else
	echo "$c is greater"
fi

