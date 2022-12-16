#!/bin/bash

echo 'exporting GPIO SIMSELECT'
echo $WB_GPIO_GSM_SIMSELECT > /sys/class/gpio/export
echo out > /sys/class/gpio/gpio$WB_GPIO_GSM_SIMSELECT/direction

echo 'blinking simselect'
while [ 1 ]
do
        echo 1 > /sys/class/gpio/gpio$WB_GPIO_GSM_SIMSELECT/value 
        echo 0 > /sys/class/gpio/gpio$WB_GPIO_GSM_SIMSELECT/value
done

