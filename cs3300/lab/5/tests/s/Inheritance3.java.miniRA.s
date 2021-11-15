	.text
	.globl main
main:
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 24
	li $s0, 4
	move $a0, $s0
	jal _halloc
	move $s1, $v0
	li $s0, 4
	move $a0, $s0
	jal _halloc
	move $s2, $v0
	la $s0, Test_Start
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
	.globl Base_set
Base_set:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 16
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	move $s0, $a0
	move $s1, $a1
	sw $s1, 4($s0)
	lw $s1, 4($s0)
	move $v0, $s1
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	addu $sp, $sp, 16
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Base_get
Base_get:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 16
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	move $s0, $a0
	lw $s1, 4($s0)
	move $v0, $s1
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	addu $sp, $sp, 16
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Derived_set
Derived_set:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 24
	sw $s3, -24($fp)
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	move $s0, $a0
	move $s1, $a1
	li $s2, 2
	mul $s3, $s1, $s2
	sw $s3, 4($s0)
	lw $s1, 4($s0)
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
	.globl Test_Start
Test_Start:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 40
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	sw $s5, -32($fp)
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	move $s0, $a0
	li $s1, 8
	move $a0, $s1
	jal _halloc
	move $s2, $v0
	li $s1, 8
	move $a0, $s1
	jal _halloc
	move $s3, $v0
	la $s1, Base_get
	sw $s1, 4($s3)
	la $s1, Base_set
	sw $s1, 0($s3)
	sw $s3, 0($s2)
	li $s1, 12
	move $a0, $s1
	jal _halloc
	move $s2, $v0
	li $s1, 8
	move $a0, $s1
	jal _halloc
	move $s3, $v0
	la $s1, Base_get
	sw $s1, 4($s3)
	la $s1, Derived_set
	sw $s1, 0($s3)
	sw $s3, 0($s2)
	move $s1, $s2
	move $s2, $s1
	lw $s3, 0($s2)
	lw $s4, 0($s3)
	li $s3, 1
	move $a0, $s2
	move $a1, $s3
	jalr $s4
	move $s5, $v0
	move $a0, $s5
	jal _print
	lw $s3, 0($s2)
	lw $s4, 0($s3)
	li $s3, 3
	move $a0, $s2
	move $a1, $s3
	jalr $s4
	move $s5, $v0
	move $a0, $s5
	jal _print
	lw $s2, 0($s1)
	lw $s3, 0($s2)
	li $s2, 1
	move $a0, $s1
	move $a1, $s2
	jalr $s3
	move $s4, $v0
	move $a0, $s4
	jal _print
	lw $s2, 0($s1)
	lw $s3, 0($s2)
	li $s2, 3
	move $a0, $s1
	move $a1, $s2
	jalr $s3
	move $s4, $v0
	move $a0, $s4
	jal _print
	li $s1, 1
	move $v0, $s1
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s5, -32($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	addu $sp, $sp, 40
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
