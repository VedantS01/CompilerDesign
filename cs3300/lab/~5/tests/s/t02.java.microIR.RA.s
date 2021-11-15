	.text
	.globl main
main:
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 8
	li $s0, 12
	move $a0, $s0
	jal _halloc
	move $s0, $v0
	li $s1, 8
	move $a0, $s1
	jal _halloc
	move $s1, $v0
	la $s2, t021_run
	sw $s2, 0($s1)
	la $s2, t021_mark
	sw $s2, 4($s1)
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
	.globl t021_mark
t021_mark:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 12
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	move $s0, $a0
	li $s1, 1
	sw $s1, 4($s0)
	li $s1, 0
	sw $s1, 8($s0)
	lw $s1, 4($s0)
	xori $s1, $s1, 1
	beqz $s1, L2
	lw $s1, 8($s0)
	beqz $s1, L0
L2:
	nop
	lw $s1, 4($s0)
	b L1
L0:
	nop
	lw $s0, 8($s0)
	move $s1, $s0
L1:
	nop
	move $v0, $s1
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	addu $sp, $sp, 12
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl t021_run
t021_run:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 24
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	sw $s3, -24($fp)
	move $s0, $a0
	li $s1, 4
	li $s2, 5
	lw $s3, 0($s0)
	lw $s3, 4($s3)
	move $a0, $s0
	jalr $s3
	move $s3, $v0
	beqz $s3, L3
	b L4
L3:
	nop
	move $s1, $s2
L4:
	nop
	move $v0, $s1
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
