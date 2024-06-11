#set -ex

EXTENSIONS_FILE="/asterisk_scripts/extensions-list.txt"
#EXTENSIONS_FILE_LENGTH=wc -l < $EXTENSIONS_FILE

EXTENSIONS_COUNT="0"
EXTENSIONS[0]="Extensions"
CURRENT_COUNT="1"

EXCLUDE_EXTENSION=$1

while read -r LINE || [[ -n "$LINE" ]]; do
	#If not Rangers/999, go ahead and add it to list of possible extensions.
	if [[ $LINE != "SCCP/999" ]] && [[ $LINE != $EXCLUDE_EXTENSION ]]
	then
	        EXTENSIONS_COUNT=$(($EXTENSIONS_COUNT + 1))
		EXTENSIONS[$EXTENSIONS_COUNT]=$LINE
	fi
done < "$EXTENSIONS_FILE"

RANDOM_LINE=$((1 + RANDOM % $EXTENSIONS_COUNT))
RANDOM_EXTENSION=${EXTENSIONS[$RANDOM_LINE]}

#Print random extension with no line break, or the dialplan will hate you.
printf "%s"  $RANDOM_EXTENSION

