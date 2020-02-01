#! /bin/bash -u

echo Escribe el número de archivos .txt que quieras crear:
read j

i=1
let j=$j+1
while test $i -ne $j
do
	touch "archivo$i.txt"
	let i=$i+1
done


