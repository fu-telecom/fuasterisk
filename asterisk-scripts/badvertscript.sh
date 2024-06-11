BADVERTPA=/tmp/badvertpa.call

echo "" > $BADVERTPA
echo "Channel: Local/6666" >> $BADVERTPA
#echo "Channel: SCCP/0" >> $BADVERTPA
echo 'CallerID: "FUT" <0>' >> $BADVERTPA
echo "MaxRetries: 0" >> $BADVERTPA
echo "RetryTime: 150" >> $BADVERTPA
echo "WaitTime: 150" >> $BADVERTPA
echo "Context: default" >> $BADVERTPA
echo "Extension: badvertPA" >> $BADVERTPA
echo "Priority:1" >> $BADVERTPA
mv $BADVERTPA /var/spool/asterisk/outgoing/badvertpa.call

echo "Done"
