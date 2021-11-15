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
	la $s2, Caller_Start
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
	.globl A_get
A_get:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 16
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	move $s0, $a0
	li $s1, 0
	lw $s0, 4($s0)
	li $s2, 0
	xor $s2, $s0, $s2
	beqz $s2, L1
	li $s2, 1
	move $s1, $s2
	b L0
L1:
	nop
	li $s2, 0
	move $s1, $s2
L0:
	nop
	move $v0, $s1
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	addu $sp, $sp, 16
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl B_set
B_set:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 12
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	move $s0, $a0
	li $s1, 1
	sw $s1, 4($s0)
	lw $s0, 4($s0)
	move $v0, $s0
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	addu $sp, $sp, 12
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl C_reset
C_reset:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 12
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	move $s0, $a0
	li $s1, 0
	sw $s1, 4($s0)
	lw $s0, 4($s0)
	move $v0, $s0
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	addu $sp, $sp, 12
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Caller_Start
Caller_Start:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 24
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	sw $s3, -24($fp)
	li $s0, 8
	move $a0, $s0
	jal _halloc
	move $s0, $v0
	li $s1, 4
	move $a0, $s1
	jal _halloc
	move $s1, $v0
	la $s2, A_get
	sw $s2, 0($s1)
	sw $s1, 0($s0)
	li $s0, 8
	move $a0, $s0
	jal _halloc
	move $s0, $v0
	li $s1, 8
	move $a0, $s1
	jal _halloc
	move $s1, $v0
	la $s2, A_get
	sw $s2, 0($s1)
	la $s2, B_set
	sw $s2, 4($s1)
	sw $s1, 0($s0)
	li $s1, 8
	move $a0, $s1
	jal _halloc
	move $s1, $v0
	li $s2, 12
	move $a0, $s2
	jal _halloc
	move $s2, $v0
	la $s3, A_get
	sw $s3, 0($s2)
	la $s3, B_set
	sw $s3, 4($s2)
	la $s3, C_reset
	sw $s3, 8($s2)
	sw $s2, 0($s1)
	lw $s2, 0($s0)
	lw $s2, 4($s2)
	move $a0, $s0
	jalr $s2
	move $s2, $v0
	lw $s3, 0($s1)
	lw $s3, 8($s3)
	move $a0, $s1
	jalr $s3
	move $s3, $v0
	move $s2, $s3
	lw $s3, 0($s0)
	lw $s3, 0($s3)
	move $a0, $s0
	jalr $s3
	move $s3, $v0
	move $a0, $s3
	jal _print
	lw $s3, 0($s1)
	lw $s3, 0($s3)
	move $a0, $s1
	jalr $s3
	move $s3, $v0
	move $a0, $s3
	jal _print
	li $s3, 1
	move $v0, $s3
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	lw $s3, -24($fp)
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
