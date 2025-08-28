#!/bin/bash

# (a) Create an empty file named aid_quizat
touch mid_quiz.txt

# (b) Change the permissions of aid_quizat so that
# the owner has read, write, and execute permissions,
# the group has read and execute permissions,
# and others have read-only access
chmod 754 mid_quiz.txt

# (c) Run man ls and take the first 10 lines of its output
# into aid_quizat using piping
man ls | head -n 10 > mid_quiz.txt

