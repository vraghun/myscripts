echo "enter the value"
read p
if [ p == dev ]
then
	x=dev
elif [ p == prd ]
then
	x=prd
else

	echo "Proper profile names: dev or prod"
fi
