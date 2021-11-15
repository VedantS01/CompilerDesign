	.text
	.globl main
main:
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 8
	li $s0, 12
	move $a0, $s0
	jal _halloc
	move $s0, $v0
	li $s1, 12
	move $a0, $s1
	jal _halloc
	move $s1, $v0
	la $s2, Test_mutual1
	sw $s2, 4($s1)
	la $s2, Test_start
	sw $s2, 8($s1)
	la $s2, Test_mutual2
	sw $s2, 0($s1)
	sw $s1, 0($s0)
	lw $s1, 0($s0)
	lw $s1, 8($s1)
	move $a0, $s0
	jalr $s1
	move $s1, $v0
	move $a0, $s1
	jal _print
	addu $sp, $sp, 8
	lw $ra, -4($sp)
	jal _exitret
	.text
	.globl Test_start
Test_start:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 16
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	move $s0, $a0
	li $s1, 4
	sw $s1, 4($s0)
	li $s1, 0
	sw $s1, 8($s0)
	lw $s1, 0($s0)
	lw $s1, 4($s1)
	move $a0, $s0
	jalr $s1
	move $s1, $v0
	move $v0, $s1
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	addu $sp, $sp, 16
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Test_mutual1
Test_mutual1:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 24
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	sw $s3, -24($fp)
	move $s0, $a0
	lw $s1, 4($s0)
	li $s2, 1
	sub $s2, $s1, $s2
	sw $s2, 4($s0)
	lw $s2, 4($s0)
	li $s1, 0
	li $s3, 1
	sub $s3, $s1, $s3
	sle $s3, $s2, $s3
	beqz $s3, L1
	li $s3, 0
	sw $s3, 8($s0)
	b L0
L1:
	nop
	lw $s3, 8($s0)
	move $a0, $s3
	jal _print
	li $s3, 1
	sw $s3, 8($s0)
	move $s3, $s0
	lw $s2, 0($s3)
	lw $s2, 0($s2)
	move $a0, $s3
	jalr $s2
	move $s2, $v0
L0:
	nop
	lw $s0, 8($s0)
	move $v0, $s0
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	lw $s3, -24($fp)
	addu $sp, $sp, 24
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Test_mutual2
Test_mutual2:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 24
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	sw $s3, -24($fp)
	move $s0, $a0
	lw $s1, 4($s0)
	li $s2, 1
	sub $s2, $s1, $s2
	sw $s2, 4($s0)
	lw $s2, 4($s0)
	li $s1, 0
	li $s3, 1
	sub $s3, $s1, $s3
	sle $s3, $s2, $s3
	beqz $s3, L3
	li $s3, 0
	sw $s3, 8($s0)
	b L2
L3:
	nop
	lw $s3, 8($s0)
	move $a0, $s3
	jal _print
	li $s3, 0
	sw $s3, 8($s0)
	move $s3, $s0
	lw $s2, 0($s3)
	lw $s2, 4($s2)
	move $a0, $s3
	jalr $s2
	move $s2, $v0
L2:
	nop
	lw $s0, 8($s0)
	move $v0, $s0
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	lw $s3, -24($fp)
	addu $sp, $sp, 24
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
