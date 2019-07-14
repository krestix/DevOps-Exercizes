#!/bin/bash

#the script take two arguments, file extention and file directory, the script change all the files in the directory to have the extention of the given argument.

if [ "$#" -ne 2 ] #check if we get 2 arguments
then 
	echo "The function should get two variables"
	exit
fi

if [ ! -d "$2" ] #check if the given directory exists 
then 
	echo "The given directory don't exists"
	exit
fi

cd $2 #change directory

for f in file*; do #run over all files starts with "file"
    if [ "$f" !=  "${f%.*}.$1" ] #check that new file name will be different from the prev.
    then
		mv -- "$f" "${f%.*}.$1"
    else
		echo "the file $f already exists, the extention hadn't changed"
    fi
	
done
