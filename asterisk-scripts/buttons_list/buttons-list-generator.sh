#set -ex

if [ $# -lt 1 ]
then
	echo "Requires Parameters: <number of buttons> <optional start line number>"
	exit 127
fi

BUTTONSFILE='/asterisk_scripts/buttons_list/buttons-list.txt'
BUTTONMAX=$1
BUTTONLINE=0
BUTTONCOUNT=0
BUTTONSTART=$2

if [[ -z $BUTTONSTART ]]
then
	BUTTONSTART=1
fi

while read -r LINE || [[ -n "$LINE" ]]; do
	BUTTONCOUNT=$(($BUTTONCOUNT + 1))
	
	if [[ $BUTTONCOUNT -ge $BUTTONSTART ]]
	then
		BUTTONLINE=$(($BUTTONLINE + 1))

		if [[ $BUTTONLINE -le $BUTTONMAX ]]
		then
			echo $LINE	
		fi
	fi
done < "$BUTTONSFILE"

while [[ $BUTTONLINE -lt $BUTTONMAX ]]; do
	BUTTONLINE=$(($BUTTONLINE + 1))
	echo "button = empty"
done
