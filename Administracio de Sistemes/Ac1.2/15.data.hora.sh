#!/bin/bash 
clear
echo -e "Data i hora actual:\n $(date)\n"
echo -e "------------------------\n"

echo -e "Qui esta conectat ara mateix:\n $(who)\n"
echo -e "------------------------\n"

echo -e "Qui s'ha estat conectant ultimament:\n $(last -n 5)\n"