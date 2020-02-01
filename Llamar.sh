#! /bin/bash -u
echo "Inicio del guión $0"
echo "El PID de $0 es $$"
echo "Llamando al guion 'num'"
./num.sh
resultado=$?
echo "El guion 'num' ha devuelto el valor $resultado"
echo "Fin del guion $0"
