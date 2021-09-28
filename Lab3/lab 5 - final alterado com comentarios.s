# Programa L3 casa

   .data
x: .word 	3
y: .word 	2

   .text

main:
		lw a0, x
		lw a1, y

    	addi sp,sp, -8
    	sw a0,4(sp)
    	sw a1,0(sp)
		jal Pow
    	lw a0,0(sp)
    	addi sp,sp, 4 #repor a pilha


		li a7, 1
		ecall

		li a7, 10
		ecall

Pow:
		addi sp, sp, -4
		sw ra,0(sp) #x1
		li t4,1

    	lw t0,8(sp) #x
    	lw t1,4(sp) #y
   

   		bne t1, zero, else #if(y!=0)
    
		addi sp, sp,8     #ajuste da pilha (-8 + 4 - 4 -8)
		sw t4,0(sp)
		ret

else:
   		srli t2,t1,1   # h = floor(y/2)
		andi t3, t1, 1 # y and 1 = 0 se for par
		bne t3,zero, impar
   
    	addi sp,sp, -8
    	sw t0,4(sp) #x
    	sw t2,0(sp) #y = h

   		jal Pow

   		lw t5, 0(sp)

   		addi sp,sp, -8
   		sw t5, 4(sp)
   		sw t5, 0(sp)
   		jal Mult
   		lw t5, 0(sp)  #(não colocar em s1 senão faz overwrite nos pares)
   		addi sp,sp, 4 #ajuste da pilha ( -8 -12 +16 +4)

   		sw t5,0(sp)

   		lw ra,4(sp)
   		addi sp,sp,12
   

   		ret

impar:
    	addi sp,sp, -8
    	sw t0,4(sp) #x
    	sw t2,0(sp) #y=h

   		jal Pow

   		lw t5, 0(sp)

   		addi sp,sp, -8
   		sw t5, 4(sp) #pow(x,h)==> pow(x,h)^2
   		sw t5, 0(sp) #pow(x,y)
   		jal Mult
   		lw s1, 0(sp)
   		addi sp,sp, 4 #ajuste da pilha ( -8 -12 +16 +4)

  		addi sp,sp, -8
  		sw t0,4(sp) #x ==> x*pow(x,h)^2
  		sw s1, 0(sp)# pow(x,h)^2
  		jal Mult
  		lw t5,0(sp)
  		addi sp,sp 4

  		sw t5,12(sp)

  		lw ra,4(sp) #offset de 4 (a resolver)
  		addi sp,sp,12
 
  ret

Mult:
	addi sp, sp, -12
	sw s1, 8(sp)
	sw s2, 4(sp)
	sw s3, 0(sp)

	lw s2, 16(sp)
	lw s1, 12(sp)

	li s3, 0
	beq s2, zero, OutMul
	beq s1, zero, OutMul

MulLoop:
	add s3, s3, s1
	addi, s2, s2, -1
	bne s2, zero, MulLoop

OutMul:
	sw s3, 16(sp)

	lw s3, 0(sp)
	lw s2, 4(sp)
	lw s1, 8(sp)
	addi sp, sp, 16
	ret