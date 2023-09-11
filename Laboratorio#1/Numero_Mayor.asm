.data
num1: .asciiz "Ingresa el primer numero: "
num2: .asciiz "Ingresa el segundo numero: "
num3: .asciiz "Ingresa el tercer numero: "
numMayor: .asciiz "El numero Mayor es: "

.text
.globl main

main:
    # solicita el primer numero y lo almacena
    li $v0, 4
    la $a0, num1
    syscall
    li $v0, 5
    syscall
    move $t0, $v0

    # Solicita el segundo numero y lo almacena
    li $v0, 4
    la $a0, num2
    syscall
    li $v0, 5
    syscall
    move $t1, $v0

    # Solicita  el tercer número y lo almacena
    li $v0, 4
    la $a0, num3
    syscall
    li $v0, 5
    syscall
    move $t2, $v0

    # Encuentra el número mayor
    move $t3, $t0
    blt $t3, $t1, else
    j mayor

else:
    move $t3, $t1

mayor:
    blt $t3, $t2, else2
    j imprimir_mayor

else2:
    move $t3, $t2

imprimir_mayor:
    # Imprime el numero mayor
    li $v0, 4
    la $a0, numMayor
    syscall

    li $v0, 1
    move $a0, $t3
    syscall

    # Fin del programa
    li $v0, 10
    syscall
