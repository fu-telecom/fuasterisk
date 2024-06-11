#set -ex

EXTENSIONS_FILE="/asterisk_scripts/extensions-list.txt"
FILENAME=/tmp/masscall.call
#CALLER=$1



while read -r LINE || [[ -n "$LINE" ]]; do
        #If not Rangers/999, go ahead and add it to list of possible extensions.
#        if [[ $LINE != "SCCP/999" ]]
#        then

echo $LINE
echo "" > $FILENAME
echo -n "channel: $LINE" >> $FILENAME
echo "/aa1w/ringer=silent" >> $FILENAME
#echo "Channel: sccp/0" >> $FILENAME
echo "application: MP3Player" >> $FILENAME     
echo "data: /var/lib/asterisk/sounds/morningtrain.mp3" >> $FILENAME
mv $FILENAME /var/spool/asterisk/outgoing/masscall.call
#sleep 1

      #  fi
done < "$EXTENSIONS_FILE"


