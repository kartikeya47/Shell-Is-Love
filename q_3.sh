#!/bin/bash

echo "Enter a Five Digit Number: "	#Displaying message for the user to enter a 5-digit Number
read var	#reading user's input as a string

c=0     #counter variable to count the number of occurences

if [ ${#var} != "5" ]     #checking if the number has 5-digits or not
then
	echo "Invalid Number! Type in a 5-digit Number."	#prompting if the number does not have 5-digits
else
	second="${var:1:1}"	#extracting the 2nd Digit of the Number
	for (( i=0; i<${#var}; i++ ))     #looping through all the digits of the number
	do
		if [ "${var:i:1}" == ${second} ]	#checking if a digit equal to the 2nd digit is present or not
		then
			c=$(($c + 1))     #if present, then the counter is incremented
		fi
	done
	echo "Number of occurences are: $((c))"	#at last the number of occurences are displayed to the user
fi
