	.text
	.globl main
main:
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 16
	la $s0, Fun
	li $s1, 12
	li $s2, 13
	li $s3, 5
	move $a0, $s1
	move $a1, $s2
	move $a2, $s3
	jalr $s0
	move $s1, $v0
	move $s0, $s1
	move $a0, $s0
	jal _print
	addu $sp, $sp, 16
	lw $ra, -4($sp)
	jal _exitret
	.text
	.globl Fun
Fun:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 32
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	sw $s5, -32($fp)
	sw $s6, -36($fp)
	move $s0, $a2
	move $s1, $a1
	move $s2, $a0
	move $s3, $s1
	move $s4, $s2
	move $s5, $s3
	move $s6, $s0
	move $s4, $s2
	move $s5, $s3
	move $s6, $s0
	move $s4, $s2
	move $s5, $s3
	move $s6, $s0
	move $s4, $s2
	move $s5, $s3
	move $s6, $s0
	move $s4, $s2
	move $s5, $s3
	move $s6, $s0
	move $s4, $s2
	move $s5, $s3
	move $s6, $s0
	move $s4, $s2
	move $s5, $s3
	move $s6, $s0
	move $s4, $s2
	move $s5, $s3
	move $s6, $s0
	move $s4, $s2
	move $s5, $s3
	move $s6, $s0
	move $s4, $s2
	move $s5, $s3
	move $s6, $s0
	move $s4, $s2
	move $s5, $s3
	move $s6, $s0
	move $s4, $s2
	move $s5, $s3
	move $s6, $s0
	move $s4, $s2
	move $s5, $s3
	move $s6, $s0
	move $s4, $s2
	move $s5, $s3
	move $s6, $s0
	move $s4, $s2
	move $s5, $s3
	move $s6, $s0
	move $s4, $s2
	move $s5, $s3
	move $s6, $s0
	move $s4, $s2
	move $s5, $s3
	move $s6, $s0
	move $s4, $s2
	move $s5, $s3
	move $s6, $s0
	move $s4, $s2
	move $s5, $s3
	move $s6, $s0
	move $s4, $s2
	move $s5, $s3
	move $s6, $s0
	move $s4, $s2
	move $s5, $s3
	move $s6, $s0
	move $s4, $s2
	move $s5, $s3
	move $s6, $s0
	move $s4, $s2
	move $s5, $s3
	move $s6, $s0
	move $s4, $s2
	move $s5, $s3
	move $s6, $s0
	move $s4, $s2
	move $s5, $s3
	move $s6, $s0
	move $s4, $s2
	move $s5, $s3
	move $s6, $s0
	move $s4, $s2
	move $s5, $s3
	move $s6, $s0
	move $s4, $s2
	move $s5, $s3
	move $s6, $s0
	move $s4, $s2
	move $s5, $s3
	move $s6, $s0
	move $s4, $s2
	move $s5, $s3
	move $s6, $s0
	move $s4, $s2
	move $s5, $s3
	move $s6, $s0
	move $s4, $s2
	move $s5, $s3
	move $s6, $s0
	move $s4, $s2
	move $s5, $s3
	move $s6, $s0
	move $s4, $s2
	move $s5, $s3
	move $s6, $s0
	move $s4, $s2
	move $s5, $s3
	move $s6, $s0
	li $a0, 0
	jal _print
	move $v0, $s1
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s5, -32($fp)
	lw $s6, -36($fp)
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
