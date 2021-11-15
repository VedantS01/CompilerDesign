	.text
	.globl main
main:
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 8
	li $s0, 8
	move $a0, $s0
	jal _halloc
	move $s0, $v0
	li $s1, 8
	move $a0, $s1
	jal _halloc
	move $s1, $v0
	la $s2, t111_run
	sw $s2, 0($s1)
	la $s2, t111_go
	sw $s2, 4($s1)
	sw $s1, 0($s0)
	lw $s1, 0($s0)
	lw $s1, 4($s1)
	move $a0, $s0
	jalr $s1
	move $s1, $v0
	move $a0, $s1
	jal _print
	addu $sp, $sp, 8
	lw $ra, -4($sp)
	jal _exitret
	.text
	.globl t111_run
t111_run:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 12
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	move $s0, $a0
	li $s1, 2
	sw $s1, 4($s0)
	lw $s1, 4($s0)
	move $a0, $s1
	jal _print
	lw $s0, 4($s0)
	move $v0, $s0
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	addu $sp, $sp, 12
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl t111_go
t111_go:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 28
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	li $s0, 8
	move $a0, $s0
	jal _halloc
	move $s0, $v0
	li $s1, 8
	move $a0, $s1
	jal _halloc
	move $s1, $v0
	la $s2, t111_run
	sw $s2, 0($s1)
	la $s2, t111_go
	sw $s2, 4($s1)
	sw $s1, 0($s0)
	li $s1, 8
	move $a0, $s1
	jal _halloc
	move $s1, $v0
	li $s2, 8
	move $a0, $s2
	jal _halloc
	move $s2, $v0
	la $s3, t111_run
	sw $s3, 0($s2)
	la $s3, t111_go
	sw $s3, 4($s2)
	sw $s2, 0($s1)
	lw $s2, 0($s1)
	lw $s2, 0($s2)
	move $a0, $s1
	jalr $s2
	move $s2, $v0
	li $s1, 12
	move $a0, $s1
	jal _halloc
	move $s1, $v0
	li $s3, 12
	move $a0, $s3
	jal _halloc
	move $s3, $v0
	la $s4, t111_run
	sw $s4, 0($s3)
	la $s4, t112_run
	sw $s4, 8($s3)
	la $s4, t111_go
	sw $s4, 4($s3)
	sw $s3, 0($s1)
	move $s0, $s1
	li $s1, 12
	move $a0, $s1
	jal _halloc
	move $s1, $v0
	li $s0, 12
	move $a0, $s0
	jal _halloc
	move $s0, $v0
	la $s3, t111_run
	sw $s3, 0($s0)
	la $s3, t112_run
	sw $s3, 8($s0)
	la $s3, t111_go
	sw $s3, 4($s0)
	sw $s0, 0($s1)
	lw $s0, 0($s1)
	lw $s0, 8($s0)
	move $a0, $s1
	jalr $s0
	move $s0, $v0
	move $s2, $s0
	li $s0, 12
	move $a0, $s0
	jal _halloc
	move $s0, $v0
	li $s1, 12
	move $a0, $s1
	jal _halloc
	move $s1, $v0
	la $s3, t111_run
	sw $s3, 0($s1)
	la $s3, t112_run
	sw $s3, 8($s1)
	la $s3, t111_go
	sw $s3, 4($s1)
	sw $s1, 0($s0)
	move $v0, $s2
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	addu $sp, $sp, 28
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl t112_run
t112_run:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 12
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	move $s0, $a0
	li $s1, 9
	sw $s1, 8($s0)
	lw $s1, 8($s0)
	move $a0, $s1
	jal _print
	lw $s0, 8($s0)
	move $v0, $s0
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	addu $sp, $sp, 12
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
