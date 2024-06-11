#echo $1

IFS='/' read -ra SPLIT <<< "$1"

if [[ ${#SPLIT[@]} -eq 2 ]]
then
	printf "%s" ${SPLIT[1]}
fi
