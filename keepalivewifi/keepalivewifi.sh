#!/bin/bash                                  
                                               
TESTIP=$(/sbin/ip route | awk '/default/ { print $3 }')

ping -c4 ${TESTIP} > /dev/null               
                                               
if [ $? != 0 ]                               
then                                         
    logger -t $0 "WiFi seems down, restarting"
    ifdown --force wlan0                     
    ifup wlan0                               
fi

