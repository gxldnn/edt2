#! /bin/bash
clear
for planeta in "Jupiter 10" "Venus 30" "Saturn 15" "Mercuri 1" "Lluna" "Terra"
do
	if [ "$planeta" = Terra ]; then
		break
	elif [ "$planeta" = Lluna ]; then
		continue
	else
		echo "El planeta "$planeta"0.000.000 Km del Sol aproximadament."
	fi
done

# Tenim un llistat de planetas en el que amb un for el recorrem amb la variable planeta i tenim varies condicions, 
#la primera diu que si la variable passa per “Terra” l’escript acaba, si pasa per lluna, continua, y per cada variable 
#ens dira el nom del planeta amb el seu numero junt amb els 0
