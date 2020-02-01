#! /bin/bash -u


read a
read b

echo "a = $a"
echo "b = $b"

echo SUMA
let c=$a+$b
echo "El resultado de a + b es $c"

echo MULTIPLICACIÓN
let c=$a*$b
echo "El resultado de a * b es $c"

echo DIVISION
let c=$b/$a
echo "El resultado de b / a es $c"
let c=$a/$b
echo "El resultado de a / b es $c"

