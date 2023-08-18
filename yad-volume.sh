#!/bin/bash

pipe=/tmp/volumepipe
vol="$(amixer get Master,0 | awk '{if (NR==5) print $4}' | tr "[|]" " " )"
#echo "plus $vol"
vol=$(echo $vol | tr "%" " ")
vol=$(echo $vol | tr -d " ")

yad --width=200 --scale --mouse --value=$vol --print-partial --close-on-unfocus --no-buttons --mark=75:75 --mark=100:100 --mark=0:0 > $pipe 

exit




pid=`cat /tmp/old_volum.pid`
kill $pid
echo $$ > /tmp/old_volum.pid

#ps -aux |grep sb-vol-yad | awk '{print $2}' | xargs kill 

export pipe=$(mktemp -u --tmpdir volume.XXXXXXXX)
mkfifo "$pipe"
#export rura=$(mktemp -u --tmpdir rurame.XXXXXXXX)
#mkfifo "$rura"
trap "rm -f $pipe $rura" exit

exec 3<> $pipe
#exec 3<> $rura

vol="$(amixer get Master,0 | awk '{if (NR==5) print $4}' | tr "[|]" " " )"
#echo "plus $vol"
vol=$(echo $vol | tr "%" " ")
vol=$(echo $vol | tr -d " ")

yad --width=200 --scale --mouse --value=$vol --print-partial --close-on-unfocus --no-buttons --mark=75:75 --mark=100:100 --mark=0:0 > $pipe & 

for i in {1..50}
do
   vol=$(head -1 $pipe)
   #echo $i :  $new > $rura
   amixer set Master $vol > /dev/null || exit

done

#exec 3>&-
#echo konoec
