#!/bin/bash
echo “ choose the environment either LAX or IAD”
read DC
echo “ Enter the Host name “
read HOST_NAME
echo “Enter the serial number of the server “
read TAG
echo “ Enter the profile  of the server”
read PROFILE
if [ "$DC" = "IAD" ]; then
	ssh asu106 -l csadmin
	cd cobbling-time
	TAG=$TAG 
 	PROFILE=$PROFILE
 	 HOST_NAME=$HOST_NAME
 	 DC=$DC
fi

echo “Test completes”
