#lab 1 casa realizado por Maria Teresa Nogueira nº100029 & Inês Cardoso Paiva nº99961
#===================================================================================#
	
	.data

x:	.word	1
y:	.word	1

	.text

la x10,x 
lw x11,0(x10) 		#x = 1
la x12,y
lw x13,0(x12) 		#y = 1

li x14, 0x00 		#i = 1
li x15, 0x08 		#MAX=8, o loop é iniciado apenas no terceiro valor da sequencia


forloop:
bge x14,x15 out
#insideloop
or x18,x13,x0		# z = y
add x13,x13,x11		# y' = x + y 
or x11,x18,x0		# z = x
sw x13,8(x10)		# save word in new adress
addi x10,x10,0x04	# update adress
addi x14,x14,0x001	#++i

j	forloop

out:
li x17, 1
ecall




