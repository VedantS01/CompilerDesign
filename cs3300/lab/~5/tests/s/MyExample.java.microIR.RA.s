	.text
	.globl main
main:
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 8
	li $s0, 4
	move $a0, $s0
	jal _halloc
	move $s0, $v0
	li $s1, 4
	move $a0, $s1
	jal _halloc
	move $s1, $v0
	la $s2, Test_Start
	sw $s2, 0($s1)
	sw $s1, 0($s0)
	lw $s1, 0($s0)
	lw $s1, 0($s1)
	move $a0, $s0
	jalr $s1
	move $s1, $v0
	move $a0, $s1
	jal _print
	addu $sp, $sp, 8
	lw $ra, -4($sp)
	jal _exitret
	.text
	.globl Base_set
Base_set:
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
	move $s2, $s0
	add $s2, $s0, $s2
	sw $s2, 12($s1)
	lw $s2, 12($s1)
	li $s3, 2
	add $s3, $s2, $s3
	move $s0, $s3
	lw $s1, 12($s1)
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
	.globl Base_get
Base_get:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 12
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	move $s0, $a0
	li $s1, 0
	sw $s1, 12($s0)
	lw $s0, 12($s0)
	li $s1, 30
	add $s1, $s0, $s1
	move $v0, $s1
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	addu $sp, $sp, 12
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Derived_set
Derived_set:
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
	li $s2, 1
L0:
	nop
	li $s3, 3
	sle $s3, $s2, $s3
	beqz $s3, L1
	move $a0, $s2
	jal _print
	li $s3, 1
	add $s3, $s2, $s3
	move $s2, $s3
	li $s3, 1
	sub $s3, $s0, $s3
	move $s0, $s3
	b L0
L1:
	nop
	move $a0, $s0
	jal _print
	li $s2, 4
	mul $s2, $s0, $s2
	sw $s2, 12($s1)
	lw $s1, 12($s1)
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
	.globl Derived_shortCircuit
Derived_shortCircuit:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 28
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	sw $s3, -24($fp)
	move $s2, $a0
	li $s0, 20
	addi $s1, $s0, 1
	mul $s1, $s1, 4
	move $a0, $s1
	jal _halloc
	move $s1, $v0
	sw $s0, 0($s1)
	li $s0, 2
	li $s2, 11
	mul $s0, $s0, 4
	add $s0, $s1, $s0
	sw $s2, 4($s0)
	li $s0, 0
	b L3
	move $s0, $s2
	lw $s2, 0($s0)
	lw $s2, 12($s2)
	li $s3, 99
	move $a0, $s0
	move $a1, $s3
	jalr $s2
	move $s3, $v0
	xori $s3, $s3, 1
	beqz $s3, L3
	li $s3, 999
	move $a0, $s3
	jal _print
	b L2
L3:
	nop
	li $s3, 2
	mul $s3, $s3, 4
	add $s3, $s1, $s3
	lw $s3, 4($s3)
	move $a0, $s3
	jal _print
	lw $s1, 0($s1)
	move $a0, $s1
	jal _print
L2:
	nop
	li $s1, 1
	move $v0, $s1
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	lw $s3, -24($fp)
	addu $sp, $sp, 28
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Derived_printInt
Derived_printInt:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 8
	sw $s0, -12($fp)
	move $s0, $a1
	move $a0, $s0
	jal _print
	li $s0, 1
	move $v0, $s0
	lw $s0, -12($fp)
	addu $sp, $sp, 8
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Test_Start
Test_Start:
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
	li $s0, 20
	move $a0, $s0
	jal _halloc
	move $s0, $v0
	li $s1, 16
	move $a0, $s1
	jal _halloc
	move $s1, $v0
	la $s2, Derived_set
	sw $s2, 0($s1)
	la $s2, Base_get
	sw $s2, 4($s1)
	la $s2, Derived_shortCircuit
	sw $s2, 8($s1)
	la $s2, Derived_printInt
	sw $s2, 12($s1)
	sw $s1, 0($s0)
	move $s1, $s0
	lw $s2, 0($s1)
	lw $s2, 0($s2)
	li $s3, 16
	move $a0, $s3
	jal _halloc
	move $s3, $v0
	li $s4, 8
	move $a0, $s4
	jal _halloc
	move $s4, $v0
	la $s5, Base_get
	sw $s5, 4($s4)
	la $s5, Base_set
	sw $s5, 0($s4)
	sw $s4, 0($s3)
	lw $s4, 0($s3)
	lw $s4, 4($s4)
	move $a0, $s3
	jalr $s4
	move $s4, $v0
	move $a0, $s1
	move $a1, $s4
	jalr $s2
	move $s4, $v0
	move $a0, $s4
	jal _print
	lw $s4, 0($s0)
	lw $s4, 8($s4)
	move $a0, $s0
	jalr $s4
	move $s4, $v0
	li $s4, 1
	move $v0, $s4
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s5, -32($fp)
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
