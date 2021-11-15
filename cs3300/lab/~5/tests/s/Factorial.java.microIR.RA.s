	.text
	.globl main
main:
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 12
	li $s0, 4
	move $a0, $s0
	jal _halloc
	move $s0, $v0
	li $s1, 4
	move $a0, $s1
	jal _halloc
	move $s1, $v0
	la $s2, Fac_ComputeFac
	sw $s2, 0($s1)
	sw $s1, 0($s0)
	lw $s1, 0($s0)
	lw $s1, 0($s1)
	li $s2, 10
	li $s3, 0
	add $s3, $s2, $s3
	move $a0, $s0
	move $a1, $s3
	jalr $s1
	move $s3, $v0
	move $a0, $s3
	jal _print
	addu $sp, $sp, 12
	lw $ra, -4($sp)
	jal _exitret
	.text
	.globl Fac_ComputeFac
Fac_ComputeFac:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 32
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	move $s0, $a1
	move $s1, $a0
	li $s2, 1
	sle $s2, $s0, $s2
	beqz $s2, L1
	li $s2, 1
	xor $s2, $s0, $s2
	beqz $s2, L1
	li $s2, 1
	li $s3, 0
	add $s3, $s2, $s3
	b L0
L1:
	nop
	lw $s2, 0($s1)
	lw $s2, 0($s2)
	li $s4, 1
	sub $s4, $s0, $s4
	move $a0, $s1
	move $a1, $s4
	jalr $s2
	move $s4, $v0
	mul $s4, $s0, $s4
	move $s3, $s4
L0:
	nop
	move $v0, $s3
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	addu $sp, $sp, 32
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
