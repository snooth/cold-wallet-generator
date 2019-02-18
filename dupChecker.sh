#!/bin/sh

FILE=$1

awk 'a[$0]++{print "\n\n There are duplicate wallet entries \n\n"; exit(1)}' $FILE && echo "\n\n There are no dupicate wallet entries!! \n\n"
