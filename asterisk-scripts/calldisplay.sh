#set -ex

FILENAME="/var/www/html/activecalls.txt"


while true ; do

	echo "" > test
	/usr/sbin/asterisk -vvvvvrx 'core show channels count' > $FILENAME
	sleep 1
done
