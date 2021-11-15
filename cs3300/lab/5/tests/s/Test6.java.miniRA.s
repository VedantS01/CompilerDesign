	.text
	.globl main
main:
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 24
	li $s0, 12
	move $a0, $s0
	jal _halloc
	move $s1, $v0
	li $s0, 12
	move $a0, $s0
	jal _halloc
	move $s2, $v0
	la $s0, Test_mutual1
	sw $s0, 4($s2)
	la $s0, Test_start
	sw $s0, 8($s2)
	la $s0, Test_mutual2
	sw $s0, 0($s2)
	sw $s2, 0($s1)
	lw $s0, 0($s1)
	lw $s2, 8($s0)
	move $a0, $s1
	jalr $s2
	move $s0, $v0
	move $a0, $s0
	jal _print
	addu $sp, $sp, 24
	lw $ra, -4($sp)
	jal _exitret
	.text
	.globl Test_start
Test_start:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 24
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	move $s0, $a0
	li $s1, 4
	sw $s1, 4($s0)
	li $s1, 0
	sw $s1, 8($s0)
	move $s1, $s0
	lw $s0, 0($s1)
	lw $s2, 4($s0)
	move $a0, $s1
	jalr $s2
	move $s0, $v0
	move $v0, $s0
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	addu $sp, $sp, 24
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Test_mutual1
Test_mutual1:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 36
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	sw $s5, -32($fp)
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	move $s0, $a0
	lw $s2, 4($s0)
	li $s3, 1
	sub $s4, $s2, $s3
	sw $s4, 4($s0)
	lw $s2, 4($s0)
	li $s3, 0
	li $s4, 1
	sub $s5, $s3, $s4
	sle $s3, $s2, $s5
	beqz $s3, L1
	li $s2, 0
	sw $s2, 8($s0)
	b L2
L1:
	nop
	lw $s2, 8($s0)
	move $a0, $s2
	jal _print
	li $s2, 1
	sw $s2, 8($s0)
	move $s2, $s0
	lw $s3, 0($s2)
	lw $s4, 0($s3)
	move $a0, $s2
	jalr $s4
	move $s3, $v0
L2:
	nop
	lw $s2, 8($s0)
	move $v0, $s2
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s5, -32($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	addu $sp, $sp, 36
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Test_mutual2
Test_mutual2:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 36
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	sw $s5, -32($fp)
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	move $s0, $a0
	lw $s2, 4($s0)
	li $s3, 1
	sub $s4, $s2, $s3
	sw $s4, 4($s0)
	lw $s2, 4($s0)
	li $s3, 0
	li $s4, 1
	sub $s5, $s3, $s4
	sle $s3, $s2, $s5
	beqz $s3, L3
	li $s2, 0
	sw $s2, 8($s0)
	b L4
L3:
	nop
	lw $s2, 8($s0)
	move $a0, $s2
	jal _print
	li $s2, 0
	sw $s2, 8($s0)
	move $s2, $s0
	lw $s3, 0($s2)
	lw $s4, 4($s3)
	move $a0, $s2
	jalr $s4
	move $s3, $v0
L4:
	nop
	lw $s2, 8($s0)
	move $v0, $s2
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s5, -32($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
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
