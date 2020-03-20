#!/bin/bash -x

echo "Weolcome to Gambler Simulator"

#constants
GOAL=0;
CHECKWALLETAMOUNT=0;

#variables
stackWallet=0;
bet=0;

read -p "Enter stack amount : " stackWallet
read -p "Enter goal amount : " GOAL
read -p "Enter bet : " bet

CHECKWALLETAMOUNT=$(($stackWallet/2))

while [[ $stackWallet -ge $CHECKWALLETAMOUNT && $stackWalletAmount -le $(($CHECHWALLETAMOUNT+$stackWallet)) ]]
do
	gamblerTurn=$((RANDOM%2))
	#0 for win and 1 for loose 

	if [ $gamblerTurn -eq 0 ]
	then
		stackWallet=$((stackWallet+bet))
	else
		stackWallet=$((stackWallet-bet))
	fi
done
