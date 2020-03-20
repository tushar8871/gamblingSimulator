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
totalDays=1;
maxAmount=0;
minAmount=0;
wonDay=1;
lossDay=1;
day=1;
wonday=0;
lossday=0;

#declaring array

declare -A wonDays
declare -A lossDays

#max function won and loss
function maxWonDay(){
	local largest=$1;
	for (( day=1;$day<$2; day++ ))
	do
		if [[ ${wonDays[$day]} -gt $largest ]]
		then
			largest=${wonDays[$day]};
			wonday=$day;
		fi
	done
	echo $wonday
}

function maxLossDay(){
	local largest=$1;
	for (( day=1;$day<$2; day++ ))
	do
		if [[ ${lossDays[$day]} -gt $largest ]]
		then
			largest=${lossDays[$day]};
			lossday=$day;
		fi
	done
	echo $lossday
}

# read value from user
read -p "Enter stack amount : " stackWallet
read -p "Enter goal amount : " GOAL
read -p "Enter bet : " bet

CHECKWALLETAMOUNT=$(($stackWallet/2))
while [[ $totalDays -le 20 ]]
do
	amountWon=0;
	amountLoss=0;
	stackWallet=100;
	while [[ $stackWallet -gt $CHECKWALLETAMOUNT && $stackWallet -lt $((50+100)) ]]
	do
		gamblerTurn=$((RANDOM%2))
		#0 for win and 1 for loose 

		if [ $gamblerTurn -eq 0 ]
		then
			stackWallet=$((stackWallet+bet))
			amountWon=$((amountWon+bet))
		else
			stackWallet=$((stackWallet-bet))
			amountLoss=$((amountLoss+bet))
		fi
	done
	wonDays[$wonDay]=$amountWon
	((wonDay++))
	lossDays[$lossDay]=$amountLoss
	((lossDay++))
	((totalDays++))
done

luckDay=$( maxWonDay ${wonDays[1]} $wonDay )
unluckDay=$( maxLossDay ${lossDays[1]} $lossDay )

echo "Luckiest day : $luckDay"
echo "Unluckiest day : $unluckDay"
