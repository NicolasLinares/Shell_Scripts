#! /bin/bash -u
echo Escribe dos números para comparar:
read a
read b

echo

if test $a -eq $b 
then
       	echo "$a es igual a $b" 
else 
	echo "$a no es igual a $b"
fi


if test $a -lt $b
then
        echo "$a es menor a $b"
else
        echo "$a no es menor a $b"
fi


if test $a -gt $b
then
        echo "$a es mayor a $b"
else
        echo "$a no es mayor a $b"
fi

