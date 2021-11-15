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
	li $s1, 8
	move $a0, $s1
	jal _halloc
	move $s1, $v0
	la $s2, ProtectedCreate_ProtectedFun
	sw $s2, 0($s1)
	la $s2, ProtectedChild_ProtectedDemo
	sw $s2, 4($s1)
	sw $s1, 0($s0)
	lw $s1, 0($s0)
	lw $s1, 4($s1)
	li $s2, 10
	move $a0, $s0
	move $a1, $s2
	jalr $s1
	move $s2, $v0
	move $a0, $s2
	jal _print
	addu $sp, $sp, 12
	lw $ra, -4($sp)
	jal _exitret
	.text
	.globl ProtectedCreate_ProtectedFun
ProtectedCreate_ProtectedFun:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 8
	sw $s0, -12($fp)
	move $s0, $a1
	mul $s0, $s0, $s0
	move $v0, $s0
	lw $s0, -12($fp)
	addu $sp, $sp, 8
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl ProtectedChild_ProtectedDemo
ProtectedChild_ProtectedDemo:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 28
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	sw $s3, -24($fp)
	move $s0, $a1
	li $s1, 4
	move $a0, $s1
	jal _halloc
	move $s1, $v0
	li $s2, 4
	move $a0, $s2
	jal _halloc
	move $s2, $v0
	la $s3, ProtectedCreate_ProtectedFun
	sw $s3, 0($s2)
	sw $s2, 0($s1)
	lw $s2, 0($s1)
	lw $s2, 0($s2)
	move $a0, $s1
	move $a1, $s0
	jalr $s2
	move $s2, $v0
	move $v0, $s2
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	lw $s3, -24($fp)
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
