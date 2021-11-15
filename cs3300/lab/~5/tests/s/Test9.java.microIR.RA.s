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
	la $s2, Test_Start
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
	.globl ArrayTest_test
ArrayTest_test:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 20
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	sw $s3, -24($fp)
	move $s0, $a1
	move $s1, $a0
	addi $s2, $s0, 1
	mul $s2, $s2, 4
	move $a0, $s2
	jal _halloc
	move $s2, $v0
	sw $s0, 0($s2)
	li $s0, 0
	sw $s0, 4($s1)
	lw $s1, 4($s1)
	move $a0, $s1
	jal _print
	lw $s1, 0($s2)
	move $a0, $s1
	jal _print
	li $s1, 0
	li $s0, 111
	move $a0, $s0
	jal _print
L0:
	nop
	lw $s0, 0($s2)
	li $s3, 1
	sub $s3, $s0, $s3
	sle $s3, $s1, $s3
	beqz $s3, L1
	li $s3, 1
	add $s3, $s1, $s3
	move $a0, $s3
	jal _print
	li $s3, 1
	add $s3, $s1, $s3
	mul $s0, $s1, 4
	add $s0, $s2, $s0
	sw $s3, 4($s0)
	li $s0, 1
	add $s0, $s1, $s0
	move $s1, $s0
	b L0
L1:
	nop
	li $s0, 222
	move $a0, $s0
	jal _print
	li $s0, 0
	move $s1, $s0
L2:
	nop
	lw $s0, 0($s2)
	li $s3, 1
	sub $s3, $s0, $s3
	sle $s3, $s1, $s3
	beqz $s3, L3
	mul $s3, $s1, 4
	add $s3, $s2, $s3
	lw $s3, 4($s3)
	move $a0, $s3
	jal _print
	li $s3, 1
	add $s3, $s1, $s3
	move $s1, $s3
	b L2
L3:
	nop
	li $s1, 333
	move $a0, $s1
	jal _print
	lw $s2, 0($s2)
	move $v0, $s2
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	lw $s3, -24($fp)
	addu $sp, $sp, 20
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl B_test
B_test:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 20
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	sw $s3, -24($fp)
	move $s0, $a1
	move $s1, $a0
	addi $s2, $s0, 1
	mul $s2, $s2, 4
	move $a0, $s2
	jal _halloc
	move $s2, $v0
	sw $s0, 0($s2)
	li $s0, 12
	sw $s0, 16($s1)
	lw $s1, 16($s1)
	move $a0, $s1
	jal _print
	lw $s1, 0($s2)
	move $a0, $s1
	jal _print
	li $s1, 0
	li $s0, 111
	move $a0, $s0
	jal _print
L4:
	nop
	lw $s0, 0($s2)
	li $s3, 1
	sub $s3, $s0, $s3
	sle $s3, $s1, $s3
	beqz $s3, L5
	li $s3, 1
	add $s3, $s1, $s3
	move $a0, $s3
	jal _print
	li $s3, 1
	add $s3, $s1, $s3
	mul $s0, $s1, 4
	add $s0, $s2, $s0
	sw $s3, 4($s0)
	li $s0, 1
	add $s0, $s1, $s0
	move $s1, $s0
	b L4
L5:
	nop
	li $s0, 222
	move $a0, $s0
	jal _print
	li $s0, 0
	move $s1, $s0
L6:
	nop
	lw $s0, 0($s2)
	li $s3, 1
	sub $s3, $s0, $s3
	sle $s3, $s1, $s3
	beqz $s3, L7
	mul $s3, $s1, 4
	add $s3, $s2, $s3
	lw $s3, 4($s3)
	move $a0, $s3
	jal _print
	li $s3, 1
	add $s3, $s1, $s3
	move $s1, $s3
	b L6
L7:
	nop
	li $s1, 333
	move $a0, $s1
	jal _print
	lw $s2, 0($s2)
	move $v0, $s2
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	lw $s3, -24($fp)
	addu $sp, $sp, 20
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Test_Start
Test_Start:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 24
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	li $s0, 16
	move $a0, $s0
	jal _halloc
	move $s0, $v0
	li $s1, 4
	move $a0, $s1
	jal _halloc
	move $s1, $v0
	la $s2, ArrayTest_test
	sw $s2, 0($s1)
	sw $s1, 0($s0)
	lw $s1, 0($s0)
	lw $s1, 0($s1)
	li $s2, 3
	move $a0, $s0
	move $a1, $s2
	jalr $s1
	move $s2, $v0
	move $a0, $s2
	jal _print
	li $s2, 0
	move $v0, $s2
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
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
