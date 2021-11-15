	.text
	.globl main
main:
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 32
	li $s0, 4
	move $a0, $s0
	jal _halloc
	move $s1, $v0
	li $s0, 4
	move $a0, $s0
	jal _halloc
	move $s2, $v0
	la $s0, Test_start
	sw $s0, 0($s2)
	sw $s2, 0($s1)
	lw $s0, 0($s1)
	lw $s2, 0($s0)
	li $s0, 10
	move $a0, $s1
	move $a1, $s0
	jalr $s2
	move $s3, $v0
	move $a0, $s3
	jal _print
	addu $sp, $sp, 32
	lw $ra, -4($sp)
	jal _exitret
	.text
	.globl Test_start
Test_start:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 32
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	sw $s5, -32($fp)
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	move $s0, $a0
	move $s1, $a1
	addi $s2, $s1, 1
	mul $s3, $s2, 4
	move $a0, $s3
	jal _halloc
	move $s2, $v0
	sw $s1, 0($s2)
	move $s1, $s2
	lw $s2, 0($s1)
	move $s3, $s2
	li $s2, 0
	move $s4, $s2
L1:
	nop
	li $s2, 1
	sub $s5, $s3, $s2
	sle $s2, $s4, $s5
	beqz $s2, L2
	mul $s2, $s4, 4
	add $s5, $s1, $s2
	sw $s4, 4($s5)
	mul $s2, $s4, 4
	add $s5, $s1, $s2
	lw $s2, 4($s5)
	move $a0, $s2
	jal _print
	li $s2, 1
	add $s5, $s4, $s2
	move $s4, $s5
	b L1
L2:
	nop
	li $s1, 1
	move $v0, $s1
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s5, -32($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	addu $sp, $sp, 32
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
