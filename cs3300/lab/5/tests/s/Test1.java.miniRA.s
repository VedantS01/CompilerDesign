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
	la $s0, Test_start
	sw $s0, 0($s2)
	la $s0, Test_next
	sw $s0, 4($s2)
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
	subu $sp, $sp, 36
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	move $s0, $a0
	li $s1, 12
	move $a0, $s1
	jal _halloc
	move $s2, $v0
	li $s1, 8
	move $a0, $s1
	jal _halloc
	move $s3, $v0
	la $s1, Test_start
	sw $s1, 0($s3)
	la $s1, Test_next
	sw $s1, 4($s3)
	sw $s3, 0($s2)
	sw $s2, 4($s0)
	lw $s1, 4($s0)
	lw $s2, 0($s1)
	lw $s3, 4($s2)
	move $s2, $s0
	move $a0, $s1
	move $a1, $s2
	jalr $s3
	move $s4, $v0
	sw $s4, 8($s0)
	li $s0, 0
	move $v0, $s0
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	addu $sp, $sp, 36
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Test_next
Test_next:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 20
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	move $s0, $a0
	move $s1, $a1
	li $s2, 0
	move $v0, $s2
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
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
