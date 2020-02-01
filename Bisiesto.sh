#! /bin/bash -u

GuardoParaQueNoAparezcaEnPantalla=$(cal 2 $1 | grep 29)
echo $?
