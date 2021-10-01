#!/bin/bash

#Creating a directory and creating files with different extensions in it
mkdir files
touch hello.c hello.sh hello.txt bye.txt
mv hello.c files
mv hello.sh files
mv hello.txt files
mv bye.txt files

ls files/ > files.txt     #printing all the file names in a dummy file, files.txt

touch c.txt	#creating file to store all .c extension files
touch sh.txt	#creating file to store all .sh extension files
touch text.txt	#creating file to store all .txt extension files

i=1	#loop variable
while read line     #iterating over all the lines of the dummy file
do
	file=$line	#each line(filename) of the dummy file is stored in the variable named file
	exten=${file##*.}	#extension of each file is stored in the variable, exten
	if [ $exten == "c" ]     #condition to check whether file has a particular extension(.c) or not
	then
		echo $line >> c.txt
	elif [ $exten == "sh" ]     #condition to check whether file has a particular extension(.sh) or not
	then
		echo $line >> sh.txt
	else     #condition for .txt files
		echo $line >> text.txt
	fi
	i=$(($i + 1))     #loop variable incrementing
done < files.txt	#taking input from the dummy file
rm files.txt     #removing the dummy file at the end

#Dispalying the contents of all the newly created files
echo "Files with .c"
cat c.txt
echo "Files with .sh"
cat sh.txt
echo "Files with .txt"
cat text.txt
