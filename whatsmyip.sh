#!/bin/bash
# Get external IP address, compare it with previous value, do something if different. 
MYLASTIP=`tail -n 1 /tmp/myip.txt`
echo My last IP address was $MYLASTIP
MYIP=`dig TXT +short o-o.myaddr.l.google.com @ns1.google.com | awk -F '"' '{print $2}'`
echo My IP address is $MYIP
if [ "$MYLASTIP" = "$MYIP" ]; then
    echo IP address unchanged
    echo Your URL is http://"$MYIP":port
else
    echo IP address changed
    echo `date` >> /tmp/myip.txt
    echo "$MYIP" >> /tmp/myip.txt
    # do something like send an email with updated IP address
    echo Your URL is http://"$MYIP":port
    
fi
