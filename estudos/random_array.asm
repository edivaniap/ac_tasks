##############################################################################################
###                              @AUTHOR: Edivânia Pontes                                  ###
###                                 @DATE: 27/11/2019                                      ###
##############################################################################################

# PREENCHE ARRAY DE TAMANHO 10 COM NUMEROS RANDOMICOS DE 0 A 9

.data
	myArray: .space 40 # aloca espaço no random access memory
	
	msg1: .asciiz "*** preenchendo array com numeros aleatorios ***"
	msg2: .asciiz "\n*** array preenchido ***"
	msg3: .asciiz "\n >>> RESULTADO: Array A[] = {"
	msg4: .asciiz ", "
	msg5: .asciiz "}"
.text
	# index i real = $t0 (para acesso aos dados)
	addi, $t0, $zero, 0
	
	# index i auxiliar = $t1 (para impressao e condicao do loop)
	addi, $t1, $zero, 0
	
	# exibe mensagem 1
	li $v0, 4
	la $a0, msg1
	syscall
	
	loop_preencher:
		li $a1, 10  # define em $a1 o limite maximo
    		li $v0, 42  # gera o aleatorio (que fica salvo em $a0)
    		syscall
        	   						
		sw $a0, myArray($t0) # guarda o valor ($a0) no array
		
		# incrementa i para obter proximo indice
		addi, $t0, $t0, 4
		addi, $t1, $t1, 1
		
		# condicao do laco
		bne $t1, 5, loop_preencher
	
	# reinicia o indices
	addi, $t0, $zero, 0
	addi, $t1, $zero, 0
	
	# exibe mensagem 2
	li $v0, 4
	la $a0, msg2
	syscall
	
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
		
