#/!/bin/bash

read -p "Please enter filename: (filename)" filename
read -p "Please enter Game of Dealer: (Blackjack is g1, Roulette is g2, Texas Hold is g3)" game

function setDealer() {
	if [ $game == "g1" ]; then
		Dealer= awk -F" " '{print $(1)$(2),$(3),$(4)}' $filename
	elif [ $game == "g2" ]; then
		Dealer= awk -F" " '{print $(1)$(2),$(5),$(6)}' $filename
	elif [ $game == "g3" ]; then
		Dealer= awk -F" " '{print $(1)$(2),$(7),$(8)}' $filename
	else
		echo "not valid" 
		exit
	fi
}

setDealer
echo $Dealer
