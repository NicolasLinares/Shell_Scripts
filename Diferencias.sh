#! /usr/bin/bash -u

[ 1 = 001 ] # verdadero porque 1 es lo mismo que 001 numéricamente
echo $?

[ 1 -eq 001 ] #no son iguales porque las cadenas no son iguales
echo $?
