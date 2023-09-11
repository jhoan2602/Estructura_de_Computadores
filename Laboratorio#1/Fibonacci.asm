.data
limite: .asciiz "Ingrese el limite de la secuencia: "
salida: .asciiz "La secuencia de Fibonacci es: "
espacio: .asciiz " "

.text
.globl main

main:
    # Solicita el limite al usuario y lo almacena en $t0
    li $v0, 4
    la $a0, limite
    syscall
    li $v0, 5
    syscall
    move $t0, $v0

    # Inicializa los dos primeros numeros de la secuencia en $t1 y $t2
    li $t1, 0 
    li $t2, 1 

    # Imprime el mensaje de salida
    li $v0, 4
    la $a0, salida
    syscall

    # Imprime el primer numero
    li $v0, 1
    move $a0, $t1
    syscall

    # Imprime un espacio
    li $v0, 4
    la $a0, espacio
    syscall

    # Comprueba si el limite es mayor que el primer numero
    bgt $t0, $t1, loop

    # Fin del programa
    li $v0, 10
    syscall

loop:
    # Imprime el segundo numero
    li $v0, 1
    move $a0, $t2
    syscall

    # Imprime un espacio
    li $v0, 4
    la $a0, espacio
    syscall

    # Calcula el siguiente numero de la secuencia sumando los dos anteriores
    add $t3, $t1, $t2 

    # Actualiza los dos numeros anteriores con el segundo y el tercero
    move $t1, $t2 
    move $t2, $t3 

    # Comprueba si el limite es mayor que el segundo numero
    bgt $t0, $t2, loop

    # Fin del programa
    li $v0, 10
    syscall

