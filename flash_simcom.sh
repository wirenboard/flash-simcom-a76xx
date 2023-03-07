#!/bin/bash

echo 'stopping ModemManager'
systemctl stop ModemManager || true

echo 'switching modem off'
systemctl stop wb-gsm || true

echo 'press enter while you will be ready to proceed'
read a

echo 'starting blinking'
sh /usr/bin/blink_simcom.sh &
BLINK_PID=$!
echo 'blink process is '$BLINK_PID

echo 'switching modem power on'
echo 1 > /sys/class/gpio/gpio$WB_GPIO_GSM_POWER/value #5v on!
sleep 1
echo 'touching modem powerkey'
echo 1 > /sys/class/gpio/gpio$WB_GPIO_GSM_PWRKEY/value #gsm pwrkey on
sleep 0.5
echo 0 > /sys/class/gpio/gpio$WB_GPIO_GSM_PWRKEY/value #gsm pwrkey off

kill $BLINK_PID
