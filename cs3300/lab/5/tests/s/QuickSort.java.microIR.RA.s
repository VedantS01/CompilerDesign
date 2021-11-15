	.text
	.globl main
main:
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 12
	li $s0, 12
	move $a0, $s0
	jal _halloc
	move $s0, $v0
	li $s1, 16
	move $a0, $s1
	jal _halloc
	move $s1, $v0
	la $s2, QS_Sort
	sw $s2, 12($s1)
	la $s2, QS_Start
	sw $s2, 0($s1)
	la $s2, QS_Init
	sw $s2, 4($s1)
	la $s2, QS_Print
	sw $s2, 8($s1)
	sw $s1, 0($s0)
	lw $s1, 0($s0)
	lw $s1, 0($s1)
	li $s2, 10
	move $a0, $s0
	move $a1, $s2
	jalr $s1
	move $s2, $v0
	move $a0, $s2
	jal _print
	addu $sp, $sp, 12
	lw $ra, -4($sp)
	jal _exitret
	.text
	.globl QS_Start
QS_Start:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 36
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	move $s0, $a1
	move $s1, $a0
	move $s2, $s1
	lw $s3, 0($s2)
	lw $s3, 4($s3)
	move $a0, $s2
	move $a1, $s0
	jalr $s3
	move $s3, $v0
	move $s2, $s1
	lw $s0, 0($s2)
	lw $s0, 8($s0)
	move $a0, $s2
	jalr $s0
	move $s0, $v0
	move $s3, $s0
	li $s0, 9999
	move $a0, $s0
	jal _print
	lw $s0, 8($s1)
	li $s2, 1
	sub $s2, $s0, $s2
	move $s3, $s2
	move $s2, $s1
	lw $s0, 0($s2)
	lw $s0, 12($s0)
	li $s4, 0
	move $a0, $s2
	move $a1, $s4
	move $a2, $s3
	jalr $s0
	move $s4, $v0
	move $s3, $s4
	lw $s4, 0($s1)
	lw $s4, 8($s4)
	move $a0, $s1
	jalr $s4
	move $s4, $v0
	move $s3, $s4
	li $s4, 0
	move $v0, $s4
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	addu $sp, $sp, 36
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl QS_Sort
QS_Sort:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 64
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	sw $s5, -32($fp)
	sw $s6, -36($fp)
	sw $s7, -40($fp)
	move $s0, $a2
	move $s1, $a1
	move $s2, $a0
	li $s3, 0
	sle $s4, $s1, $s0
	beqz $s4, L1
	xor $s4, $s1, $s0
	beqz $s4, L1
	lw $s4, 4($s2)
	mul $s5, $s0, 4
	add $s5, $s4, $s5
	lw $s5, 4($s5)
	li $s4, 1
	sub $s4, $s1, $s4
	move $s6, $s0
	li $s7, 1
L2:
	nop
	beqz $s7, L3
	li $t0, 1
L4:
	nop
	beqz $t0, L5
	li $t1, 1
	add $t1, $s4, $t1
	move $s4, $t1
	lw $t1, 4($s2)
	mul $t2, $s4, 4
	add $t2, $t1, $t2
	lw $t2, 4($t2)
	li $t1, 1
	sub $t1, $s5, $t1
	sle $t1, $t2, $t1
	xori $t1, $t1, 1
	beqz $t1, L7
	li $t1, 0
	move $t0, $t1
	b L6
L7:
	nop
	li $t1, 1
	move $t0, $t1
L6:
	nop
	b L4
L5:
	nop
	li $t1, 1
	move $t0, $t1
L8:
	nop
	beqz $t0, L9
	li $t1, 1
	sub $t1, $s6, $t1
	move $s6, $t1
	lw $t1, 4($s2)
	mul $t3, $s6, 4
	add $t3, $t1, $t3
	lw $t3, 4($t3)
	move $t2, $t3
	li $t3, 1
	sub $t3, $t2, $t3
	sle $t3, $s5, $t3
	xori $t3, $t3, 1
	beqz $t3, L11
	li $t3, 0
	move $t0, $t3
	b L10
L11:
	nop
	li $t3, 1
	move $t0, $t3
L10:
	nop
	b L8
L9:
	nop
	lw $t0, 4($s2)
	mul $t3, $s4, 4
	add $t3, $t0, $t3
	lw $t3, 4($t3)
	move $s3, $t3
	lw $t3, 4($s2)
	mul $t0, $s6, 4
	add $t0, $t3, $t0
	lw $t0, 4($t0)
	lw $t3, 4($s2)
	mul $t2, $s4, 4
	add $t2, $t3, $t2
	sw $t0, 4($t2)
	lw $t2, 4($s2)
	mul $t0, $s6, 4
	add $t0, $t2, $t0
	sw $s3, 4($t0)
	sle $t0, $s6, $s4
	beqz $t0, L13
	li $t0, 0
	move $s7, $t0
	b L12
L13:
	nop
	li $t0, 1
	move $s7, $t0
L12:
	nop
	b L2
L3:
	nop
	lw $s7, 4($s2)
	mul $s5, $s4, 4
	add $s5, $s7, $s5
	lw $s5, 4($s5)
	lw $s7, 4($s2)
	mul $s6, $s6, 4
	add $s6, $s7, $s6
	sw $s5, 4($s6)
	lw $s6, 4($s2)
	mul $s5, $s0, 4
	add $s5, $s6, $s5
	lw $s5, 4($s5)
	lw $s6, 4($s2)
	mul $s7, $s4, 4
	add $s7, $s6, $s7
	sw $s5, 4($s7)
	lw $s7, 4($s2)
	mul $s5, $s0, 4
	add $s5, $s7, $s5
	sw $s3, 4($s5)
	move $s5, $s2
	lw $s3, 0($s5)
	lw $s3, 12($s3)
	li $s7, 1
	sub $s7, $s4, $s7
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	sw $t2, -52($fp)
	sw $t3, -56($fp)
	move $a0, $s5
	move $a1, $s1
	move $a2, $s7
	jalr $s3
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	lw $t2, -52($fp)
	lw $t3, -56($fp)
	move $s7, $v0
	lw $s3, 0($s2)
	lw $s3, 12($s3)
	li $s5, 1
	add $s5, $s4, $s5
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	sw $t2, -52($fp)
	sw $t3, -56($fp)
	move $a0, $s2
	move $a1, $s5
	move $a2, $s0
	jalr $s3
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	lw $t2, -52($fp)
	lw $t3, -56($fp)
	move $s5, $v0
	move $s7, $s5
	b L0
L1:
	nop
	li $s5, 0
	move $s7, $s5
L0:
	nop
	li $s5, 0
	move $v0, $s5
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s5, -32($fp)
	lw $s6, -36($fp)
	lw $s7, -40($fp)
	addu $sp, $sp, 64
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl QS_Print
QS_Print:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 20
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	sw $s3, -24($fp)
	move $s0, $a0
	li $s1, 0
L14:
	nop
	lw $s2, 8($s0)
	li $s3, 1
	sub $s3, $s2, $s3
	sle $s3, $s1, $s3
	beqz $s3, L15
	lw $s3, 4($s0)
	mul $s2, $s1, 4
	add $s2, $s3, $s2
	lw $s2, 4($s2)
	move $a0, $s2
	jal _print
	li $s2, 1
	add $s2, $s1, $s2
	move $s1, $s2
	b L14
L15:
	nop
	li $s1, 0
	move $v0, $s1
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	lw $s3, -24($fp)
	addu $sp, $sp, 20
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl QS_Init
QS_Init:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 20
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	sw $s3, -24($fp)
	move $s0, $a1
	move $s1, $a0
	sw $s0, 8($s1)
	addi $s2, $s0, 1
	mul $s2, $s2, 4
	move $a0, $s2
	jal _halloc
	move $s2, $v0
	sw $s0, 0($s2)
	sw $s2, 4($s1)
	li $s2, 0
	li $s0, 20
	lw $s3, 4($s1)
	mul $s2, $s2, 4
	add $s2, $s3, $s2
	sw $s0, 4($s2)
	li $s2, 1
	li $s0, 7
	lw $s3, 4($s1)
	mul $s2, $s2, 4
	add $s2, $s3, $s2
	sw $s0, 4($s2)
	li $s2, 2
	li $s0, 12
	lw $s3, 4($s1)
	mul $s2, $s2, 4
	add $s2, $s3, $s2
	sw $s0, 4($s2)
	li $s2, 3
	li $s0, 18
	lw $s3, 4($s1)
	mul $s2, $s2, 4
	add $s2, $s3, $s2
	sw $s0, 4($s2)
	li $s2, 4
	li $s0, 2
	lw $s3, 4($s1)
	mul $s2, $s2, 4
	add $s2, $s3, $s2
	sw $s0, 4($s2)
	li $s2, 5
	li $s0, 11
	lw $s3, 4($s1)
	mul $s2, $s2, 4
	add $s2, $s3, $s2
	sw $s0, 4($s2)
	li $s2, 6
	li $s0, 6
	lw $s3, 4($s1)
	mul $s2, $s2, 4
	add $s2, $s3, $s2
	sw $s0, 4($s2)
	li $s2, 7
	li $s0, 9
	lw $s3, 4($s1)
	mul $s2, $s2, 4
	add $s2, $s3, $s2
	sw $s0, 4($s2)
	li $s2, 8
	li $s0, 19
	lw $s3, 4($s1)
	mul $s2, $s2, 4
	add $s2, $s3, $s2
	sw $s0, 4($s2)
	li $s2, 9
	li $s0, 5
	lw $s1, 4($s1)
	mul $s2, $s2, 4
	add $s2, $s1, $s2
	sw $s0, 4($s2)
	li $s2, 0
	move $v0, $s2
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	lw $s3, -24($fp)
	addu $sp, $sp, 20
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
