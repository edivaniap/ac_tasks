##############################################################################################
###                              @AUTHOR: Edivânia Pontes                                  ###
###                                 @DATE: 27/11/2019                                      ###
##############################################################################################

# GERA UM NUMERO ALEATORIO DE 0 A 999 (MIN DEFAULT = 0, MAX = 1000)
#
# CASO QUEIRA USAR UM LIMITE MINIMO É NECESSÁRIO RECALCULAR O NUMERO PASSADO AO LIMITE MAXIMO
# MAX = (VALOR_DESEJADO + 1) - MIN
# EXEMPLO: ALEATORIO DE 900 A 999 => (MIN = 900, MAX = 1000-MIN = 1000-900 = 100)
.text
    
    li $a1, 1000  # DEFINE EM $a1 O LIMITE MAXIMO
    li $v0, 42  # GERA O NUMERO ALEATORIO
    syscall
    
    # add $a0, $a0, 900  # DEFINE EM $a0 O LIMITE MINIMO
    
    li $v0, 1   # IMPRIME INTEGER
    syscall
    