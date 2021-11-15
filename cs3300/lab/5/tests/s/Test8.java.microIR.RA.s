	.text
	.globl main
main:
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 8
	li $s0, 24
	move $a0, $s0
	jal _halloc
	move $s0, $v0
	li $s1, 4
	move $a0, $s1
	jal _halloc
	move $s1, $v0
	la $s2, Operator_compute
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
	.globl Operator_compute
Operator_compute:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 12
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	move $s0, $a0
	li $s1, 1
	sw $s1, 16($s0)
	li $s1, 0
	sw $s1, 20($s0)
	lw $s1, 16($s0)
	beqz $s1, L0
	lw $s1, 20($s0)
	beqz $s1, L0
	li $s1, 1
	b L1
L0:
	li $s1, 0
L1:
	nop
	sw $s1, 4($s0)
	li $s1, 0
	move $v0, $s1
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	addu $sp, $sp, 12
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
