#!/bin/bash
echo "#######################################################"
echo "#######################################################"
echo "################ InfoGath Script v1.00 ################"
echo
echo -n "Enter the FQDN/IP you want to search for: " 
read remote
echo
echo 
ping -c1 $remote >/dev/null 
if [ "$?" = 0 ]
then
	echo "#################################################"
	echo "IP address of the $remote: "  
	host $remote 
	echo
	echo "#################################################"
	echo "WHOIS information: "  
	whois $remote 
	echo
	echo "#################################################"
	echo "Checking HTTP Information:"
	curl -I -L $remote 
	echo
	echo "#################################################"
	echo "Checking Geolocation of the WebServer: "
	geoiplookup $remote 
	echo
	echo "#################################################"
	echo "Checking $remote  for Web technologies: "
	whatweb -v $remote
	echo
	echo "#################################################"
	read -p "Do you want to check network ranges for $remote ? [yn]" answer
	if [[ "$answer" =~ ^[Yy]$ ]];
	then
	 	echo "-------------------------------------------------"
		echo -n "Please enter the name/ip of the target host: (e.x google):: "
		read ripe
		whois -h whois.ripe.net $ripe 
	else [[ "$answer" =~ ^[Nn]$ ]];
	        echo "Exiting....script:"
	fi
else
	echo "$remote does not respond...exiting script: "
fi
exit 0;

