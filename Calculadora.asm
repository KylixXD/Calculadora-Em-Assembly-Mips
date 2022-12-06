# Calculadora Foda
.data
	menu: .asciiz "\n Qual operação você deseja? \n 1)Soma \n 2)Subtração \n 3)Multiplicação \n 4)Divisão \n 5)Potência \n 6)Raiz Quadrada \n 7)Tabuada \n 8)Encerrar Programa \n"
	escolha_op: .asciiz "\n Digite o numero da operação que você quer:"
	num1: .asciiz "\n Digite o primeiro número: "
	num2: .asciiz " Digite o segundo número: "
	num1_pot: .asciiz "\n Escolha o numero da Base:"
	num2_pot: .asciiz "\n Escolha o numero do Expoente:"
	num1_sqrt: .asciiz "\n Você quer a raiz quadrada de qual número?"
	num_tabu: .asciiz "\n Você quer a tabuada de qual número? "
	aviso: .asciiz "\n Use números inteiros,porfavor "
	aviso2: .asciiz "\n Esta operação tem suporte a  ponto flutuante"
	continue: .asciiz "\nVocê deseja continuar ? \n 1-Sim \n 2-Não \n"
	soma_msg: .asciiz "================== Soma ================================"
	sub_msg: .asciiz "================ Subtração ==========================="
	mult_msg: .asciiz "================ Multiplicação ==========================="
	div_msg: .asciiz "================ Divisão ==========================="
	pot_msg: .asciiz "================ Potência ==========================="
	sqrt_msg: .asciiz "================ Raiz ==========================="
	tabuada_msg: .asciiz "============ Tabuada ==========================="
	fimop_msg: .asciiz "\n \n=========================================================="
	resultado_soma: .asciiz "\n A soma dos números é "
	resultado_sub: .asciiz "\n A subtração dos números é "
	resultado_mult: .asciiz "\n A Multiplicação dos números é "
	resultado_div: .asciiz "\n A divisão desses números é "
	resultado_pot: .asciiz "\n A potenciação do 1º e o 2º numero é (x^Y):"
	resultado_raiz: .asciiz "\n A Raiz desse número é "
	mult_simb: .asciiz " X "
	igual_simb: .asciiz " = "
	novalinha: .asciiz "\n"	
.text  
	inicio: #label para o inicio da Calculadora
	
	la $a0,menu #Impressão do menu 
	jal PrintString #Chamando a função para printar a string 
	
	la $a0, escolha_op
	jal PrintString #Chamando a função para printar a string 
	
	jal Input_Int #Chamando a função para ler um inteiro e assim escolher para qual "Switch" vai
	move $s1, $v0 #movendo $v0 par $s1
	
# Esse bloco seria uma especie de "Switch case" no Assembly Mips
	beq $s1, 1 ,Soma #Se $s1 for igual 1,então vá para a label Soma para começar a operação 
	beq $s1, 2 ,Subtracao #Se $s1 for igual 2,então vá para a label Subtração para começar a operação 
	beq $s1, 3 ,Multiplicacao #Se $s1 for igual 3,então vá para a label Multiplicação para começar a operação 
	beq $s1, 4 ,Divisao #Se $s1 for igual 4,então vá para a label Divisão para começar a operação 
	beq $s1, 5 ,Potencia #Se $s1 for igual 5,então vá para a label Potencia para começar a operação 
	beq $s1, 6 ,Raiz #Se $s1 for igual 6,então vá para a label Raiz para começar a operação 
	beq $s1, 7 ,Tabuada #Se $s1 for igual 7,então vá para a label Tabuada para começar a operação 
	beq $s1, 8 ,Encerrar #Se $s1 for igual 8,Encerra o programa
				
#============================ Funções das Operações ============================================
	Soma: #Função de Soma 
		la $a0, soma_msg #Impressão da mensagem de soma para deixar "bonito"
		jal PrintString #Chamando a função para printar a string 
		la $a0, aviso  #Impressão da mensagem de aviso 
		jal PrintString #Chamando a função para printar a string 
				
		la $a0, num1 #Impressão para chamar mensagem do primeiro número  
		jal PrintString #Chamando a função para imprimir uma string 
		jal Input_Int #Chamando a função para guardar o inteiro 
		move $t1, $v0 #Movimenta o $v0 para o $t1
		
		la $a0, num2 #Impressão para chamar mensagem do segundo número  
		jal PrintString #Chamando a função para imprimir uma string 
		jal Input_Int #Chamando a função para guardar o inteiro 	
		move $t2, $v0 #Movimenta o $v0 para o $t2
		
		add $t0,$t1,$t2	#Soma entre o registrador $t1 + $t2 e o resultado é guardado em $t0
				
		la $a0, resultado_soma #Impressão da mensagem do resultado da soma,apenas o string  
		jal PrintString #Chamando a função para imprimir uma string 
		move $a0,$t0 #Movimenta o $t0 para o $a0
		jal PrintInt #Chamando a função para imprimir um inteiro,apartir da daqui que o resultado numeral vai aparecer
						
		la $a0, fimop_msg #Impressão de vários = só para deixar o programa "bonito"
		jal PrintString #Chamando a função para imprimir uma string 
		
		jal Espera #Chamando a função para ver se o usuario quer continuar usando a calculadora 
	
	Subtracao:
		la $a0, sub_msg #Impressão da msg "bonita" de Subtração 
		jal PrintString #Chamando a função para printar a string 
		la $a0, aviso #Impressão da mensagem de aviso 
		jal PrintString #Chamando a função para printar a string 
				
		la $a0, num1 #Impressão para pedir o primeiro numero da operação 
		jal PrintString #Chamando a função para printar a string 
		jal Input_Int #Chamando a função para guardar o inteiro 
		move $t1, $v0 #Movimenta v0 para t1
		
		la $a0, num2 #Impressão para pedir o segundo numero da operação 
		jal PrintString #Chamando a função para printar a string 
		jal Input_Int #Chamando a função para guardar o inteiro 	
		move $t2, $v0 # Movimenta o v0 para o t2 
		
		sub $t0,$t1,$t2	# Subtração de t1 - t2 e o resultado vai para o t0
				
		la $a0, resultado_sub #Impressão da mensagem de resultado "bonito"
		jal PrintString #Chamando a função para printar a string 
		move $a0,$t0 #Movimenta t0 para a0
		jal PrintInt #Chamando a função para printar o inteiro
						
		la $a0, fimop_msg #Impressão de vários = só para deixar o programa "bonito"
		jal PrintString #Chamando a função para printar a string 
		
		jal Espera #Chamando a função para ver se o usuario quer continuar usando a calculadora
	
	Multiplicacao:
		la $a0, mult_msg #Impressão da msg "bonita" de Multiplicação
		jal PrintString #Chamando a função para printar a string 
		la $a0, aviso #Impressão da mensagem de aviso 
		jal PrintString #Chamando a função para printar a string 
		
		la $a0, num1 #Impressão para pedir o primeiro numero da operação 
		jal PrintString  #Chamando a função para printar a string 
		jal Input_Int #Chamando a função para guardar o inteiro 
		move $t1, $v0 #Movimenta v0 para t1
		
		la $a0, num2 #Impressão para pedir o segundo numero da operação 
		jal PrintString  #Chamando a função para printar a string 
		jal Input_Int	#Chamando a função para guardar o inteiro 	
		move $t2, $v0 #Movimenta v0 para t2
		
		mul $t0,$t1,$t2	#Multiplicação de t1 x t2 e o resultado t0
		
		la $a0, resultado_mult #Impressão da mensagem do resultado da multiplicação 
		jal PrintString #Chamando a função para printar a string 
		move $a0,$t0  #Movimenta t0 para a0
		jal PrintInt #chamando a função para printar o inteiro
						
		la $a0, fimop_msg #Impressão de vários = só para deixar o programa "bonito"
		jal PrintString #Chamando a função para printar a string 
		
		jal Espera #Chamando a função para ver se o usuario quer continuar usando a calculadora
		
	Divisao:
		la $a0, div_msg #Impressão da msg "bonita" de Divisão 
		jal PrintString #Chamando a função para printar a string 
		la $a0, aviso2  #Impressão da mensagem de aviso 2
		jal PrintString #Chamando a função para printar a string  
		
		la $a0, num1 #Impressão para pedir o primeiro numero da operação 
		jal PrintString #Chamando a função para printar a string 
		jal Input_Float #Chamando a função para guardar o float do usuario 	
		add.s $f12, $f10,$f0 #"Move" f0 + f10(não tem nenhum valor,só endereço) e vai para $f12	
		
		la $a0, num2 #Impressão para pedir o segundo numero da operação 
		jal PrintString #Chamando a função para printar a string 
		jal Input_Float	 #Chamando a função para guardar o float do usuario 	
		add.s $f2, $f10,$f0 #"Move" f0 + f10(não tem nenhum valor,só endereço) e vai para $f2
		
		div.s $f10, $f12, $f2 #divisão entre f12 e f2 e a resposta fica no f10 
				
		la $a0,resultado_div #Impressão da mensagem do resultado da divisão  
		jal PrintString #Chamando a função para printar a string 

		add.s $f12, $f10, $f1 #Esse "move" acontece pois o que ta sendo printado é o f12 e não $f10 onde esta a resposta
		jal PrintFloat	#Chamando a função para printar o float
		
		la $a0, fimop_msg #Impressão de vários = só para deixar o programa "bonito"
		jal PrintString	#Chamando a função para printar a string 	 			
					
		jal Espera #Chamando a função para ver se o usuario quer continuar usando a calculadora
	
	Potencia:
		la $a0, pot_msg #Impressão da mensagem de soma para deixar "bonito"
		jal PrintString #Impressão da mensagem de soma para deixar "bonito"
		la $a0, aviso2  #Impressão da mensagem de aviso 2
		jal PrintString #Chamando a função para printar a string 
		
		la $a0, num1_pot #Chama mensagem do primeiro número da potencia 
		jal PrintString #Chamando a função para printar a string 
		jal Input_Int #Chamando a função para guardar o inteiro 
		
		move $s0, $v0 #movimenta v0 para s0
		
		la $a0, num2_pot #Chama mensagem do segundo número da potencia 
		jal PrintString #Chamando a função para printar a string 
		jal Input_Int #Chamando a função para guardar o inteiro 
		
		move $a0, $s0 #salva a base em $a0 
		move $a1, $v0 #salva o expoente em a1		
		
		move $v0, $zero    #coloca o valor 0 para v0
	        addi $v0,$v0,1  #Adiciona imediatamente 1 a v0 
		jal potencia_loop #Jump para função Potencia_loop
		
		move $s0, $v0 #movimenta v0(com o resultado da potencia) para s0
		
		la $a0, resultado_pot #Impressão da mensagem "bonita" de potenciação
		jal PrintString #Chamando a função para printar a string 
		move $a0,$s0 #movimenta s0 para a0,a0 fica com o resultado 
		jal PrintInt #Chamando a função para imprimir o inteiro 
		
		la $a0, fimop_msg #Impressão de vários = só para deixar o programa "bonito"
		jal PrintString #Chamando a função para printar a string 
		
		jal Espera #Chamando a função para ver se o usuario quer continuar usando a calculadora				
#======================= Auxilio para Potencia =====================================		
	potencia_loop: 
	        beq $t0, $a1, Sair_Loop # COndição para saida do loop
        	mul $v0, $v0, $a0 # a0 = 2 -> x = x * x * x * x .....
	        addi $t0, $t0, 1 # atualiza o valor de $t0,sendo t0 o contador  	        
	        j   potencia_loop #Jump para a potencia_loop
	        
	Sair_Loop: 
		jr $ra	#Volta para onde foi chamada 
#====================================================================================		
	Raiz:
		la $a0, sqrt_msg #Impressão da msg "bonita" de Raiz 
		jal PrintString #Chamando a função para printar a string 
		
		la $a0, num1_sqrt #impressão da mensagem para escolher um número
		jal PrintString #Chamando a função para printar a string 
		jal Input_Float #Chamando a função para guardar o float
		
		sqrt.s $f12,$f0 #operação para fazer a raiz quadrada 
		
		la $a0, resultado_raiz #Impressão para pedir o resultado da raiz em string 
		jal PrintString #Chamando a função para printar a string 
		jal PrintFloat #Chamando a função para imprimir o float
		 
		la $a0, fimop_msg #Impressão de vários = só para deixar o programa "bonito"
		jal PrintString #Chamando a função para printar a string 
		
		jal Espera #Chamando a função para ver se o usuario quer continuar usando a calculadora
			
	Tabuada:
		la $a0, tabuada_msg  #Impressão da msg "bonita" de Tabuada
		jal PrintString #Chamando a função para printar a string 
		
		la $a0, num_tabu #Impressão da msg 
		jal PrintString #Chamando a função para printar a string 
		jal Input_Int #Chamando a função para guardar o inteiro 
		move $s0, $v0 #Move v0 para o s0
		
		move $t1,$zero #Adiciona zero em t1,pois ele será o contador do loop 
#======================= Auxilio para Tabuada =======================================
	Tabuada_loop:
		beq $t1, 11,Tabuada_fim
		
		move $a0, $s0 #Move s0 para o a0			
		jal PrintInt #Chamando a função para imprimir o inteiro 	
		
		la $a0, mult_simb #Impressão do simbolo de multiplicação: X
		jal PrintString #Chamando a função para printar a string 
		
		move $a0, $t1  #Move t1 para o a0	
		jal PrintInt #Chamando a função para imprimir o inteiro 
		
		la $a0, igual_simb #Impressão do simbolo de igual: =
		jal PrintString #Chamando a função para printar a string 
		
		mul $a0, $s0, $t1 #Operação de multiplicação s0 x t1 e o resultado é guardado a0
		jal PrintInt #Chamando a função para imprimir o inteiro 
		
		la $a0, novalinha #Impressão para Pular a Linha 
		jal PrintString	#Chamando a função para printar a string 	
		
		addi $t1,$t1, 1	#Adiciona imediatamente 1 a t1					 
		j Tabuada_loop #Jump para o Tabuada_loop
		
	Tabuada_fim:
		la $a0, fimop_msg #Impressão de vários = só para deixar o programa "bonito"
		jal PrintString #Chamando a função para printar a string 
		j Espera #Chamando a função para ver se o usuario quer continuar usando a calculadora e quebrando o Loop 
			
#========================= Funções de  Auxilio Gerais ======================================
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
	
	Espera: #Label para ver se o usuario quer continuar usando a calculadora ou não 
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
