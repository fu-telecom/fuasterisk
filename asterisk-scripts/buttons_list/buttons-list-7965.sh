BUTTONS_FILE=/asterisk_scripts/buttons_list/buttons-list-7965.txt

echo "Writing 7965 Buttons List"

/asterisk_scripts/buttons_list/buttons-list-generator.sh 12 > $BUTTONS_FILE
echo "button = empty" >> $BUTTONS_FILE
echo "button = empty" >> $BUTTONS_FILE
echo "button = empty" >> $BUTTONS_FILE
echo "button = empty" >> $BUTTONS_FILE
echo "button = empty" >> $BUTTONS_FILE
echo "button = empty" >> $BUTTONS_FILE
echo "button = empty" >> $BUTTONS_FILE
echo "button = empty" >> $BUTTONS_FILE
echo "button = empty" >> $BUTTONS_FILE
echo "button = empty" >> $BUTTONS_FILE
echo "button = empty" >> $BUTTONS_FILE
echo "button = empty" >> $BUTTONS_FILE
/asterisk_scripts/buttons_list/buttons-list-generator.sh 24 13 >> $BUTTONS_FILE

