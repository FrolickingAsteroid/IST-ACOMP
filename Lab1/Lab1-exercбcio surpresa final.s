# Lab1 - exercício surpresa:
# Maria Teresa Ramos Nogueira 100029
# Ines Cardoso Paiva 99961
	
	.data

numeros:	.zero	40
potencia:	.zero	4

	.text
la x10,numeros
li x11,1 # x = 1
li x12,1 # y = 1
sw x12,0(x10)

li x13,1 # i = 1
li x14,10 #max

forloop:
bge x13,x14,out
addi x10,x10,4 #offset
sw x12,0(x10)
or x15,x12,x0
add x12,x12,x11
or x11,x15,x0

addi x13,x13,1 #i++

j forloop

out:

#alteração do elemento
la x14,numeros	#novo apontador para o array de números
li x13,6		# n-1 do termo da série pretendido
slli x13,x13,2
add x14,x14,x13
lw x11,0(x14)

li x15,2
li x16,2
la x12,potencia #local de armazenamento da menor potencia de 2

pow:
mul x15,x15,x16
blt x15,x11,pow

#out da potencia
sw x15,0(x12)

li x17,1
ecall
li x17,10
ecall