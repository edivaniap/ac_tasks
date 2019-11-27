	.data
strR:	.asciiz "Raiz quadrada de X: "
strX:	.asciiz "Digite um valor para X: "
	.text
	.globl main

main:
	#Definindo os registradores
	li $t0, 1		# r = raiz quadrada
	li $t1, 2		# d
	li $t2, 4		# s
	
	#Imprimir strX
	li $v0, 4
	la $a0, strX
	syscall
	
	#receber o numero
	li $v0, 5
	syscall
	move $s0, $v0	# s0 = valor de x
	
laco:
	addi $t0, $t0, 1
	addi $t1, $t1, 2
	addi $t2, $t2, 1
	add $t2, $t2, $t1
	
	slt $t3, $s0, $t2	# se x < s, $t3 = 1 (oposto de t que seria 0)
	beq $t3, 0, laco	# se $t3 = 0 (t seria 1), rodar laco mais uma vez


	#Imprimir strR
	li $v0, 4
	la $a0, strR
	syscall
	
	#Imprimir a raiz
	li $v0, 1
	move $a0, $t0
	syscall

	#Encerrar
	li $v0, 10
	syscall

	