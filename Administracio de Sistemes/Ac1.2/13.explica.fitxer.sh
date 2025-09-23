#! /bin/bash
clear
for planeta in "Jupiter 10" "Venus 30" "Saturn 15" "Mercuri 1" "Lluna" "Terra"
do
	if [ "$planeta" = Terra ];
	then
	break
	elif [ "$planeta" = Lluna ];
	then
	continue
	else
	echo "El planeta "$planeta"0.000.000 Km del Sol aproximadament."
	fi
done