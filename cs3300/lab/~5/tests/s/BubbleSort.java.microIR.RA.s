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
	la $s2, BBS_Print
	sw $s2, 8($s1)
	la $s2, BBS_Sort
	sw $s2, 12($s1)
	la $s2, BBS_Start
	sw $s2, 0($s1)
	la $s2, BBS_Init
	sw $s2, 4($s1)
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
	.globl BBS_Start
BBS_Start:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 28
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	sw $s3, -24($fp)
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
	li $s0, 99999
	move $a0, $s0
	jal _print
	move $s0, $s1
	lw $s2, 0($s0)
	lw $s2, 12($s2)
	move $a0, $s0
	jalr $s2
	move $s2, $v0
	move $s3, $s2
	lw $s2, 0($s1)
	lw $s2, 8($s2)
	move $a0, $s1
	jalr $s2
	move $s2, $v0
	move $s3, $s2
	li $s2, 0
	move $v0, $s2
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	lw $s3, -24($fp)
	addu $sp, $sp, 28
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl BBS_Sort
BBS_Sort:
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
	lw $s1, 8($s0)
	li $s2, 1
	sub $s2, $s1, $s2
	li $s1, 0
	li $s3, 1
	sub $s3, $s1, $s3
L0:
	nop
	li $s1, 1
	sub $s1, $s2, $s1
	sle $s1, $s3, $s1
	beqz $s1, L1
	li $s1, 1
L2:
	nop
	sle $s4, $s1, $s2
	beqz $s4, L3
	li $s4, 1
	sub $s4, $s1, $s4
	lw $s5, 4($s0)
	mul $s4, $s4, 4
	add $s4, $s5, $s4
	lw $s4, 4($s4)
	lw $s5, 4($s0)
	mul $s6, $s1, 4
	add $s6, $s5, $s6
	lw $s6, 4($s6)
	li $s5, 1
	sub $s5, $s4, $s5
	sle $s5, $s6, $s5
	beqz $s5, L5
	li $s5, 1
	sub $s5, $s1, $s5
	lw $s6, 4($s0)
	mul $s4, $s5, 4
	add $s4, $s6, $s4
	lw $s4, 4($s4)
	lw $s6, 4($s0)
	mul $s7, $s1, 4
	add $s7, $s6, $s7
	lw $s7, 4($s7)
	lw $s6, 4($s0)
	mul $s5, $s5, 4
	add $s5, $s6, $s5
	sw $s7, 4($s5)
	lw $s5, 4($s0)
	mul $s7, $s1, 4
	add $s7, $s5, $s7
	sw $s4, 4($s7)
	b L4
L5:
	nop
	li $s7, 0
L4:
	nop
	li $s7, 1
	add $s7, $s1, $s7
	move $s1, $s7
	b L2
L3:
	nop
	li $s1, 1
	sub $s1, $s2, $s1
	move $s2, $s1
	b L0
L1:
	nop
	li $s3, 0
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
	.globl BBS_Print
BBS_Print:
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
L6:
	nop
	lw $s2, 8($s0)
	li $s3, 1
	sub $s3, $s2, $s3
	sle $s3, $s1, $s3
	beqz $s3, L7
	lw $s3, 4($s0)
	mul $s2, $s1, 4
	add $s2, $s3, $s2
	lw $s2, 4($s2)
	move $a0, $s2
	jal _print
	li $s2, 1
	add $s2, $s1, $s2
	move $s1, $s2
	b L6
L7:
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
	.globl BBS_Init
BBS_Init:
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
