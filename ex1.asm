	.data
strF:	.asciiz "Resultado de f: "
strK:	.asciiz "Digite um valor para k: "
strI:	.asciiz "Valor invalido, tente valores de 0 a 3"
	.text
	.globl main

main:
	#Definindo os registradores para g, h, i, j
	li $s0, 20		# g = $s0
	li $s1, 67		# h = $s1
	li $s2, 16		# i = $s2
	li $s3, 32		# j = $s3
	
	
	#Imprimir strK
	li $v0, 4
	la $a0, strK
	syscall
	
	#receber o numero do terminal
	li $v0, 5
	syscall
	move $t0, $v0
	
	#Operacao switch
	beq $t0, $zero, C0
	beq $t0, 1, C1
	beq $t0, 2, C2
	beq $t0, 3, C3
	
	#Imprimir strI
	li $v0, 4
	la $a0, strI
	syscall
	j exit

C0:
	add $t1, $s2, $s3	# f = i + j
	j result

C1:
	add $t1, $s0, $s1	# f = g + h
	j result

C2:
	sub $t1, $s0, $s1	# f = g - h
	j result
	
C3:
	sub $t1, $s2, $s1	# f = i - h
	j result
	
result:
	#Imprimir strF
	li $v0, 4
	la $a0, strF
	syscall
	
	#Imprimir o f
	li $v0, 1
	move $a0, $t1
	syscall

exit:	
	#Encerrar
	li $v0, 10
	syscall
