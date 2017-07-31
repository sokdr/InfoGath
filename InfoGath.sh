#!/bin/bash
echo "#######################################################"
echo "#######################################################"
echo "############### Infogath Script v1.01 #################"
echo
read -p "Enter the FQDN you want to search for: " remote
echo
ping -c1 $remote >/dev/null 2>&1
if [ "$?" = 0 ] ;
then
	echo "#################################################"
	echo "#################################################"
	echo "IP address of the $remote: "
	echo
	host $remote 
	echo
	echo "#################################################"
	echo "#################################################"
	echo "WHOIS information: "
	echo
	whois $remote 
	echo
	echo "#################################################"
	echo "#################################################"
	echo "DiG information: "
	dig $remote
	echo
	echo "#################################################"
	echo "#################################################"
	echo "Checking HTTP Information: "
	echo
	curl -I -L $remote
	echo
	echo "#################################################"
	echo "#################################################"
	echo "Checking web technology: "
	echo
	whatweb $remote
	echo
	echo "#################################################"
	echo "#################################################"
	echo
	echo "#################################################"
	echo "#################################################"
	echo "Now checking SSL versions connections: "
	openssl s_client -connect $remote:443 -tls1_2
	echo
	openssl s_client -connect $remote:443 -tls1_1
	echo
	openssl s_client -connect $remote:443 -ssl3
	echo
	openssl s_client -connect $remote:443 -ssl2
	echo
	echo "################################################"
	echo "################################################"
	echo "Checking HTTP methods (POST, DELETE, TRACE, HEAD): "
	echo
	curl -v -X POST $remote
	echo
	curl -v -X DELETE $remmote
	echo
	curl -v -X TRACE $remote
	echo
	curl -v -X HEAD $remote
	echo
else
	echo "Wrong Input .....exiting"
fi	
exit 0
