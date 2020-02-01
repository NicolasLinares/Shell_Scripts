#! /bin/bash -u

ConsumoRam=$(ps aux | tail -n +2 | tr -s ' ' | cut -f6 -d ' ' | sort -n | uniq)

for v in $ConsumoRam; do let Total=Total+v; done

echo $Total KiB

