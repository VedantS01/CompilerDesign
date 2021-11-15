	.text
	.globl main
main:
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 28
	li $s0, 28
	move $a0, $s0
	jal _halloc
	move $s0, $v0
	li $s1, 4
	move $a0, $s1
	jal _halloc
	move $s1, $v0
	la $s2, A_function
	sw $s2, 0($s1)
	sw $s1, 0($s0)
	lw $s1, 0($s0)
	lw $s1, 0($s1)
	li $s2, 2
	li $s3, 3
	add $s3, $s2, $s3
	li $s2, 28
	move $a0, $s2
	jal _halloc
	move $s2, $v0
	li $s4, 4
	move $a0, $s4
	jal _halloc
	move $s4, $v0
	la $s5, A_function
	sw $s5, 0($s4)
	sw $s4, 0($s2)
	lw $s4, 0($s2)
	lw $s4, 0($s4)
	li $s5, 1
	li $s6, 4
	li $s7, 0
	xori $s7, $s7, 1
	beqz $s7, L0
	li $s7, 0
	beqz $s7, L1
L0:
	li $s7, 1
	b L2
L1:
	li $s7, 0
L2:
	nop
	li $t0, 5
	sw $t0, -12($fp)
	move $a0, $s2
	move $a1, $s5
	move $a2, $s6
	move $a3, $s7
	sw $t0, 0($sp)
	jalr $s4
	lw $t0, -12($fp)
	move $t0, $v0
	li $s7, 12
	move $a0, $s7
	jal _halloc
	move $s7, $v0
	li $s6, 4
	move $a0, $s6
	jal _halloc
	move $s6, $v0
	la $s5, B_function2
	sw $s5, 0($s6)
	sw $s6, 0($s7)
	lw $s6, 0($s7)
	lw $s6, 0($s6)
	sw $t0, -12($fp)
	move $a0, $s7
	jalr $s6
	lw $t0, -12($fp)
	move $s6, $v0
	li $s7, 10
	sw $t0, -12($fp)
	move $a0, $s0
	move $a1, $s3
	move $a2, $t0
	move $a3, $s6
	sw $s7, 0($sp)
	jalr $s1
	lw $t0, -12($fp)
	move $s7, $v0
	move $a0, $s7
	jal _print
	addu $sp, $sp, 28
	lw $ra, -4($sp)
	jal _exitret
	.text
	.globl A_function
A_function:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 36
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	sw $s5, -32($fp)
	sw $s6, -36($fp)
	sw $s7, -40($fp)
	move $s0, $a3
	move $s1, $a2
	move $s2, $a1
	move $s3, $a0
	lw $v1, 0($fp)
	addi $s4, $v1, 1
	mul $s4, $s4, 4
	move $a0, $s4
	jal _halloc
	move $s4, $v0
	lw $v1, 0($fp)
	sw $v1, 0($s4)
	sw $s4, 12($s3)
	lw $v1, 0($fp)
	addi $s4, $v1, 1
	mul $s4, $s4, 4
	move $a0, $s4
	jal _halloc
	move $s4, $v0
	lw $v1, 0($fp)
	sw $v1, 0($s4)
	sw $s4, 16($s3)
	li $s4, 0
	li $s5, 0
	li $s6, 1
	lw $v1, 0($fp)
	sub $s6, $v1, $s6
	move $v1, $s6
	sw $v1, 0($fp)
L3:
	nop
	lw $v1, 0($fp)
	sle $s6, $s4, $v1
	beqz $s6, L4
	lw $s6, 12($s3)
	mul $s7, $s4, 4
	add $s7, $s6, $s7
	sw $s2, 4($s7)
	lw $s7, 16($s3)
	mul $s6, $s4, 4
	add $s6, $s7, $s6
	sw $s1, 4($s6)
	lw $s6, 12($s3)
	mul $s7, $s4, 4
	add $s7, $s6, $s7
	lw $s7, 4($s7)
	lw $s6, 16($s3)
	mul $t0, $s4, 4
	add $t0, $s6, $t0
	lw $t0, 4($t0)
	add $t0, $s7, $t0
	lw $s7, 12($s3)
	mul $s6, $s4, 4
	add $s6, $s7, $s6
	sw $t0, 4($s6)
	lw $s6, 12($s3)
	mul $t0, $s4, 4
	add $t0, $s6, $t0
	lw $t0, 4($t0)
	move $a0, $t0
	jal _print
	lw $t0, 12($s3)
	mul $s6, $s4, 4
	add $s6, $t0, $s6
	lw $s6, 4($s6)
	add $s6, $s5, $s6
	move $s5, $s6
	li $s6, 1
	add $s6, $s4, $s6
	move $s4, $s6
	b L3
L4:
	nop
	beqz $s0, L5
	b L6
L5:
	nop
	li $s0, 0
	move $s5, $s0
L6:
	nop
	move $v0, $s5
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s5, -32($fp)
	lw $s6, -36($fp)
	lw $s7, -40($fp)
	addu $sp, $sp, 36
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl B_function2
B_function2:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 12
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	move $s0, $a0
	li $s1, 1
	sw $s1, 4($s0)
	li $s1, 1
	sw $s1, 8($s0)
	lw $s1, 4($s0)
	beqz $s1, L10
	lw $s1, 8($s0)
	beqz $s1, L10
	li $s1, 1
	b L11
L10:
	li $s1, 0
L11:
	nop
	xori $s1, $s1, 1
	beqz $s1, L7
	lw $s1, 4($s0)
	xori $s1, $s1, 1
	beqz $s1, L12
	lw $s0, 8($s0)
	beqz $s0, L13
L12:
	li $s0, 1
	b L14
L13:
	li $s0, 0
L14:
	nop
	beqz $s0, L8
L7:
	li $s0, 1
	b L9
L8:
	li $s0, 0
L9:
	nop
	xori $s0, $s0, 1
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
