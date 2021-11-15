	.text
	.globl main
main:
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 16
	li $s0, 8
	move $a0, $s0
	jal _halloc
	move $s0, $v0
	li $s1, 4
	move $a0, $s1
	jal _halloc
	move $s1, $v0
	la $s2, Test1_Start
	sw $s2, 0($s1)
	sw $s1, 0($s0)
	lw $s1, 0($s0)
	lw $s1, 0($s1)
	li $s2, 5
	li $s3, 1
	move $a0, $s0
	move $a1, $s2
	move $a2, $s3
	jalr $s1
	move $s3, $v0
	move $a0, $s3
	jal _print
	addu $sp, $sp, 16
	lw $ra, -4($sp)
	jal _exitret
	.text
	.globl Test1_Start
Test1_Start:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 16
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	move $s0, $a1
	addi $s1, $s0, 1
	mul $s1, $s1, 4
	move $a0, $s1
	jal _halloc
	move $s1, $v0
	sw $s0, 0($s1)
	li $s0, 0
	li $s2, 0
	mul $s0, $s0, 4
	add $s0, $s1, $s0
	sw $s2, 4($s0)
	li $s0, 0
	mul $s0, $s0, 4
	add $s0, $s1, $s0
	lw $s0, 4($s0)
	move $a0, $s0
	jal _print
	li $s0, 0
	mul $s0, $s0, 4
	add $s0, $s1, $s0
	lw $s0, 4($s0)
	move $v0, $s0
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
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
