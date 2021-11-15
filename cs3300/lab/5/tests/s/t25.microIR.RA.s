	.text
	.globl main
main:
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 48
	li $s0, 0
	li $s1, 0
	li $s2, 0
	li $s3, 0
	li $s4, 0
	li $s5, 0
	li $s6, 0
	li $s7, 0
	li $t0, 0
	la $t1, Test
	sw $t0, -12($fp)
	sw $t1, -16($fp)
	move $a0, $s0
	move $a1, $s1
	move $a2, $s2
	move $a3, $s3
	sw $s4, 0($sp)
	sw $s5, 4($sp)
	sw $s6, 8($sp)
	sw $s7, 12($sp)
	sw $t0, 16($sp)
	jalr $t1
	lw $t0, -12($fp)
	lw $t1, -16($fp)
	move $t1, $v0
	move $a0, $t1
	jal _print
	addu $sp, $sp, 48
	lw $ra, -4($sp)
	jal _exitret
	.text
	.globl Test
Test:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 4
	li $v1, 0
	sw $v1, 4($fp)
	li $v1, 1
	sw $v1, 8($fp)
	lw $v1, 4($fp)
	move $a0, $v1
	jal _print
	li $v1, 2
	sw $v1, 12($fp)
	lw $v1, 8($fp)
	move $a0, $v1
	jal _print
	li $v1, 3
	sw $v1, 4($fp)
	lw $v1, 12($fp)
	move $a0, $v1
	jal _print
	lw $v1, 4($fp)
	move $a0, $v1
	jal _print
	li $v0, 1
	addu $sp, $sp, 4
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
