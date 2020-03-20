#!/bin/bash -x

echo "Weolcome to Gambler Simulator"

#constants
GOAL=0;
CHECKWALLETAMOUNT=0;

#variables
stackWallet=0;
bet=0;
amountWon=0;
amountLoss=0;
totalDays=0;
daysWon=0;
daysLoss=0;

# read value from user
read -p "Enter stack amount : " stackWallet
read -p "Enter goal amount : " GOAL
read -p "Enter bet : " bet

CHECKWALLETAMOUNT=$(($stackWallet/2))

while [[ $totalDays -lt 20 && $stackWallet -ge $CHECKWALLETAMOUNT && $stackWalletAmount -le $(($CHECHWALLETAMOUNT+$stackWallet)) ]]
do
	gamblerTurn=$((RANDOM%2))
	#0 for win and 1 for loose 

	if [ $gamblerTurn -eq 0 ]
	then
		stackWallet=$((stackWallet+bet))
		amountWon=$((amountWon+bet))
		((daysWon++))
	else
		stackWallet=$((stackWallet-bet))
		amountLoss=$((amountLoss+bet))
		((daysLoss++))
	fi
	((totalDays++))
done
echo "total days won : $daysWon"
echo "total days loss : $daysLoss"
