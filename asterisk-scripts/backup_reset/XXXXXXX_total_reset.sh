#if [ $# -lt 1 ] ; then
#	echo "Please give name of backup folder, no spaces.." 
#	exit 127
#fi

#exit 127

rm buttons-list.txt
touch buttons-list.txt

./buttons-list-7960.sh
./buttons-list-7965.sh

rm extensions-list.txt
touch extensions-list.txt

cp /var/www/html/directory/FUTcorpdirectory.xml.empty /var/www/html/directory/FUTcorpdirectory.xml
cp /var/www/html/directory/campdirectory.xml.empty /var/www/html/directory/campdirectory.xml
cp /var/www/html/directory/departmentdirectory.xml.empty /var/www/html/directory/departmentdirectory.xml
cp /var/www/html/directory/payphonedirectory.xml.empty /var/www/html/directory/payphonedirectory.xml
cp /var/www/html/directory/PAdirectory.xml.empty /var/www/html/directory/PAdirectory.xml
cp /var/www/html/directory/artcarsdirectory.xml.empty /var/www/html/directory/artcarsdirectory.xml

rm /etc/asterisk/sccp-phones.conf
touch /etc/asterisk/sccp-phones.conf

rm /etc/asterisk/extensions-phones.conf
touch /etc/asterisk/extensions-phones.conf

rm /etc/asterisk/voicemail-phones.conf
touch /etc/asterisk/voicemail-phones.conf


