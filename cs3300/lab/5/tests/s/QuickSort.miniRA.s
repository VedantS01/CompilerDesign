	.text
	.globl main
main:
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 52
	li $v1, 16
	move $s0, $v1
	move $a0, $s0
	jal _halloc
	move $s0, $v0
	move $s0, $s0
	li $v1, 12
	move $s1, $v1
	move $a0, $s1
	jal _halloc
	move $s1, $v0
	move $s1, $s1
	la $s2, QS_Init
	sw $s2, 12($s0)
	la $s2, QS_Print
	sw $s2, 8($s0)
	la $s2, QS_Sort
	sw $s2, 4($s0)
	la $s2, QS_Start
	sw $s2, 0($s0)
	li $v1, 4
	move $s2, $v1
	move $s2, $s2
L0:
	li $v1, 11
	move $s3, $v1
	sle $s3, $s2, $s3
	beqz $s3, L1
	add $s3, $s1, $s2
	li $v1, 0
	move $s4, $v1
	sw $s4, 0($s3)
	li $v1, 4
	move $s4, $v1
	add $s4, $s2, $s4
	move $s2, $s4
	b L0
L1:
	sw $s0, 0($s1)
	move $s1, $s1
	lw $s2, 0($s1)
	lw $s2, 0($s2)
	li $v1, 10
	move $s0, $v1
	sw $t0, -12($fp)
	sw $t1, -16($fp)
	sw $t2, -20($fp)
	sw $t3, -24($fp)
	sw $t4, -28($fp)
	sw $t5, -32($fp)
	sw $t6, -36($fp)
	sw $t7, -40($fp)
	sw $t8, -44($fp)
	sw $t9, -48($fp)
	move $a0, $s1
	move $a1, $s0
	jalr $s2
	lw $t0, -12($fp)
	lw $t1, -16($fp)
	lw $t2, -20($fp)
	lw $t3, -24($fp)
	lw $t4, -28($fp)
	lw $t5, -32($fp)
	lw $t6, -36($fp)
	lw $t7, -40($fp)
	lw $t8, -44($fp)
	lw $t9, -48($fp)
	move $s0, $v0
	move $a0, $s0
	jal _print
	addu $sp, $sp, 52
	lw $ra, -4($sp)
	jal _exitret
	.text
	.globl QS_Start
QS_Start:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 88
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	sw $s5, -32($fp)
	sw $s6, -36($fp)
	sw $s7, -40($fp)
	move $s1, $a0
	move $s0, $a1
	move $s2, $s1
	lw $s3, 0($s2)
	lw $s3, 12($s3)
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	sw $t2, -52($fp)
	sw $t3, -56($fp)
	sw $t4, -60($fp)
	sw $t5, -64($fp)
	sw $t6, -68($fp)
	sw $t7, -72($fp)
	sw $t8, -76($fp)
	sw $t9, -80($fp)
	move $a0, $s2
	move $a1, $s0
	jalr $s3
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	lw $t2, -52($fp)
	lw $t3, -56($fp)
	lw $t4, -60($fp)
	lw $t5, -64($fp)
	lw $t6, -68($fp)
	lw $t7, -72($fp)
	lw $t8, -76($fp)
	lw $t9, -80($fp)
	move $s3, $v0
	move $v1, $s3
	move $s3, $s1
	lw $s2, 0($s3)
	lw $s2, 8($s2)
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	sw $t2, -52($fp)
	sw $t3, -56($fp)
	sw $t4, -60($fp)
	sw $t5, -64($fp)
	sw $t6, -68($fp)
	sw $t7, -72($fp)
	sw $t8, -76($fp)
	sw $t9, -80($fp)
	move $a0, $s3
	jalr $s2
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	lw $t2, -52($fp)
	lw $t3, -56($fp)
	lw $t4, -60($fp)
	lw $t5, -64($fp)
	lw $t6, -68($fp)
	lw $t7, -72($fp)
	lw $t8, -76($fp)
	lw $t9, -80($fp)
	move $s2, $v0
	move $v1, $s2
	li $v1, 9999
	move $s2, $v1
	move $a0, $s2
	jal _print
	lw $s2, 8($s1)
	li $v1, 1
	move $s3, $v1
	sub $s3, $s2, $s3
	move $s3, $s3
	move $s2, $s1
	lw $s0, 0($s2)
	lw $s0, 4($s0)
	li $v1, 0
	move $s4, $v1
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	sw $t2, -52($fp)
	sw $t3, -56($fp)
	sw $t4, -60($fp)
	sw $t5, -64($fp)
	sw $t6, -68($fp)
	sw $t7, -72($fp)
	sw $t8, -76($fp)
	sw $t9, -80($fp)
	move $a0, $s2
	move $a1, $s4
	move $a2, $s3
	jalr $s0
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	lw $t2, -52($fp)
	lw $t3, -56($fp)
	lw $t4, -60($fp)
	lw $t5, -64($fp)
	lw $t6, -68($fp)
	lw $t7, -72($fp)
	lw $t8, -76($fp)
	lw $t9, -80($fp)
	move $s4, $v0
	move $s3, $s4
	move $s1, $s1
	lw $s4, 0($s1)
	lw $s4, 8($s4)
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	sw $t2, -52($fp)
	sw $t3, -56($fp)
	sw $t4, -60($fp)
	sw $t5, -64($fp)
	sw $t6, -68($fp)
	sw $t7, -72($fp)
	sw $t8, -76($fp)
	sw $t9, -80($fp)
	move $a0, $s1
	jalr $s4
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	lw $t2, -52($fp)
	lw $t3, -56($fp)
	lw $t4, -60($fp)
	lw $t5, -64($fp)
	lw $t6, -68($fp)
	lw $t7, -72($fp)
	lw $t8, -76($fp)
	lw $t9, -80($fp)
	move $s4, $v0
	move $s3, $s4
	li $v1, 0
	move $s4, $v1
	move $v0, $s4
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s5, -32($fp)
	lw $s6, -36($fp)
	lw $s7, -40($fp)
	addu $sp, $sp, 88
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl QS_Sort
QS_Sort:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 88
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	sw $s5, -32($fp)
	sw $s6, -36($fp)
	sw $s7, -40($fp)
	move $s1, $a0
	move $s0, $a1
	move $s2, $a2
	li $v1, 0
	move $s3, $v1
	move $s3, $s3
	li $v1, 1
	move $s4, $v1
	sub $s4, $s2, $s4
	move $s4, $s4
	sle $s4, $s0, $s4
	beqz $s4, L2
	lw $v1, 4($s1)
	li $v1, 4
	move $s4, $v1
	mul $s4, $s2, $s4
	move $s4, $s4
	lw $s5, 4($s1)
	lw $s6, 0($s5)
	li $v1, 1
	move $s7, $v1
	sub $s7, $s6, $s7
	move $s7, $s7
	li $v1, 1
	move $s6, $v1
	sle $s7, $s4, $s7
	sub $s7, $s6, $s7
	beqz $s7, L4
	jal _error
L4:
	nop
	li $v1, 4
	move $s7, $v1
	add $s7, $s4, $s7
	add $s7, $s5, $s7
	lw $s7, 0($s7)
	move $s7, $s7
	li $v1, 1
	move $s5, $v1
	sub $s5, $s0, $s5
	move $s5, $s5
	move $s4, $s2
	li $v1, 1
	move $s6, $v1
	move $s6, $s6
L5:
	beqz $s6, L6
	li $v1, 1
	move $t0, $v1
	move $t0, $t0
L7:
	beqz $t0, L8
	li $v1, 1
	move $t1, $v1
	add $t1, $s5, $t1
	move $s5, $t1
	lw $v1, 4($s1)
	li $v1, 4
	move $t1, $v1
	mul $t1, $s5, $t1
	move $t1, $t1
	lw $t2, 4($s1)
	lw $t3, 0($t2)
	li $v1, 1
	move $t4, $v1
	sub $t4, $t3, $t4
	move $t4, $t4
	li $v1, 1
	move $t3, $v1
	sle $t4, $t1, $t4
	sub $t4, $t3, $t4
	beqz $t4, L9
	jal _error
L9:
	nop
	li $v1, 4
	move $t4, $v1
	add $t4, $t1, $t4
	add $t4, $t2, $t4
	lw $t4, 0($t4)
	move $t4, $t4
	li $v1, 1
	move $t2, $v1
	sub $t2, $s7, $t2
	move $t2, $t2
	li $v1, 1
	move $t1, $v1
	sle $t2, $t4, $t2
	sub $t2, $t1, $t2
	beqz $t2, L10
	li $v1, 0
	move $t2, $v1
	move $t0, $t2
	b L11
L10:
	li $v1, 1
	move $t2, $v1
	move $t0, $t2
L11:
	nop
	b L7
L8:
	nop
	li $v1, 1
	move $t2, $v1
	move $t0, $t2
L12:
	beqz $t0, L13
	li $v1, 1
	move $t2, $v1
	sub $t2, $s4, $t2
	move $s4, $t2
	lw $v1, 4($s1)
	li $v1, 4
	move $t2, $v1
	mul $t2, $s4, $t2
	move $t2, $t2
	lw $t1, 4($s1)
	lw $t3, 0($t1)
	li $v1, 1
	move $t5, $v1
	sub $t5, $t3, $t5
	move $t5, $t5
	li $v1, 1
	move $t3, $v1
	sle $t5, $t2, $t5
	sub $t5, $t3, $t5
	beqz $t5, L14
	jal _error
L14:
	nop
	li $v1, 4
	move $t5, $v1
	add $t5, $t2, $t5
	add $t5, $t1, $t5
	lw $t5, 0($t5)
	move $t4, $t5
	li $v1, 1
	move $t5, $v1
	sub $t5, $t4, $t5
	move $t5, $t5
	li $v1, 1
	move $t4, $v1
	sle $t5, $s7, $t5
	sub $t5, $t4, $t5
	beqz $t5, L15
	li $v1, 0
	move $t5, $v1
	move $t0, $t5
	b L16
L15:
	li $v1, 1
	move $t5, $v1
	move $t0, $t5
L16:
	nop
	b L12
L13:
	nop
	lw $v1, 4($s1)
	li $v1, 4
	move $t0, $v1
	mul $t0, $s5, $t0
	move $t0, $t0
	lw $t5, 4($s1)
	lw $t4, 0($t5)
	li $v1, 1
	move $t1, $v1
	sub $t1, $t4, $t1
	move $t1, $t1
	li $v1, 1
	move $t4, $v1
	sle $t1, $t0, $t1
	sub $t1, $t4, $t1
	beqz $t1, L17
	jal _error
L17:
	nop
	li $v1, 4
	move $t1, $v1
	add $t1, $t0, $t1
	add $t1, $t5, $t1
	lw $t1, 0($t1)
	move $s3, $t1
	li $v1, 1
	move $t1, $v1
	li $v1, 4
	move $t5, $v1
	mul $t5, $t1, $t5
	move $t5, $t5
	add $t1, $s1, $t5
	lw $v1, 0($t1)
	li $v1, 4
	move $t1, $v1
	mul $t1, $s5, $t1
	move $t1, $t1
	li $v1, 1
	move $t0, $v1
	li $v1, 4
	move $t4, $v1
	mul $t4, $t0, $t4
	move $t5, $t4
	add $t5, $s1, $t5
	lw $t5, 0($t5)
	lw $t4, 0($t5)
	li $v1, 1
	move $t0, $v1
	sub $t0, $t4, $t0
	move $t0, $t0
	li $v1, 1
	move $t4, $v1
	sle $t0, $t1, $t0
	sub $t0, $t4, $t0
	beqz $t0, L18
	jal _error
L18:
	nop
	li $v1, 4
	move $t0, $v1
	add $t0, $t1, $t0
	add $t0, $t5, $t0
	lw $v1, 4($s1)
	li $v1, 4
	move $t5, $v1
	mul $t5, $s4, $t5
	move $t5, $t5
	lw $t1, 4($s1)
	lw $t4, 0($t1)
	li $v1, 1
	move $t2, $v1
	sub $t2, $t4, $t2
	move $t2, $t2
	li $v1, 1
	move $t4, $v1
	sle $t2, $t5, $t2
	sub $t2, $t4, $t2
	beqz $t2, L19
	jal _error
L19:
	nop
	li $v1, 4
	move $t2, $v1
	add $t2, $t5, $t2
	add $t2, $t1, $t2
	lw $t2, 0($t2)
	sw $t2, 0($t0)
	li $v1, 1
	move $t2, $v1
	li $v1, 4
	move $t0, $v1
	mul $t0, $t2, $t0
	move $t0, $t0
	add $t2, $s1, $t0
	lw $v1, 0($t2)
	li $v1, 4
	move $t2, $v1
	mul $t2, $s4, $t2
	move $t2, $t2
	li $v1, 1
	move $t1, $v1
	li $v1, 4
	move $t5, $v1
	mul $t5, $t1, $t5
	move $t0, $t5
	add $t0, $s1, $t0
	lw $t0, 0($t0)
	lw $t5, 0($t0)
	li $v1, 1
	move $t1, $v1
	sub $t1, $t5, $t1
	move $t1, $t1
	li $v1, 1
	move $t5, $v1
	sle $t1, $t2, $t1
	sub $t1, $t5, $t1
	beqz $t1, L20
	jal _error
L20:
	nop
	li $v1, 4
	move $t1, $v1
	add $t1, $t2, $t1
	add $t1, $t0, $t1
	sw $s3, 0($t1)
	sle $t1, $s4, $s5
	beqz $t1, L21
	li $v1, 0
	move $t1, $v1
	move $s6, $t1
	b L22
L21:
	li $v1, 1
	move $t1, $v1
	move $s6, $t1
L22:
	nop
	b L5
L6:
	nop
	li $v1, 1
	move $s6, $v1
	li $v1, 4
	move $s7, $v1
	mul $s7, $s6, $s7
	move $s7, $s7
	add $s6, $s1, $s7
	lw $v1, 0($s6)
	li $v1, 4
	move $s6, $v1
	mul $s6, $s4, $s6
	move $s6, $s6
	li $v1, 1
	move $s4, $v1
	li $v1, 4
	move $t1, $v1
	mul $t1, $s4, $t1
	move $s7, $t1
	add $s7, $s1, $s7
	lw $s7, 0($s7)
	lw $t1, 0($s7)
	li $v1, 1
	move $s4, $v1
	sub $s4, $t1, $s4
	move $s4, $s4
	li $v1, 1
	move $t1, $v1
	sle $s4, $s6, $s4
	sub $s4, $t1, $s4
	beqz $s4, L23
	jal _error
L23:
	nop
	li $v1, 4
	move $s4, $v1
	add $s4, $s6, $s4
	add $s4, $s7, $s4
	lw $v1, 4($s1)
	li $v1, 4
	move $s7, $v1
	mul $s7, $s5, $s7
	move $s7, $s7
	lw $s6, 4($s1)
	lw $t1, 0($s6)
	li $v1, 1
	move $t0, $v1
	sub $t0, $t1, $t0
	move $t0, $t0
	li $v1, 1
	move $t1, $v1
	sle $t0, $s7, $t0
	sub $t0, $t1, $t0
	beqz $t0, L24
	jal _error
L24:
	nop
	li $v1, 4
	move $t0, $v1
	add $t0, $s7, $t0
	add $t0, $s6, $t0
	lw $t0, 0($t0)
	sw $t0, 0($s4)
	li $v1, 1
	move $t0, $v1
	li $v1, 4
	move $s4, $v1
	mul $s4, $t0, $s4
	move $s4, $s4
	add $t0, $s1, $s4
	lw $v1, 0($t0)
	li $v1, 4
	move $t0, $v1
	mul $t0, $s5, $t0
	move $t0, $t0
	li $v1, 1
	move $s6, $v1
	li $v1, 4
	move $s7, $v1
	mul $s7, $s6, $s7
	move $s4, $s7
	add $s4, $s1, $s4
	lw $s4, 0($s4)
	lw $s7, 0($s4)
	li $v1, 1
	move $s6, $v1
	sub $s6, $s7, $s6
	move $s6, $s6
	li $v1, 1
	move $s7, $v1
	sle $s6, $t0, $s6
	sub $s6, $s7, $s6
	beqz $s6, L25
	jal _error
L25:
	nop
	li $v1, 4
	move $s6, $v1
	add $s6, $t0, $s6
	add $s6, $s4, $s6
	lw $v1, 4($s1)
	li $v1, 4
	move $s4, $v1
	mul $s4, $s2, $s4
	move $s4, $s4
	lw $t0, 4($s1)
	lw $s7, 0($t0)
	li $v1, 1
	move $t1, $v1
	sub $t1, $s7, $t1
	move $t1, $t1
	li $v1, 1
	move $s7, $v1
	sle $t1, $s4, $t1
	sub $t1, $s7, $t1
	beqz $t1, L26
	jal _error
L26:
	nop
	li $v1, 4
	move $t1, $v1
	add $t1, $s4, $t1
	add $t1, $t0, $t1
	lw $t1, 0($t1)
	sw $t1, 0($s6)
	li $v1, 1
	move $t1, $v1
	li $v1, 4
	move $s6, $v1
	mul $s6, $t1, $s6
	move $s6, $s6
	add $t1, $s1, $s6
	lw $v1, 0($t1)
	li $v1, 4
	move $t1, $v1
	mul $t1, $s2, $t1
	move $t1, $t1
	li $v1, 1
	move $t0, $v1
	li $v1, 4
	move $s4, $v1
	mul $s4, $t0, $s4
	move $s6, $s4
	add $s6, $s1, $s6
	lw $s6, 0($s6)
	lw $s4, 0($s6)
	li $v1, 1
	move $t0, $v1
	sub $t0, $s4, $t0
	move $t0, $t0
	li $v1, 1
	move $s4, $v1
	sle $t0, $t1, $t0
	sub $t0, $s4, $t0
	beqz $t0, L27
	jal _error
L27:
	nop
	li $v1, 4
	move $t0, $v1
	add $t0, $t1, $t0
	add $t0, $s6, $t0
	sw $s3, 0($t0)
	move $t0, $s1
	lw $s3, 0($t0)
	lw $s3, 4($s3)
	li $v1, 1
	move $s6, $v1
	sub $s6, $s5, $s6
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	sw $t2, -52($fp)
	sw $t3, -56($fp)
	sw $t4, -60($fp)
	sw $t5, -64($fp)
	sw $t6, -68($fp)
	sw $t7, -72($fp)
	sw $t8, -76($fp)
	sw $t9, -80($fp)
	move $a0, $t0
	move $a1, $s0
	move $a2, $s6
	jalr $s3
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	lw $t2, -52($fp)
	lw $t3, -56($fp)
	lw $t4, -60($fp)
	lw $t5, -64($fp)
	lw $t6, -68($fp)
	lw $t7, -72($fp)
	lw $t8, -76($fp)
	lw $t9, -80($fp)
	move $s6, $v0
	move $v1, $s6
	move $s1, $s1
	lw $s6, 0($s1)
	lw $s6, 4($s6)
	li $v1, 1
	move $s3, $v1
	add $s3, $s5, $s3
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	sw $t2, -52($fp)
	sw $t3, -56($fp)
	sw $t4, -60($fp)
	sw $t5, -64($fp)
	sw $t6, -68($fp)
	sw $t7, -72($fp)
	sw $t8, -76($fp)
	sw $t9, -80($fp)
	move $a0, $s1
	move $a1, $s3
	move $a2, $s2
	jalr $s6
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	lw $t2, -52($fp)
	lw $t3, -56($fp)
	lw $t4, -60($fp)
	lw $t5, -64($fp)
	lw $t6, -68($fp)
	lw $t7, -72($fp)
	lw $t8, -76($fp)
	lw $t9, -80($fp)
	move $s3, $v0
	move $v1, $s3
	b L3
L2:
	li $v1, 0
	move $s3, $v1
	move $v1, $s3
L3:
	nop
	li $v1, 0
	move $s3, $v1
	move $v0, $s3
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s5, -32($fp)
	lw $s6, -36($fp)
	lw $s7, -40($fp)
	addu $sp, $sp, 88
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl QS_Print
QS_Print:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 36
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	sw $s5, -32($fp)
	sw $s6, -36($fp)
	sw $s7, -40($fp)
	move $s0, $a0
	li $v1, 0
	move $s1, $v1
	move $s1, $s1
L28:
	lw $s2, 8($s0)
	li $v1, 1
	move $s3, $v1
	sub $s3, $s2, $s3
	move $s3, $s3
	sle $s3, $s1, $s3
	beqz $s3, L29
	lw $v1, 4($s0)
	li $v1, 4
	move $s3, $v1
	mul $s3, $s1, $s3
	move $s3, $s3
	lw $s2, 4($s0)
	lw $s4, 0($s2)
	li $v1, 1
	move $s5, $v1
	sub $s5, $s4, $s5
	move $s5, $s5
	li $v1, 1
	move $s4, $v1
	sle $s5, $s3, $s5
	sub $s5, $s4, $s5
	beqz $s5, L30
	jal _error
L30:
	nop
	li $v1, 4
	move $s5, $v1
	add $s5, $s3, $s5
	add $s5, $s2, $s5
	lw $s5, 0($s5)
	move $a0, $s5
	jal _print
	li $v1, 1
	move $s5, $v1
	add $s5, $s1, $s5
	move $s1, $s5
	b L28
L29:
	nop
	li $v1, 0
	move $s1, $v1
	move $v0, $s1
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s5, -32($fp)
	lw $s6, -36($fp)
	lw $s7, -40($fp)
	addu $sp, $sp, 36
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl QS_Init
QS_Init:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 36
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	sw $s5, -32($fp)
	sw $s6, -36($fp)
	sw $s7, -40($fp)
	move $s1, $a0
	move $s0, $a1
	sw $s0, 8($s1)
	li $v1, 1
	move $s2, $v1
	add $s2, $s0, $s2
	li $v1, 4
	move $s3, $v1
	mul $s3, $s2, $s3
	move $a0, $s3
	jal _halloc
	move $s3, $v0
	move $s3, $s3
	li $v1, 4
	move $s2, $v1
	move $s2, $s2
L31:
	li $v1, 1
	move $s4, $v1
	add $s4, $s0, $s4
	li $v1, 4
	move $s5, $v1
	mul $s5, $s4, $s5
	li $v1, 1
	move $s4, $v1
	sub $s4, $s5, $s4
	sle $s4, $s2, $s4
	beqz $s4, L32
	add $s4, $s3, $s2
	li $v1, 0
	move $s5, $v1
	sw $s5, 0($s4)
	li $v1, 4
	move $s5, $v1
	add $s5, $s2, $s5
	move $s2, $s5
	b L31
L32:
	li $v1, 4
	move $s2, $v1
	mul $s2, $s0, $s2
	sw $s2, 0($s3)
	sw $s3, 4($s1)
	li $v1, 1
	move $s3, $v1
	li $v1, 4
	move $s2, $v1
	mul $s2, $s3, $s2
	move $s2, $s2
	add $s3, $s1, $s2
	lw $v1, 0($s3)
	li $v1, 0
	move $s3, $v1
	li $v1, 4
	move $s0, $v1
	mul $s0, $s3, $s0
	move $s0, $s0
	li $v1, 1
	move $s3, $v1
	li $v1, 4
	move $s5, $v1
	mul $s5, $s3, $s5
	move $s2, $s5
	add $s2, $s1, $s2
	lw $s2, 0($s2)
	lw $s5, 0($s2)
	li $v1, 1
	move $s3, $v1
	sub $s3, $s5, $s3
	move $s3, $s3
	li $v1, 1
	move $s5, $v1
	sle $s3, $s0, $s3
	sub $s3, $s5, $s3
	beqz $s3, L33
	jal _error
L33:
	nop
	li $v1, 4
	move $s3, $v1
	add $s3, $s0, $s3
	add $s3, $s2, $s3
	li $v1, 20
	move $s2, $v1
	sw $s2, 0($s3)
	li $v1, 1
	move $s2, $v1
	li $v1, 4
	move $s3, $v1
	mul $s3, $s2, $s3
	move $s3, $s3
	add $s2, $s1, $s3
	lw $v1, 0($s2)
	li $v1, 1
	move $s2, $v1
	li $v1, 4
	move $s0, $v1
	mul $s0, $s2, $s0
	move $s0, $s0
	li $v1, 1
	move $s2, $v1
	li $v1, 4
	move $s5, $v1
	mul $s5, $s2, $s5
	move $s3, $s5
	add $s3, $s1, $s3
	lw $s3, 0($s3)
	lw $s5, 0($s3)
	li $v1, 1
	move $s2, $v1
	sub $s2, $s5, $s2
	move $s2, $s2
	li $v1, 1
	move $s5, $v1
	sle $s2, $s0, $s2
	sub $s2, $s5, $s2
	beqz $s2, L34
	jal _error
L34:
	nop
	li $v1, 4
	move $s2, $v1
	add $s2, $s0, $s2
	add $s2, $s3, $s2
	li $v1, 7
	move $s3, $v1
	sw $s3, 0($s2)
	li $v1, 1
	move $s3, $v1
	li $v1, 4
	move $s2, $v1
	mul $s2, $s3, $s2
	move $s2, $s2
	add $s3, $s1, $s2
	lw $v1, 0($s3)
	li $v1, 2
	move $s3, $v1
	li $v1, 4
	move $s0, $v1
	mul $s0, $s3, $s0
	move $s0, $s0
	li $v1, 1
	move $s3, $v1
	li $v1, 4
	move $s5, $v1
	mul $s5, $s3, $s5
	move $s2, $s5
	add $s2, $s1, $s2
	lw $s2, 0($s2)
	lw $s5, 0($s2)
	li $v1, 1
	move $s3, $v1
	sub $s3, $s5, $s3
	move $s3, $s3
	li $v1, 1
	move $s5, $v1
	sle $s3, $s0, $s3
	sub $s3, $s5, $s3
	beqz $s3, L35
	jal _error
L35:
	nop
	li $v1, 4
	move $s3, $v1
	add $s3, $s0, $s3
	add $s3, $s2, $s3
	li $v1, 12
	move $s2, $v1
	sw $s2, 0($s3)
	li $v1, 1
	move $s2, $v1
	li $v1, 4
	move $s3, $v1
	mul $s3, $s2, $s3
	move $s3, $s3
	add $s2, $s1, $s3
	lw $v1, 0($s2)
	li $v1, 3
	move $s2, $v1
	li $v1, 4
	move $s0, $v1
	mul $s0, $s2, $s0
	move $s0, $s0
	li $v1, 1
	move $s2, $v1
	li $v1, 4
	move $s5, $v1
	mul $s5, $s2, $s5
	move $s3, $s5
	add $s3, $s1, $s3
	lw $s3, 0($s3)
	lw $s5, 0($s3)
	li $v1, 1
	move $s2, $v1
	sub $s2, $s5, $s2
	move $s2, $s2
	li $v1, 1
	move $s5, $v1
	sle $s2, $s0, $s2
	sub $s2, $s5, $s2
	beqz $s2, L36
	jal _error
L36:
	nop
	li $v1, 4
	move $s2, $v1
	add $s2, $s0, $s2
	add $s2, $s3, $s2
	li $v1, 18
	move $s3, $v1
	sw $s3, 0($s2)
	li $v1, 1
	move $s3, $v1
	li $v1, 4
	move $s2, $v1
	mul $s2, $s3, $s2
	move $s2, $s2
	add $s3, $s1, $s2
	lw $v1, 0($s3)
	li $v1, 4
	move $s3, $v1
	li $v1, 4
	move $s0, $v1
	mul $s0, $s3, $s0
	move $s0, $s0
	li $v1, 1
	move $s3, $v1
	li $v1, 4
	move $s5, $v1
	mul $s5, $s3, $s5
	move $s2, $s5
	add $s2, $s1, $s2
	lw $s2, 0($s2)
	lw $s5, 0($s2)
	li $v1, 1
	move $s3, $v1
	sub $s3, $s5, $s3
	move $s3, $s3
	li $v1, 1
	move $s5, $v1
	sle $s3, $s0, $s3
	sub $s3, $s5, $s3
	beqz $s3, L37
	jal _error
L37:
	nop
	li $v1, 4
	move $s3, $v1
	add $s3, $s0, $s3
	add $s3, $s2, $s3
	li $v1, 2
	move $s2, $v1
	sw $s2, 0($s3)
	li $v1, 1
	move $s2, $v1
	li $v1, 4
	move $s3, $v1
	mul $s3, $s2, $s3
	move $s3, $s3
	add $s2, $s1, $s3
	lw $v1, 0($s2)
	li $v1, 5
	move $s2, $v1
	li $v1, 4
	move $s0, $v1
	mul $s0, $s2, $s0
	move $s0, $s0
	li $v1, 1
	move $s2, $v1
	li $v1, 4
	move $s5, $v1
	mul $s5, $s2, $s5
	move $s3, $s5
	add $s3, $s1, $s3
	lw $s3, 0($s3)
	lw $s5, 0($s3)
	li $v1, 1
	move $s2, $v1
	sub $s2, $s5, $s2
	move $s2, $s2
	li $v1, 1
	move $s5, $v1
	sle $s2, $s0, $s2
	sub $s2, $s5, $s2
	beqz $s2, L38
	jal _error
L38:
	nop
	li $v1, 4
	move $s2, $v1
	add $s2, $s0, $s2
	add $s2, $s3, $s2
	li $v1, 11
	move $s3, $v1
	sw $s3, 0($s2)
	li $v1, 1
	move $s3, $v1
	li $v1, 4
	move $s2, $v1
	mul $s2, $s3, $s2
	move $s2, $s2
	add $s3, $s1, $s2
	lw $v1, 0($s3)
	li $v1, 6
	move $s3, $v1
	li $v1, 4
	move $s0, $v1
	mul $s0, $s3, $s0
	move $s0, $s0
	li $v1, 1
	move $s3, $v1
	li $v1, 4
	move $s5, $v1
	mul $s5, $s3, $s5
	move $s2, $s5
	add $s2, $s1, $s2
	lw $s2, 0($s2)
	lw $s5, 0($s2)
	li $v1, 1
	move $s3, $v1
	sub $s3, $s5, $s3
	move $s3, $s3
	li $v1, 1
	move $s5, $v1
	sle $s3, $s0, $s3
	sub $s3, $s5, $s3
	beqz $s3, L39
	jal _error
L39:
	nop
	li $v1, 4
	move $s3, $v1
	add $s3, $s0, $s3
	add $s3, $s2, $s3
	li $v1, 6
	move $s2, $v1
	sw $s2, 0($s3)
	li $v1, 1
	move $s2, $v1
	li $v1, 4
	move $s3, $v1
	mul $s3, $s2, $s3
	move $s3, $s3
	add $s2, $s1, $s3
	lw $v1, 0($s2)
	li $v1, 7
	move $s2, $v1
	li $v1, 4
	move $s0, $v1
	mul $s0, $s2, $s0
	move $s0, $s0
	li $v1, 1
	move $s2, $v1
	li $v1, 4
	move $s5, $v1
	mul $s5, $s2, $s5
	move $s3, $s5
	add $s3, $s1, $s3
	lw $s3, 0($s3)
	lw $s5, 0($s3)
	li $v1, 1
	move $s2, $v1
	sub $s2, $s5, $s2
	move $s2, $s2
	li $v1, 1
	move $s5, $v1
	sle $s2, $s0, $s2
	sub $s2, $s5, $s2
	beqz $s2, L40
	jal _error
L40:
	nop
	li $v1, 4
	move $s2, $v1
	add $s2, $s0, $s2
	add $s2, $s3, $s2
	li $v1, 9
	move $s3, $v1
	sw $s3, 0($s2)
	li $v1, 1
	move $s3, $v1
	li $v1, 4
	move $s2, $v1
	mul $s2, $s3, $s2
	move $s2, $s2
	add $s3, $s1, $s2
	lw $v1, 0($s3)
	li $v1, 8
	move $s3, $v1
	li $v1, 4
	move $s0, $v1
	mul $s0, $s3, $s0
	move $s0, $s0
	li $v1, 1
	move $s3, $v1
	li $v1, 4
	move $s5, $v1
	mul $s5, $s3, $s5
	move $s2, $s5
	add $s2, $s1, $s2
	lw $s2, 0($s2)
	lw $s5, 0($s2)
	li $v1, 1
	move $s3, $v1
	sub $s3, $s5, $s3
	move $s3, $s3
	li $v1, 1
	move $s5, $v1
	sle $s3, $s0, $s3
	sub $s3, $s5, $s3
	beqz $s3, L41
	jal _error
L41:
	nop
	li $v1, 4
	move $s3, $v1
	add $s3, $s0, $s3
	add $s3, $s2, $s3
	li $v1, 19
	move $s2, $v1
	sw $s2, 0($s3)
	li $v1, 1
	move $s2, $v1
	li $v1, 4
	move $s3, $v1
	mul $s3, $s2, $s3
	move $s3, $s3
	add $s2, $s1, $s3
	lw $v1, 0($s2)
	li $v1, 9
	move $s2, $v1
	li $v1, 4
	move $s0, $v1
	mul $s0, $s2, $s0
	move $s0, $s0
	li $v1, 1
	move $s2, $v1
	li $v1, 4
	move $s5, $v1
	mul $s5, $s2, $s5
	move $s3, $s5
	add $s3, $s1, $s3
	lw $s3, 0($s3)
	lw $s1, 0($s3)
	li $v1, 1
	move $s5, $v1
	sub $s5, $s1, $s5
	move $s5, $s5
	li $v1, 1
	move $s1, $v1
	sle $s5, $s0, $s5
	sub $s5, $s1, $s5
	beqz $s5, L42
	jal _error
L42:
	nop
	li $v1, 4
	move $s5, $v1
	add $s5, $s0, $s5
	add $s5, $s3, $s5
	li $v1, 5
	move $s3, $v1
	sw $s3, 0($s5)
	li $v1, 0
	move $s3, $v1
	move $v0, $s3
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s5, -32($fp)
	lw $s6, -36($fp)
	lw $s7, -40($fp)
	addu $sp, $sp, 36
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl _halloc
_halloc:
	li $v0, 9
	syscall
	jr $ra

	.text
	.globl _error
_error:
	li $v0, 4
	syscall
	li $v0, 10
	syscall

	.text
	.globl _print
_print:
	li $v0, 1
	syscall
	la $a0, newline
	li $v0, 4
	syscall
	jr $ra

	.text
	.globl _exitret
_exitret:
	li $v0, 10
	syscall

	.data
	.align 0
newline: 	.asciiz "\n"

	.data
	.align 0
error_msg:	.asciiz " ERROR : Abnormally terminated!\n "
