# Calculadora Foda
.data
	menu: .asciiz "\n Qual operaÁ„o vocÈ deseja? \n 1)Soma \n 2)SubtraÁ„o \n 3)MultiplicaÁ„o \n 4)Divis„o \n 5)PotÍncia \n 6)Raiz Quadrada \n 7)Tabuada \n 8)Encerrar Programa \n"
	escolha_op: .asciiz "\n Digite o numero da operaÁ„o que vocÍ quer:"
	num1: .asciiz "\n Digite o primeiro n˙mero: "
	num2: .asciiz " Digite o segundo n˙mero: "
	num1_pot: .asciiz "\n Escolha o numero da Base:"
	num2_pot: .asciiz "\n Escolha o numero do Expoente:"
	num1_sqrt: .asciiz "\n VocÍ quer a raiz quadrada de qual n˙mero?"
	num_tabu: .asciiz "\n VocÍ quer a tabuada de qual n˙mero? "
	aviso: .asciiz "\n Use n˙meros inteiros,porfavor "
	aviso2: .asciiz "\n SÛ ir· aparecer a parte inteira dessa divis„o :/"
	aviso3: .asciiz "\n As operaÁıes de potencia est„o em ponto flutuante"
	continue: .asciiz "\nVocÍ deseja continuar ? \n 1-Sim \n 2-N„o \n"
	soma_msg: .asciiz "================== Soma ================================"
	sub_msg: .asciiz "================ SubtraÁ„o ==========================="
	mult_msg: .asciiz "================ MultiplicaÁ„o ==========================="
	div_msg: .asciiz "================ Divis„o ==========================="
	pot_msg: .asciiz "================ PotÍncia ==========================="
	sqrt_msg: .asciiz "================ Raiz ==========================="
	tabuada_msg: .asciiz "============ Tabuada ==========================="
	fimop_msg: .asciiz "\n \n=========================================================="
	resultado_soma: .asciiz "\n A soma dos n˙meros È "
	resultado_sub: .asciiz "\n A subtraÁ„o dos n˙meros È "
	resultado_mult: .asciiz "\n A MultiplicaÁ„o dos n˙meros È "
	resultado_div: .asciiz "\n A parte inteira dessa divi„o È "
	resultado_pot: .asciiz "\n A potenciaÁ„o do 1∫ e o 2∫ numero È (x^Y):"
	resultado_raiz: .asciiz "\n A Raiz desse n˙mero È "
	mult_simb: .asciiz " X "
	igual_simb: .asciiz " = "
	novalinha: .asciiz "\n"	
.text  
	inicio: #label para o inicio da Calculadora
	
	la $a0,menu #Impress„o do menu 
	jal PrintString #Chamando a funÁ„o para printar a string 
	
	la $a0, escolha_op
	jal PrintString #Chamando a funÁ„o para printar a string 
	
	jal Input_Int
	move $s1, $v0
	
# Esse bloco seria uma especie de "Switch case" no Assembly Mips
	beq $s1, 1 ,Soma #Se $s1 for igual 1,ent„o v· para a label Soma para comeÁar a operaÁ„o 
	beq $s1, 2 ,Subtracao #Se $s1 for igual 2,ent„o v· para a label SubtraÁ„o para comeÁar a operaÁ„o 
	beq $s1, 3 ,Multiplicacao #Se $s1 for igual 3,ent„o v· para a label MultiplicaÁ„o para comeÁar a operaÁ„o 
	beq $s1, 4 ,Divisao #Se $s1 for igual 4,ent„o v· para a label Divis„o para comeÁar a operaÁ„o 
	beq $s1, 5 ,Potencia #Se $s1 for igual 5,ent„o v· para a label PotÍncia para comeÁar a operaÁ„o 
	beq $s1, 6 ,Raiz #Se $s1 for igual 6,ent„o v· para a label Raiz para comeÁar a operaÁ„o  
	beq $s1, 7 ,Tabuada #Se $s1 for igual 7,ent„o v· para a label Tabuada para comeÁar a operaÁ„o 
	beq $s1, 8 ,Encerrar #Se $s1 for igual 8,Encerra o programa
				
#============================ FunÁıes das OperaÁıes ============================================
	Soma: #FunÁ„o de Soma 
		la $a0, soma_msg #Impress„o da mensagem de soma para deixar "bonito"
		jal PrintString #Chamando a funÁ„o para printar a string 
		la $a0, aviso  #Impress„o da mensagem de aviso 
		jal PrintString #Chamando a funÁ„o para printar a string 
				
		la $a0, num1 #Impress„o para chamar mensagem do primeiro n˙mero  
		jal PrintString #Chamando a funÁ„o para imprimir uma string 
		jal Input_Int #Chamando a funÁ„o para guardar o inteiro 
		move $t1, $v0 #Mover o $v0 para o $t1
		
		la $a0, num2 #Impress„o para chamar mensagem do segundo n√∫mero  
		jal PrintString #Chamando a fun√ß√£o para imprimir uma string 
		jal Input_Int #Chamando a fun√ß√£o para guardar o inteiro 	
		move $t2, $v0 #Mover o $v0 para o $t2
		
		add $t0,$t1,$t2	#Soma entre o registrador $t1 + $t2 e o resultado √© guardado em $t0
				
		la $a0, resultado_soma #Impress√£o da mensagem do resultado da soma,apenas o string  
		jal PrintString #Chamando a fun√ß√£o para imprimir uma string 
		move $a0,$t0 #Mover o $t0 para o $a0
		jal PrintInt #Chamando a fun√ß√£o para imprimir um inteiro,apartir da daqui que o resultado numeral vai aparecer
						
		la $a0, fimop_msg #Impress√£o de v√°rios = s√≥ para deixar o programa "bonito"
		jal PrintString #Chamando a fun√ß√£o para imprimir uma string 
		
		jal Espera #Chamando a fun√ß√£o para ver se o usuario quer continuar usando a calculadora 
	
	Subtracao:
		la $a0, sub_msg #Impress√£o da msg "bonita" de Subtra√ß√£o 
		jal PrintString #Chamando a fun√ß√£o para printar a string 
		la $a0, aviso #Impress√£o da mensagem de aviso 
		jal PrintString #Chamando a fun√ß√£o para printar a string 
				
		la $a0, num1
		jal PrintString #Chamando a fun√ß√£o para printar a string 
		jal Input_Int
		move $t1, $v0
		
		la $a0, num2
		jal PrintString #Chamando a fun√ß√£o para printar a string 
		jal Input_Int		
		move $t2, $v0
		
		sub $t0,$t1,$t2	
				
		la $a0, resultado_sub
		jal PrintString #Chamando a fun√ß√£o para printar a string 
		move $a0,$t0
		jal PrintInt
						
		la $a0, fimop_msg
		jal PrintString #Chamando a fun√ß√£o para printar a string 
		
		jal Espera #Chamando a fun√ß√£o para ver se o usuario quer continuar usando a calculadora
	
	Multiplicacao:
		la $a0, mult_msg
		jal PrintString #Chamando a fun√ß√£o para printar a string 
		la $a0, aviso #Impress√£o da mensagem de aviso 
		jal PrintString #Chamando a fun√ß√£o para printar a string 
		
		la $a0, num1
		jal PrintString  #Chamando a fun√ß√£o para printar a string 
		jal Input_Int
		move $t1, $v0
		
		la $a0, num2
		jal PrintString  #Chamando a fun√ß√£o para printar a string 
		jal Input_Int		
		move $t2, $v0
		
		mul $t0,$t1,$t2	
		
		la $a0, resultado_mult
		jal PrintString #Chamando a fun√ß√£o para printar a string 
		move $a0,$t0
		jal PrintInt
						
		la $a0, fimop_msg
		jal PrintString #Chamando a fun√ß√£o para printar a string 
		
		jal Espera #Chamando a fun√ß√£o para ver se o usuario quer continuar usando a calculadora
		
	Divisao:
		la $a0, div_msg
		jal PrintString #Chamando a fun√ß√£o para printar a string 
		la $a0, aviso2  #Impress√£o da mensagem de aviso2 
		jal PrintString #Chamando a fun√ß√£o para printar a string 
		
		la $a0, num1
		jal PrintString #Chamando a fun√ß√£o para printar a string 
		jal Input_Int
		move $t1, $v0
		
		la $a0, num2
		jal PrintString #Chamando a fun√ß√£o para printar a string 
		jal Input_Int		
		move $t2, $v0
		
		div $t1, $t2
		
		la $a0,resultado_div
		jal PrintString #Chamando a fun√ß√£o para printar a string 
		mflo $s0
		move $a0, $s0
		jal PrintInt	
		
		la $a0, fimop_msg
		jal PrintString	#Chamando a fun√ß√£o para printar a string 	 			
					
		jal Espera #Chamando a fun√ß√£o para ver se o usuario quer continuar usando a calculadora
	
	Potencia:
		la $a0, pot_msg #Impress√£o da mensagem de soma para deixar "bonito"
		jal PrintString #Impress√£o da mensagem de soma para deixar "bonito"
		la $a0, aviso3  #Impress√£o da mensagem de aviso 3
		jal PrintString #Chamando a fun√ß√£o para printar a string 
		
		la $a0, num1_pot
		jal PrintString #Chamando a fun√ß√£o para printar a string 
		jal Input_Int
		
		move $s0, $v0
		
		la $a0, num2_pot
		jal PrintString #Chamando a fun√ß√£o para printar a string 
		jal Input_Int
		
		move $a0, $s0 #salva a base em $a0 
		move $a1, $v0 #salva o expoente em a1		
		
		move   $t0, $zero # inicializa $t0 = 0 e $t0 = y
	  	move $v0, $zero    
	        addi $v0,$v0,1 
		jal potencia_loop
		
		move $s0, $v0
		
		la $a0, resultado_pot
		jal PrintString #Chamando a fun√ß√£o para printar a string 
		move $a0,$s0
		jal PrintInt
		
		la $a0, fimop_msg
		jal PrintString #Chamando a fun√ß√£o para printar a string 
		
		jal Espera #Chamando a fun√ß√£o para ver se o usuario quer continuar usando a calculadora				
#======================= Auxilio para Potencia =====================================		
#	Pot_Aux:  
        	            # valor inicial de $v0 = 1
	        
	potencia_loop: 
	        beq $t0, $a1, Sair_Loop      # a1 = y = 10
        	mul $v0, $v0, $a0         # a0 = 2 -> x = x * x * x * x .....
	        addi $t0, $t0, 1          # atualiza o valor de $t0   	        
	        j   potencia_loop
	        
	Sair_Loop: 
		jr $ra	
#====================================================================================		
	Raiz:
		la $a0, sqrt_msg
		jal PrintString #Chamando a fun√ß√£o para printar a string 
		
		la $a0, num1_sqrt
		jal PrintString #Chamando a fun√ß√£o para printar a string 
		jal Input_Float
		
		sqrt.s $f12,$f0
		
		la $a0, resultado_raiz
		jal PrintString #Chamando a fun√ß√£o para printar a string 
		jal PrintFloat
		
		la $a0, fimop_msg
		jal PrintString #Chamando a fun√ß√£o para printar a string 
		
		jal Espera #Chamando a fun√ß√£o para ver se o usuario quer continuar usando a calculadora
			
	Tabuada:
		la $a0, tabuada_msg
		jal PrintString #Chamando a fun√ß√£o para printar a string 
		
		la $a0, num_tabu
		jal PrintString #Chamando a fun√ß√£o para printar a string 
		jal Input_Int
		move $s0, $v0
		
		move $t1,$zero #Adiciona zero em t1,pois ele ser√° o contador do loop 
#======================= Auxilio para Tabuada =======================================
	Tabuada_loop:
		beq $t1, 11,Tabuada_fim
		
		move $a0, $s0
		jal PrintInt		
		
		la $a0, mult_simb
		jal PrintString #Chamando a fun√ß√£o para printar a string 
		
		move $a0, $t1 
		jal PrintInt 
		
		la $a0, igual_simb
		jal PrintString #Chamando a fun√ß√£o para printar a string 
		
		mul $a0, $s0, $t1
		jal PrintInt
		
		la $a0, novalinha
		jal PrintString	#Chamando a fun√ß√£o para printar a string 	
		
		addi $t1,$t1, 1						 
		j Tabuada_loop
		
	Tabuada_fim:
		la $a0, fimop_msg
		jal PrintString #Chamando a fun√ß√£o para printar a string 
		j Espera #Chamando a fun√ß√£o para ver se o usuario quer continuar usando a calculadora e quebrando o Loop 
			
#========================= Fun√ß√µes de  Auxilio Gerais ======================================
	PrintString: #Label para imprimir strings
		li $v0, 4  
		syscall
		jr $ra
		
	PrintInt: #Label para imprimir inteiros
		li $v0, 1  
		syscall
		jr $ra
		
	Input_Int: #Label para guardar inteiros
		li $v0,5
		syscall 
		jr $ra
		
	Input_Float: #Label para guardar float
		li $v0,6
		syscall 
		jr $ra	
	
	PrintFloat: #Label para imprimir float
		li $v0, 2 
		syscall
		jr $ra			
	
	Espera: #Label para ver se o usuario quer continuar usando a calculadora ou n√£o 
		la $a0,continue
		jal PrintString
		jal Input_Int
		
		move $s1, $v0
		
		beq $s1, 1 ,inicio
		beq $s1, 2 ,Encerrar
						
	Encerrar: #Label para encerrar o programa 
		li $v0,10
		syscall
 #=======================THE END============================================================	



