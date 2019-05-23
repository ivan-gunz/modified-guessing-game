#! /usr/bin/env bash

###Defining Color codes
Color_Off='\033[0m'       # Text Reset
Red='\033[0;31m'          # Red
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue

echo -e "${Blue} \nThis File Guessing game is Written by **************** ivan-gunz *****************${Color_Off} \n"

num_of_files=$(ls | wc -l)

function your_guess {
    read -p "Please guess how many files are in this directory:   " guess
    while [ -z $guess ]   #This will test whether the user didn't enter anything ie len of guess is zero
    do
        your_guess
    done
}

your_guess  

while [ $guess -ne "$num_of_files" ]  #this is test whether the users guess is not equal the num of files in the directory
do
    if [ $guess -gt $num_of_files ]
    then
	echo -e "${Yellow}Sorry, Your guess is too high. Try again... \n ${Color_Off}"
    else [ $guess -lt $num_of_files ]
	echo -e "${Red}Sorry, Your guess is too low. Try again...\n ${Color_Off}"
    fi
    your_guess
done

if [ $guess -eq $num_of_files ]
then
    echo -e "${Blue} \nCONGRATULATIONS..!!! Your guess is correct ${Color_Off}"
    exit
else
    echo -e "${Red}\nSorry... I didnot understand your input. Please Check that your input is an integer and try again. ${Color_Off}"
fi
