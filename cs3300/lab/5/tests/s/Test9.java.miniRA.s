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
	la $s0, Test_Start
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
	.globl ArrayTest_test
ArrayTest_test:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 28
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	move $s0, $a0
	move $s1, $a1
	addi $s2, $s1, 1
	mul $s3, $s2, 4
	move $a0, $s3
	jal _halloc
	move $s2, $v0
	sw $s1, 0($s2)
	move $s1, $s2
	li $s2, 0
	sw $s2, 4($s0)
	lw $s2, 4($s0)
	move $a0, $s2
	jal _print
	lw $s0, 0($s1)
	move $a0, $s0
	jal _print
	li $s0, 0
	move $s2, $s0
	li $s0, 111
	move $a0, $s0
	jal _print
L1:
	nop
	lw $s0, 0($s1)
	li $s3, 1
	sub $s4, $s0, $s3
	sle $s0, $s2, $s4
	beqz $s0, L2
	li $s0, 1
	add $s3, $s2, $s0
	move $a0, $s3
	jal _print
	li $s0, 1
	add $s3, $s2, $s0
	mul $s0, $s2, 4
	add $s4, $s1, $s0
	sw $s3, 4($s4)
	li $s0, 1
	add $s3, $s2, $s0
	move $s2, $s3
	b L1
L2:
	nop
	li $s0, 222
	move $a0, $s0
	jal _print
	li $s0, 0
	move $s2, $s0
L3:
	nop
	lw $s0, 0($s1)
	li $s3, 1
	sub $s4, $s0, $s3
	sle $s0, $s2, $s4
	beqz $s0, L4
	mul $s0, $s2, 4
	add $s3, $s1, $s0
	lw $s0, 4($s3)
	move $a0, $s0
	jal _print
	li $s0, 1
	add $s3, $s2, $s0
	move $s2, $s3
	b L3
L4:
	nop
	li $s0, 333
	move $a0, $s0
	jal _print
	lw $s0, 0($s1)
	move $v0, $s0
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	addu $sp, $sp, 28
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl B_test
B_test:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 28
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	move $s0, $a0
	move $s1, $a1
	addi $s2, $s1, 1
	mul $s3, $s2, 4
	move $a0, $s3
	jal _halloc
	move $s2, $v0
	sw $s1, 0($s2)
	move $s1, $s2
	li $s2, 12
	sw $s2, 16($s0)
	lw $s2, 16($s0)
	move $a0, $s2
	jal _print
	lw $s0, 0($s1)
	move $a0, $s0
	jal _print
	li $s0, 0
	move $s2, $s0
	li $s0, 111
	move $a0, $s0
	jal _print
L5:
	nop
	lw $s0, 0($s1)
	li $s3, 1
	sub $s4, $s0, $s3
	sle $s0, $s2, $s4
	beqz $s0, L6
	li $s0, 1
	add $s3, $s2, $s0
	move $a0, $s3
	jal _print
	li $s0, 1
	add $s3, $s2, $s0
	mul $s0, $s2, 4
	add $s4, $s1, $s0
	sw $s3, 4($s4)
	li $s0, 1
	add $s3, $s2, $s0
	move $s2, $s3
	b L5
L6:
	nop
	li $s0, 222
	move $a0, $s0
	jal _print
	li $s0, 0
	move $s2, $s0
L7:
	nop
	lw $s0, 0($s1)
	li $s3, 1
	sub $s4, $s0, $s3
	sle $s0, $s2, $s4
	beqz $s0, L8
	mul $s0, $s2, 4
	add $s3, $s1, $s0
	lw $s0, 4($s3)
	move $a0, $s0
	jal _print
	li $s0, 1
	add $s3, $s2, $s0
	move $s2, $s3
	b L7
L8:
	nop
	li $s0, 333
	move $a0, $s0
	jal _print
	lw $s0, 0($s1)
	move $v0, $s0
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	addu $sp, $sp, 28
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Test_Start
Test_Start:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 36
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	move $s0, $a0
	li $s1, 16
	move $a0, $s1
	jal _halloc
	move $s2, $v0
	li $s1, 4
	move $a0, $s1
	jal _halloc
	move $s3, $v0
	la $s1, ArrayTest_test
	sw $s1, 0($s3)
	sw $s3, 0($s2)
	move $s1, $s2
	lw $s2, 0($s1)
	lw $s3, 0($s2)
	li $s2, 3
	move $a0, $s1
	move $a1, $s2
	jalr $s3
	move $s4, $v0
	move $a0, $s4
	jal _print
	li $s1, 0
	move $v0, $s1
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	addu $sp, $sp, 36
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
