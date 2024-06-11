#set -ex

EXTENSIONS_FILE="/asterisk_scripts/extensions-list.txt"
FILENAME=/tmp/masscall.call
CALLER=$1



while read -r LINE || [[ -n "$LINE" ]]; do
	#If not Rangers/999, go ahead and add it to list of possible extensions.
	if [[ $LINE != "SCCP/999" ]]
	then


echo "" > $FILENAME
echo "Channel: $LINE" >> $FILENAME
#echo "Channel: SCCP/0" >> $FILENAME
echo 'CallerID: "RANGER ALERT" <0>' >> $FILENAME
echo "MaxRetries: 2" >> $FILENAME
echo "RetryTime: 60" >> $FILENAME
echo "WaitTime: 150" >> $FILENAME
echo "Context: default" >> $FILENAME
echo "Extension: masscall" >> $FILENAME
echo "Priority:1" >> $FILENAME
mv $FILENAME /var/spool/asterisk/outgoing/masscall.call
sleep 15

	fi
done < "$EXTENSIONS_FILE"


#send call to PAs (hardcoded, bypasses PA disabling)
echo "" > $FILENAME
echo "Channel: SIP/pager6" >> $FILENAME
echo 'CallerID: "RANGER ALERT" <0>' >> $FILENAME
echo "MaxRetries: 0" >> $FILENAME
echo "RetryTime: 160" >> $FILENAME
echo "WaitTime: 150" >> $FILENAME
echo "Context: default" >> $FILENAME
echo "Extension: masscall" >> $FILENAME
echo "Priority:1" >> $FILENAME
mv $FILENAME /var/spool/asterisk/outgoing/masscall.call

sleep 30

echo "" > $FILENAME
echo "Channel: SIP/pager35" >> $FILENAME
echo 'CallerID: "RANGER ALERT" <0>' >> $FILENAME
echo "MaxRetries: 0" >> $FILENAME
echo "RetryTime: 160" >> $FILENAME
echo "WaitTime: 150" >> $FILENAME
echo "Context: default" >> $FILENAME
echo "Extension: masscall" >> $FILENAME
echo "Priority:1" >> $FILENAME
mv $FILENAME /var/spool/asterisk/outgoing/masscall.call

sleep 30

echo "" > $FILENAME
echo "Channel: SIP/pager36" >> $FILENAME
echo 'CallerID: "RANGER ALERT" <0>' >> $FILENAME
echo "MaxRetries: 0" >> $FILENAME
echo "RetryTime: 160" >> $FILENAME
echo "WaitTime: 150" >> $FILENAME
echo "Context: default" >> $FILENAME
echo "Extension: masscall" >> $FILENAME
echo "Priority:1" >> $FILENAME
mv $FILENAME /var/spool/asterisk/outgoing/masscall.call

sleep 30

echo "" > $FILENAME
echo "Channel: SIP/listener12" >> $FILENAME
echo 'CallerID: "RANGER ALERT" <0>' >> $FILENAME
echo "MaxRetries: 0" >> $FILENAME
echo "RetryTime: 160" >> $FILENAME
echo "WaitTime: 150" >> $FILENAME
echo "Context: default" >> $FILENAME
echo "Extension: masscall" >> $FILENAME
echo "Priority:1" >> $FILENAME
mv $FILENAME /var/spool/asterisk/outgoing/masscall.call

sleep 30

# Calls originating phone so they know it's done sending this message.

echo "" > $FILENAME
echo "Channel: Local/$CALLER" >> $FILENAME
echo 'CallerID: "RANGER ALERT" <0>' >> $FILENAME
echo "MaxRetries: 2" >> $FILENAME
echo "RetryTime: 60" >> $FILENAME
echo "WaitTime: 150" >> $FILENAME
echo "Context: default" >> $FILENAME
echo "Extension: masscall" >> $FILENAME
echo "Priority:1" >> $FILENAME
mv $FILENAME /var/spool/asterisk/outgoing/masscall.call

