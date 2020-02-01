#! /usr/bin/bash -u

for d in "$@"
do
	if [ ! -d "$d" ]
	then  
		echo "Uso : $@ [directorio]..." >&2
		exit 1
	fi
done




for u in $(find "$@" -type f ! -user root \( ! -perm /400 -o ! -perm /100 -a -perm /011 \) -printf "%u\n"  | sort | uniq)
do
	echo $u:
	for d in $(find "$@" -type f -user $u \( ! -perm /400 -o ! -perm /100 -a -perm /011 \) -printf "%h\n" | sort | uniq )
	do
		echo "   $d:"
		find "$d" -maxdepth 1 -type f -user $u \( ! -perm /400 -o ! -perm /100 -a -perm /011 \) -printf "        %M %f\n"
	done
done
