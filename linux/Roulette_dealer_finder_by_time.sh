#/!/bin/bash

#This is the main scipt you would run.
#Either you can enter a full time with AM or PM, but also you can enter just the hours if you want both instances of AM and PM.
read -p "Please enter specified time: 00:00:00AM/PM " times

./Roulette_dealer_finder_by_file.sh | grep -i $times | cut -d" " -f2,3 | sort -b | uniq -c
