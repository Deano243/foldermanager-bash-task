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
#search function search word in the file
search_file() {
	read -p "type the word that you want to search" word
	word_position=0
	found=false
	while read -r line; do
		for w in $line; do
			((word_position++))
			if [[ "$w" == "$word" && "$found" == false ]]; then
				found=true
				found_at=$word_position
			fi
		done
	done < "$checkfile"
	
	if $found; then
		echo "true we found the word $word at word number $found_at"
	else
	echo "failed"
	fi
}

search_file
