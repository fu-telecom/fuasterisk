echo "" > /tmp/badvertpa.call
echo "Channel: local/726366@default"  >> /tmp/badvertpa.call
echo 'CallerID: "FUT Sales Dept" <1>' >> /tmp/badvertpa.call
echo "MaxRetries: 5" >> /tmp/badvertpa.call
echo "RetryTime: 15" >> /tmp/badvertpa.call
echo "WaitTime: 15" >> /tmp/badvertpa.call
echo "Context: default" >> /tmp/badvertpa.call
echo "Extension: badvertPA" >> /tmp/badvertpa.call
echo "Priority:1" >> /tmp/badvertpa.call
mv /tmp/badvertpa.call /var/spool/asterisk/outgoing/badvertpa.call



echo "Done"





