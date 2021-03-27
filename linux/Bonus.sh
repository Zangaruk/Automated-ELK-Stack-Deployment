#/!/bin/bash


read -p "Please input filename: " filename
read -p "Please input game type: (Blackjack is g1 Roulette is g2 Roulette is g3) " game
#For the below read -p command you can enter the full 00:00:00am/pm if you want exact time or you can put 00 for both AM/PM
#Also enter at least 2 diffrent times or the program will fail
read -p "Please input two to four times: " time1 time2 time3 time4

function setDealer {
	if [ $game == "g1" ]; then
		Dealer= awk -F" " '{print $1$2,$3,$4}' $filename
	elif [ $game == "g2" ]; then
		Dealer= awk -F" " '{print $1$2,$5,$6}' $filename
	elif [ $game == "g3" ]; then
		Dealer= awk -F" " '{print $1$2,$7,$8}' $filename
	else
		echo "not a valid input"
		exit
	fi
	echo $Dealer
}

function setTimes {
	Times= setDealer | grep -i -e $time1 -e $time2 -e $time3 -e $time4 | cut -d" " -f2,3 | sort -b | uniq -c
	echo $Times
}

setTimes


