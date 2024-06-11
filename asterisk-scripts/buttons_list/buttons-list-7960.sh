BUTTONS_FILE=/asterisk_scripts/buttons_list/buttons-list-7960.txt

echo "Writing Buttons File"

/asterisk_scripts/buttons_list/buttons-list-generator.sh 28 > $BUTTONS_FILE

/asterisk_scripts/buttons_list/buttons-list-generator.sh 28
