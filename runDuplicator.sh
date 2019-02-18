#!/bin/sh

PUBLIC="xxx"
SECRET="xxx"


NUMBEROFRUNS=1000000 

echo "Public Key: "$PUBLIC
echo "Secret Key: "$SECRET

i=1
while [ $i -le $NUMBEROFRUNS ]
do
	#ripple-wallet-cli generate | awk '/Public/{print $3}' >> newWallet
	ripple-wallet-cli generate | awk '/Public/{print $3}/Wallet/{print $3}' | sed '2,3!d' >> newWallet 
	i=$(( i+1 ))
done	

if grep -qF "$PUBLIC" newWallet;then
   echo "Public key FOUND!!!"
else
   echo "Public key NOT found!!!!"
fi

if grep -qF "$SECRET" newWallet;then
   echo "Secret key FOUND!!!"
else
   echo "Secret key NOT found!!!!"
fi
