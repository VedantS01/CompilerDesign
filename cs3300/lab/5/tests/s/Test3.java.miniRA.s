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
	li $s0, 8
	move $a0, $s0
	jal _halloc
	move $s2, $v0
	la $s0, Test_next
	sw $s0, 4($s2)
	la $s0, Test_start
	sw $s0, 0($s2)
	sw $s2, 0($s1)
	lw $s0, 0($s1)
	lw $s2, 0($s0)
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
	subu $sp, $sp, 28
	sw $s3, -24($fp)
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	move $s0, $a0
	li $s1, 1
	sw $s1, 4($s0)
	move $s1, $s0
	sw $s1, 8($s0)
	lw $s1, 8($s0)
	lw $s2, 0($s1)
	lw $s3, 4($s2)
	move $a0, $s1
	jalr $s3
	move $s2, $v0
	sw $s2, 4($s0)
	li $s0, 0
	move $v0, $s0
	lw $s3, -24($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	addu $sp, $sp, 28
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Test_next
Test_next:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 24
	sw $s3, -24($fp)
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	move $s0, $a0
	lw $s1, 4($s0)
	xori $s2, $s1, 1
	li $s1, 1
	beqz $s1, L1
	li $s1, 7
	li $s2, 7
	sle $s3, $s1, $s2
	beqz $s3, L1
	li $s1, 1
	b L2
L1:
	li $s1, 0
L2:
	nop
	beqz $s1, L3
	lw $s1, 4($s0)
	xori $s0, $s1, 1
	beqz $s0, L3
	li $s0, 1
	b L4
L3:
	li $s0, 0
L4:
	nop
	move $s1, $s0
	move $v0, $s1
	lw $s3, -24($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
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
