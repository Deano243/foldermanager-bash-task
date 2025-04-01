#!/bin/bash
#go line by line and print the txt in file 
checkfile=$1
if [[ ! -f "$checkfile" ]]; then
	echo "not found"
fi
while read -r line; do
	echo "$line"
done < "$checkfile"
#return word number,line number and complete file size
word_number=$(wc -w $checkfile)
line_number=$(wc -l $checkfile)
file_size=$(du -h $checkfile)
echo "number of words is $word_number,number of line is $line_number and file size is $file_size"
