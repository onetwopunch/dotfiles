#!/bin/bash
echo "This will wipe the Yubikey and restore to factory settings" 
read -p "Are you sure? (y/n)" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
cat << EOF > /tmp/ykreset.txt
/hex
scd serialno
scd apdu 00 20 00 81 08 40 40 40 40 40 40 40 40
scd apdu 00 20 00 81 08 40 40 40 40 40 40 40 40
scd apdu 00 20 00 81 08 40 40 40 40 40 40 40 40
scd apdu 00 20 00 81 08 40 40 40 40 40 40 40 40
scd apdu 00 20 00 83 08 40 40 40 40 40 40 40 40
scd apdu 00 20 00 83 08 40 40 40 40 40 40 40 40
scd apdu 00 20 00 83 08 40 40 40 40 40 40 40 40
scd apdu 00 20 00 83 08 40 40 40 40 40 40 40 40
scd apdu 00 e6 00 00
scd apdu 00 44 00 00
/echo card has been reset to factory defaults
EOF
	gpg-connect-agent < /tmp/ykreset.txt
	rm /tmp/ykreset.txt
	echo "Now remove your Yubikey, wait a few seconds and plug it back in. I'll wait"
	sleep 5
	echo "Yubikey has been successfully reset."
  echo "The factory default PINs are 123456 (user) and 12345678 (admin)."
fi
