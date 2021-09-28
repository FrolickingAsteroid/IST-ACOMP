#Lab 2 - Maria Teresa Ramos Nogueira 100029 & Ines Cardoso Paiva 99961

	.data
A:	.word	1
B:	.word	1

	.text

rede_neuronal_xor:
la x18,B
lw x10,A
lw x11,B
li x12, 2
li x13,1

jal x1, neuronio
sw x16,4(x18)
#addi sp, sp, 8
lw x10,B
lw x11,A

jal x1,neuronio
sw x16,8(x18)
#addi sp, sp, 8
lw x10,8(x18)
lw x11,4(x18)
sub x11,zero,x11

jal x1,neuronio
sw x16,12(x18)
mv x10, x16

li x17, 1
ecall
li x17, 10
ecall



neuronio:
addi sp, sp, -4  #salvaguarda a chamada
sw	x1, 4(sp)

addi sp, sp, -8
sw x10, 4(sp)
sw x11, 0(sp)

jal x1, multiplica

lw x14, 4(sp)
lw x15, 0(sp)
addi sp, sp, 8

add x16,x14,x15  # c, d e y em ambas as iteracoes do xor
sub x16,x16,x13

#for
bge x16,zero,return_1
mv x16,zero
j end

return_1:
mv x16,x13

end:
lw x1,4(sp)
addi sp, sp, 4

ret


multiplica:
addi sp, sp, -16
sw	x10,12(sp)
sw	x11, 8(sp)
sw	x12, 4(sp)
sw	x13, 0(sp)

lw x19, 20(sp)
lw x20, 16(sp)

mv x14,zero
mv x15,zero
mv x13, x12	#i = 0
 
loop:
add x14, x14, x19	#loop das somas sucessivas, 
add x15, x15, x20   # x19 e x20 cont?m o multiplicando
addi x13,x13,-1     # x13 cont?m o multiplicador ( exe.:2)
bgt x13,zero,loop

#por_negativo		
sub x15,zero,x15

sw x15, 16(sp)
sw x14, 20(sp)

lw x13,0(sp)
lw x12, 4(sp)
lw x11, 8(sp)
lw x10,12(sp)
addi sp, sp, 16

ret



