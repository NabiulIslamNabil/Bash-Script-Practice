#!/bin/bash
read -p "a=" a
read -p "b=" b
read -p "c=" c

aSquare=$((a*a))
bSquare=$((b*b))
cSquare=$((c*c))

sum=$((aSquare+bSquare))
if [[ cSquare -eq sum ]]; then
	echo "Right Triangle"
else
	echo "Not Right Triangle"
fi
