	.text
	.globl main
main:
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 24
	li $s0, 8
	move $a0, $s0
	jal _halloc
	move $s1, $v0
	li $s0, 8
	move $a0, $s0
	jal _halloc
	move $s2, $v0
	la $s0, t101_go
	sw $s0, 4($s2)
	la $s0, t101_run
	sw $s0, 0($s2)
	sw $s2, 0($s1)
	lw $s0, 0($s1)
	lw $s2, 4($s0)
	move $a0, $s1
	jalr $s2
	move $s0, $v0
	move $a0, $s0
	jal _print
	addu $sp, $sp, 24
	lw $ra, -4($sp)
	jal _exitret
	.text
	.globl t101_run
t101_run:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 16
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	move $s0, $a0
	li $s1, 2
	sw $s1, 4($s0)
	lw $s1, 4($s0)
	move $a0, $s1
	jal _print
	lw $s1, 4($s0)
	move $v0, $s1
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	addu $sp, $sp, 16
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl t101_go
t101_go:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 36
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	sw $s5, -32($fp)
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	move $s0, $a0
	li $s2, 8
	move $a0, $s2
	jal _halloc
	move $s3, $v0
	li $s2, 8
	move $a0, $s2
	jal _halloc
	move $s4, $v0
	la $s2, t101_go
	sw $s2, 4($s4)
	la $s2, t101_run
	sw $s2, 0($s4)
	sw $s4, 0($s3)
	move $s2, $s3
	lw $s3, 0($s2)
	lw $s4, 0($s3)
	move $a0, $s2
	jalr $s4
	move $s3, $v0
	li $s3, 12
	move $a0, $s3
	jal _halloc
	move $s4, $v0
	li $s3, 12
	move $a0, $s3
	jal _halloc
	move $s5, $v0
	la $s3, t102_run
	sw $s3, 8($s5)
	la $s3, t102_go
	sw $s3, 4($s5)
	la $s3, t101_run
	sw $s3, 0($s5)
	sw $s5, 0($s4)
	move $s2, $s4
	lw $s3, 0($s2)
	lw $s4, 0($s3)
	move $a0, $s2
	jalr $s4
	move $s3, $v0
	move $s2, $s3
	li $s3, 12
	move $a0, $s3
	jal _halloc
	move $s4, $v0
	li $s3, 12
	move $a0, $s3
	jal _halloc
	move $s5, $v0
	la $s3, t102_run
	sw $s3, 8($s5)
	la $s3, t102_go
	sw $s3, 4($s5)
	la $s3, t101_run
	sw $s3, 0($s5)
	sw $s5, 0($s4)
	move $v0, $s2
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s5, -32($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	addu $sp, $sp, 36
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl t102_go
t102_go:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 32
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	move $s0, $a0
	li $s2, 12
	move $a0, $s2
	jal _halloc
	move $s3, $v0
	li $s2, 12
	move $a0, $s2
	jal _halloc
	move $s4, $v0
	la $s2, t102_run
	sw $s2, 8($s4)
	la $s2, t102_go
	sw $s2, 4($s4)
	la $s2, t101_run
	sw $s2, 0($s4)
	sw $s4, 0($s3)
	move $s2, $s3
	lw $s3, 0($s2)
	lw $s4, 8($s3)
	move $a0, $s2
	jalr $s4
	move $s3, $v0
	li $s2, 8
	move $a0, $s2
	jal _halloc
	move $s3, $v0
	li $s2, 8
	move $a0, $s2
	jal _halloc
	move $s4, $v0
	la $s2, t101_go
	sw $s2, 4($s4)
	la $s2, t101_run
	sw $s2, 0($s4)
	sw $s4, 0($s3)
	move $s2, $s3
	lw $s3, 0($s2)
	lw $s4, 4($s3)
	move $a0, $s2
	jalr $s4
	move $s3, $v0
	move $v0, $s3
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	addu $sp, $sp, 32
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl t102_run
t102_run:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 16
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	move $s0, $a0
	li $s1, 9
	sw $s1, 8($s0)
	lw $s1, 8($s0)
	move $a0, $s1
	jal _print
	lw $s1, 8($s0)
	move $v0, $s1
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
