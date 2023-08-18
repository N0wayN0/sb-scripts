#!/bin/bash

# dziala w tle i odczytuje wartosci wysylane przez yad volume
# musi byc uruchomiony z xinit.rc

rm /tmp/volumepipe 2>/dev/null
pipe=/tmp/volumepipe
mkfifo "$pipe"
trap "rm -f $pipe" EXIT

for i in {1..500}
do
   vol=$(head -1 $pipe)
   #echo $i :  $new
   amixer set Master $vol > /dev/null   2>/dev/null

done
