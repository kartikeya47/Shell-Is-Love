#!/bin/sh

i=1	#loop variable
while read line     #while loop iterates over each line(names) of the input file
do
	mkdir $line	#making directories with the same names as student names
	i=$(($i+1))	#loop variable incrementing by 1
done < inputfile.txt	#taking names as input from the input file

j=1	#loop variable
while read line     #while loop iterates over each line(names) of the input file
do
	touch $line.sh     #making shell files with the same names as that of the students
	echo '#!/bin/bash' >> $line.sh     #appending the hashbang statement in each shell file
	echo 'echo' $line >> $line.sh     #appending the command to display students names from each shell file
	chmod u+x $line.sh	#changing all shell files to executable
	sh $line.sh	#running each shell file to display student names
	mv $line.sh $line	#moving the shell files to thier respective directories
	i=$(($j+1))	#loop variable incrementing by 1
done < inputfile.txt	#taking names as input from the input file
ls