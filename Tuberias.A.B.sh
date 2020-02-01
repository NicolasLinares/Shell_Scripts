#! /bin/bash -u

#A)

ps aux | tail -n +2 | sort -k1,1 -k6,6nr

echo 
echo

#B)

ps aux | tail -n +2 | tr -s ' ' |  cut -d' ' -f1,2,6,11  |  sort -t' ' -k1,1 -k3,3nr | column -t | uniq -w 5


