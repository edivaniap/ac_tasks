	.data
strP:	.asciiz "Temperatura permitida - $s1 = "
strNP:	.asciiz "Temperatura NAO permitida - $s1 = "
strAsk:	.asciiz "Informe a temperatura: "
	.text
	.globl main

main:
	#Imprimir strAsk
	li $v0, 4
	la $a0, strAsk
	syscall
	
	#receber o int
	li $v0, 5
	syscall
	move $s0, $v0	# s0 = temperatura
	
	
	# verificar se 20 <= temperatura <= 40
	beq $s0, 20, permitido	#esta dentro do intervalo
	beq $s0, 40, permitido	#esta dentro do intervalo
	
	li $t1, 20
	slt $t0, $t1, $s0	# se 20 < temp, t0 = 1, else t0 = 0
	beq $t0, 0, nao_permitido
	
	li $t1, 40
	slt $t0, $s0, $t1	# se temp < 40, t0 = 1, else t0 = 0
	beq $t0, 0, nao_permitido
	
permitido:
	li $s1, 1
	
	#Imprimir strP
	li $v0, 4
	la $a0, strP
	syscall
	
	j terminar
	
nao_permitido:
	li $s1, 0
	
	#Imprimir strNP
	li $v0, 4
	la $a0, strNP
	syscall
	
terminar:
	#Imprimir s1
	li $v0, 1
	move $a0, $s1
	syscall
	
	#Encerrar
	li $v0, 10
	syscall