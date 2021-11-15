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
	subu $sp, $sp, 24
	sw $s3, -24($fp)
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	move $s0, $a0
	move $s1, $a1
	move $s2, $s1
	add $s3, $s1, $s2
	sw $s3, 12($s0)
	lw $s1, 12($s0)
	li $s2, 2
	add $s3, $s1, $s2
	lw $s1, 12($s0)
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
	.globl Base_get
Base_get:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 20
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	move $s0, $a0
	li $s1, 0
	sw $s1, 12($s0)
	lw $s1, 12($s0)
	li $s0, 30
	add $s2, $s1, $s0
	move $v0, $s2
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	addu $sp, $sp, 20
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Derived_set
Derived_set:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 28
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	move $s0, $a0
	move $s1, $a1
	li $s2, 1
	move $s3, $s2
L1:
	nop
	li $s2, 3
	sle $s4, $s3, $s2
	beqz $s4, L2
	move $a0, $s3
	jal _print
	li $s2, 1
	add $s4, $s3, $s2
	move $s3, $s4
	li $s2, 1
	sub $s4, $s1, $s2
	move $s1, $s4
	b L1
L2:
	nop
	move $a0, $s1
	jal _print
	li $s2, 4
	mul $s3, $s1, $s2
	sw $s3, 12($s0)
	lw $s1, 12($s0)
	move $v0, $s1
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	addu $sp, $sp, 28
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Derived_shortCircuit
Derived_shortCircuit:
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
	li $s2, 20
	addi $s3, $s2, 1
	mul $s4, $s3, 4
	move $a0, $s4
	jal _halloc
	move $s3, $v0
	sw $s2, 0($s3)
	move $s2, $s3
	li $s3, 2
	li $s4, 11
	mul $s5, $s3, 4
	add $s3, $s2, $s5
	sw $s4, 4($s3)
	b L3
	move $s3, $s0
	lw $s0, 0($s3)
	lw $s4, 12($s0)
	li $s0, 99
	move $a0, $s3
	move $a1, $s0
	jalr $s4
	move $s5, $v0
	xori $s0, $s5, 1
	beqz $s0, L3
	li $s0, 999
	move $a0, $s0
	jal _print
	b L4
L3:
	nop
	li $s0, 2
	mul $s3, $s0, 4
	add $s0, $s2, $s3
	lw $s3, 4($s0)
	move $a0, $s3
	jal _print
	lw $s0, 0($s2)
	move $a0, $s0
	jal _print
L4:
	nop
	li $s0, 1
	move $v0, $s0
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
	.globl Derived_printInt
Derived_printInt:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 16
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	move $s0, $a0
	move $s1, $a1
	move $a0, $s1
	jal _print
	li $s1, 1
	move $v0, $s1
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	addu $sp, $sp, 16
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Test_Start
Test_Start:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 48
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	sw $s5, -32($fp)
	sw $s6, -36($fp)
	sw $s7, -40($fp)
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	move $s0, $a0
	li $s2, 20
	move $a0, $s2
	jal _halloc
	move $s3, $v0
	li $s2, 16
	move $a0, $s2
	jal _halloc
	move $s4, $v0
	la $s2, Derived_set
	sw $s2, 0($s4)
	la $s2, Base_get
	sw $s2, 4($s4)
	la $s2, Derived_shortCircuit
	sw $s2, 8($s4)
	la $s2, Derived_printInt
	sw $s2, 12($s4)
	sw $s4, 0($s3)
	move $s2, $s3
	move $s3, $s2
	lw $s4, 0($s3)
	lw $s5, 0($s4)
	li $s4, 16
	move $a0, $s4
	jal _halloc
	move $s6, $v0
	li $s4, 8
	move $a0, $s4
	jal _halloc
	move $s7, $v0
	la $s4, Base_get
	sw $s4, 4($s7)
	la $s4, Base_set
	sw $s4, 0($s7)
	sw $s7, 0($s6)
	lw $s4, 0($s6)
	lw $s7, 4($s4)
	move $a0, $s6
	jalr $s7
	move $s4, $v0
	move $a0, $s3
	move $a1, $s4
	jalr $s5
	move $s6, $v0
	move $a0, $s6
	jal _print
	lw $s3, 0($s2)
	lw $s4, 8($s3)
	move $a0, $s2
	jalr $s4
	move $s3, $v0
	li $s2, 1
	move $v0, $s2
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s5, -32($fp)
	lw $s6, -36($fp)
	lw $s7, -40($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	addu $sp, $sp, 48
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
