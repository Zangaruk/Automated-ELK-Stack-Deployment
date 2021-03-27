#/!/bin/bash

awk -F" " '{print $(1) $(2),$(5),$(6)}' 0315_Dealer_schedule| grep '05:00:00AM\|08:00:00AM\|02:00:00PM' | cut -d " " -f2,3 | sort -b | uniq -c

