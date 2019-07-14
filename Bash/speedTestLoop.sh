#!/bin/bash 


#This script won't use build in csv feature of speedtest-cli
#The script will use speedtest-cli to test download and uploads speeds and t creates a csv file with the following data: Date, time, download and upload speeds.


#the func will measure the speed and print the relevant info to CSV
speedTest()
{
	speedInfo=`speedtest | egrep "Download|Upload"`
	date=`date +"%D"`
	time=`date +"%T"`
	download=`echo $speedInfo | awk '{ print $2 }'`
	upload=`echo $speedInfo | awk '{ print $5 }'`
	echo "$date, $time, $download, $upload"
}

if [ $# -ne 2 ] #we should get 2 arguments
then 
	echo "wrong amount of arguments passed"
	exit
fi

count=$1 #how many lines to create
interval=$2 #number of seconds to wait between each call

echo "date, time, download, upload" #create header

if [ $count -eq 0 ] #the script will run infinitely
then 
	while [ 1 == 1 ]
	do
		speedTest
		sleep $2
	done
fi

if [ $count -lt 0 ] 
then
	echo "wrong line amount - should be 0 or greater"
	exit
fi

for (( i=0; i<$count; i++ ))
do
	speedTest
	sleep $2
done
