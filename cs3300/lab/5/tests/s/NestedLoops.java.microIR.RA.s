	.text
	.globl main
main:
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 16
	li $s0, 4
	move $a0, $s0
	jal _halloc
	move $s0, $v0
	li $s1, 4
	move $a0, $s1
	jal _halloc
	move $s1, $v0
	la $s2, Base_loop
	sw $s2, 0($s1)
	sw $s1, 0($s0)
	lw $s1, 0($s0)
	lw $s1, 0($s1)
	li $s2, 1
	li $s3, 2
	move $a0, $s0
	move $a1, $s2
	move $a2, $s3
	jalr $s1
	move $s3, $v0
	move $a0, $s3
	jal _print
	addu $sp, $sp, 16
	lw $ra, -4($sp)
	jal _exitret
	.text
	.globl Base_loop
Base_loop:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 28
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	sw $s5, -32($fp)
	move $s0, $a2
	move $s1, $a1
	li $s2, 0
	li $s3, 0
L0:
	nop
	li $s4, 1
	sle $s4, $s3, $s4
	beqz $s4, L1
	li $s4, 1
	add $s4, $s3, $s4
	move $s3, $s4
	li $s4, 1
	add $s4, $s1, $s4
	move $s2, $s4
	li $s4, 1
	add $s4, $s0, $s4
	move $s1, $s4
	li $s4, 0
L2:
	nop
	li $s5, 1
	sle $s5, $s4, $s5
	beqz $s5, L3
	li $s5, 1
	add $s5, $s4, $s5
	move $s4, $s5
	add $s5, $s2, $s0
	move $s2, $s5
	b L2
L3:
	nop
	li $s4, 2
	mul $s4, $s0, $s4
	move $s0, $s4
	b L0
L1:
	nop
	add $s2, $s1, $s2
	move $v0, $s2
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s5, -32($fp)
	addu $sp, $sp, 28
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
