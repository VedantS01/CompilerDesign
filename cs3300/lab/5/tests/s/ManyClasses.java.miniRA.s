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
	la $s0, Caller_Start
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
	.globl A_get
A_get:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 20
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	move $s0, $a0
	li $s1, 0
	lw $s1, 4($s0)
	li $s0, 0
	xor $s2, $s1, $s0
	beqz $s2, L1
	li $s0, 1
	move $s1, $s0
	b L2
L1:
	nop
	li $s0, 0
	move $s1, $s0
L2:
	nop
	move $v0, $s1
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	addu $sp, $sp, 20
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl B_set
B_set:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 16
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	move $s0, $a0
	li $s1, 1
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
	.globl C_reset
C_reset:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 16
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	move $s0, $a0
	li $s1, 0
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
	.globl Caller_Start
Caller_Start:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 40
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	sw $s5, -32($fp)
	sw $s6, -36($fp)
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	move $s0, $a0
	li $s3, 8
	move $a0, $s3
	jal _halloc
	move $s4, $v0
	li $s3, 4
	move $a0, $s3
	jal _halloc
	move $s5, $v0
	la $s3, A_get
	sw $s3, 0($s5)
	sw $s5, 0($s4)
	li $s3, 8
	move $a0, $s3
	jal _halloc
	move $s4, $v0
	li $s3, 8
	move $a0, $s3
	jal _halloc
	move $s5, $v0
	la $s3, A_get
	sw $s3, 0($s5)
	la $s3, B_set
	sw $s3, 4($s5)
	sw $s5, 0($s4)
	move $s3, $s4
	li $s4, 8
	move $a0, $s4
	jal _halloc
	move $s5, $v0
	li $s4, 12
	move $a0, $s4
	jal _halloc
	move $s6, $v0
	la $s4, A_get
	sw $s4, 0($s6)
	la $s4, B_set
	sw $s4, 4($s6)
	la $s4, C_reset
	sw $s4, 8($s6)
	sw $s6, 0($s5)
	move $s4, $s5
	lw $s5, 0($s3)
	lw $s6, 4($s5)
	move $a0, $s3
	jalr $s6
	move $s5, $v0
	lw $s5, 0($s4)
	lw $s6, 8($s5)
	move $a0, $s4
	jalr $s6
	move $s5, $v0
	lw $s5, 0($s3)
	lw $s6, 0($s5)
	move $a0, $s3
	jalr $s6
	move $s5, $v0
	move $a0, $s5
	jal _print
	lw $s3, 0($s4)
	lw $s5, 0($s3)
	move $a0, $s4
	jalr $s5
	move $s3, $v0
	move $a0, $s3
	jal _print
	li $s3, 1
	move $v0, $s3
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s5, -32($fp)
	lw $s6, -36($fp)
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
