	.text
	.globl main
main:
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 40
	li $s0, 4
	move $a0, $s0
	jal _halloc
	move $s1, $v0
	li $s0, 4
	move $a0, $s0
	jal _halloc
	move $s2, $v0
	la $s0, Base_loop
	sw $s0, 0($s2)
	sw $s2, 0($s1)
	lw $s0, 0($s1)
	lw $s2, 0($s0)
	li $s0, 1
	li $s3, 2
	move $a0, $s1
	move $a1, $s0
	move $a2, $s3
	jalr $s2
	move $s4, $v0
	move $a0, $s4
	jal _print
	addu $sp, $sp, 40
	lw $ra, -4($sp)
	jal _exitret
	.text
	.globl Base_loop
Base_loop:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 40
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	sw $s5, -32($fp)
	sw $s6, -36($fp)
	sw $s7, -40($fp)
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	move $s0, $a0
	move $s1, $a1
	move $s2, $a2
	li $s3, 0
	move $s4, $s3
	li $s3, 0
	move $s5, $s3
L1:
	nop
	li $s3, 1
	sle $s6, $s5, $s3
	beqz $s6, L4
	li $s3, 1
	add $s6, $s5, $s3
	move $s5, $s6
	li $s3, 1
	add $s6, $s1, $s3
	move $s4, $s6
	li $s3, 1
	add $s6, $s2, $s3
	move $s1, $s6
	li $s3, 0
	move $s6, $s3
L2:
	nop
	li $s3, 1
	sle $s7, $s6, $s3
	beqz $s7, L3
	li $s3, 1
	add $s7, $s6, $s3
	move $s6, $s7
	add $s3, $s4, $s2
	move $s4, $s3
	b L2
L3:
	nop
	li $s3, 2
	mul $s6, $s2, $s3
	move $s2, $s6
	b L1
L4:
	nop
	add $s2, $s1, $s4
	move $v0, $s2
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s5, -32($fp)
	lw $s6, -36($fp)
	lw $s7, -40($fp)
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
