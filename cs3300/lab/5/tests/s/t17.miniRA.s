	.text
	.globl main
main:
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 16
	la $s0, Fun
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
	subu $sp, $sp, 16
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	li $s0, 0
	move $s1, $s0
	move $s0, $s1
	move $s1, $s0
	move $s0, $s1
	move $s1, $s0
	move $s0, $s1
	move $s1, $s0
	move $s0, $s1
	move $s1, $s0
	move $s0, $s1
	move $s1, $s0
	move $s0, $s1
	move $s1, $s0
	move $s0, $s1
	move $s1, $s0
	move $s0, $s1
	move $s1, $s0
	move $s0, $s1
	move $s1, $s0
	move $s0, $s1
	move $s1, $s0
	move $s0, $s1
	move $a0, $s0
	jal _print
	move $v0, $s0
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	addu $sp, $sp, 16
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
