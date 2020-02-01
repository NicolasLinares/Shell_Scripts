#! /urs/bin/bash -u
if  ! grep -q -w  $1 /etc/passwd
then
  echo El usuario $1 no existe >&2
  exit 1
fi


total=0

for v in $(ps aux | tail -n +2 | grep -w ^$1 | tr -s ' ' | cut -f6 -d ' ') 
do
  let total=total+v
done

echo $total KiB

