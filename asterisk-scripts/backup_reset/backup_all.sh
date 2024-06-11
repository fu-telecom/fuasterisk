if [ $# -lt 1 ] ; then
       echo "Please give name of backup folder, no spaces.."
       exit 127
fi

BACKUP_FOLDER=/asterisk_scripts/backup_reset/backups
TARGET_FOLDER=$1

DESTINATION=$BACKUP_FOLDER/$TARGET_FOLDER

mkdir $DESTINATION
mkdir $DESTINATION/directory

cp /tftproot/scripts/buttons-list.txt $DESTINATION
cp /tftproot/scripts/extensions-list.txt $DESTINATION

cp -R /var/www/html/directory $DESTINATION

cp /etc/asterisk/sccp-phones.conf $DESTINATION
cp /etc/asterisk/extensions-hints.conf $DESTINATION
cp /etc/asterisk/extensions-phones.conf $DESTINATION
cp /etc/asterisk/voicemail-phones.conf $DESTINATION


