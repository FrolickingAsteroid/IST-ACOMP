# Teresa Nogueira & Inês Paiva
#Programar recursivamente a função que calcula U(n), em que:
#U(n) = 1, se n <= 1
#U(n) = U(n-1) * U(n/2), se n é par
#U(n) = 2 U( (n-1)/2 ), se n é ímpar

	.data
n:	.word	7

	.text
Main:
lw a0, n

addi sp, sp, -4
sw a0, 0(sp) # n
jal U(n)
lw a0, 0(sp)
addi sp, sp, 4

li x17, 1
ecall
li x17, 10
ecall

U(n):
addi sp, sp, -8
sw ra, 4(sp)
sw s1, 0(sp)

lw t0, 8(sp) # n
li t1, 1

ble t0, t1, Return_1
li t1, 2
rem t2, t0, t1 # n%2
beq t2, zero, Par

#Impar:
addi t3, t0, -1
srli t3, t3, 1

addi sp, sp, -4
sw t3, 0(sp)
jal U(n)
lw s1, 0(sp)
addi sp, sp, 4
slli s1, s1, 1

jal reposicao

Par:
addi t3, t0, -1
srli t4, t0, 1

addi sp, sp, -4
sw t3, 0(sp)
jal U(n)
lw s1, 0(sp)
addi sp, sp, 4
sw s1, 20(sp)

addi sp, sp, -4
sw t4, 0(sp)
jal U(n)
lw s1, 0(sp)
addi sp, sp, 4
lw t5, 20(sp)
mul s1, s1, t5

jal reposicao

Return_1:
li s1, 1

reposicao:
sw s1, 8(sp)
lw s1, 0(sp)
lw ra, 4(sp)
addi sp, sp, 8
ret
















