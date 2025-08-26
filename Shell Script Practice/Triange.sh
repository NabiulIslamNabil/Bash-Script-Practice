#!/bin/bash

echo "3 inputs should be in increasing order"
read a
read b
read c

lhs=$((a*a+b*b))
rhs=$((c*c))

if [[ $lhs -eq $rhs ]]; then
    echo "Right Triangle!"
else
    echo "Not a Right Triangle!"
fi
