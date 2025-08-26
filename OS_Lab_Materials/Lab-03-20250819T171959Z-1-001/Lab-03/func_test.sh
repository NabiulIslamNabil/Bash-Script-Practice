#!/bin/bash

touch_perm () {
	touch $1
	chmod $2 $1
}

touch_perm $1 $2
echo "Executing $0 with $# args"
