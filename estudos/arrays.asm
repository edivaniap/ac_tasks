.data
	# random access memory - ram
	# são blocos contíguos de memória
	# ram é similar ao array
	myArray: .space 20 # aloca espaço no random access memory
			   # array de int de tamanho 5 (tam_int * tam_array = 4 bytes * 5)
	
	msg1: .asciiz "Insira um valor para A["
	msg2: .asciiz "]: "
	msg3: .asciiz "\n >>> Array A[] = {"
	msg4: .asciiz ", "
	msg5: .asciiz "}"
.text
	# index i real = $t0 (para acesso aos dados)
	addi, $t0, $zero, 0
	
	# index i auxiliar = $t1 (para impressao e condicao do loop)
	addi, $t1, $zero, 0
	
	loop_ler:
		# exibe mensagem 1
		li $v0, 4
		la $a0, msg1
		syscall
		
		# exibe indice auxiliar
		li $v0, 1
		move $a0, $t1
		syscall
		
		# exibe mensagem 2
		li $v0, 4
		la $a0, msg2
		syscall
		
		# recebe o numero
		li $v0, 5
		syscall
		move $s0, $v0 # s0 = auxiliar para guardar o int
		
		sw $s0, myArray($t0) # guarda o valor no array
		
		# incrementa i para obter proximo indice
		addi, $t0, $t0, 4
		addi, $t1, $t1, 1
		
		# condicao do laco
		bne $t1, 5, loop_ler
	
	# reinicia o indices
	addi, $t0, $zero, 0
	addi, $t1, $zero, 0
	
	# exibe mensagem 3
	li $v0, 4
	la $a0, msg3
	syscall
	
	loop_exibir:
		lw $s0, myArray($t0) # carrega o dado[i] no registrador auxiliar
		
		# exibe o dado
		li $v0, 1
		move $a0, $s0
		syscall
		
		# se nao for o ultimo imprime chave, senao virgula
		ble $t1, 3, virgula
		
		# exibe a chave - mensagem 4
		li $v0, 4
		la $a0, msg5
		syscall
		
		j fim_loop #pula pro fim do loop para nao imprimir virgula
		
		virgula: 
			# exibe a virgula - mensagem 4
			li $v0, 4
			la $a0, msg4
			syscall
			
		fim_loop:	
		# incrementa i para obter proximo indice
		addi, $t0, $t0, 4
		addi, $t1, $t1, 1
		
		# condicao do laco
		bne $t1, 5, loop_exibir
		
	# encerrar
	li $v0, 10
	syscall
		
