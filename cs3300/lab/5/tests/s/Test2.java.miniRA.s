	.text
	.globl main
main:
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 60
	li $s0, 28
	move $a0, $s0
	jal _halloc
	move $s1, $v0
	li $s0, 4
	move $a0, $s0
	jal _halloc
	move $s2, $v0
	la $s0, A_function
	sw $s0, 0($s2)
	sw $s2, 0($s1)
	lw $s0, 0($s1)
	lw $s2, 0($s0)
	li $s0, 2
	li $s3, 3
	add $s4, $s0, $s3
	li $s0, 28
	move $a0, $s0
	jal _halloc
	move $s3, $v0
	li $s0, 4
	move $a0, $s0
	jal _halloc
	move $s5, $v0
	la $s0, A_function
	sw $s0, 0($s5)
	sw $s5, 0($s3)
	lw $s0, 0($s3)
	lw $s5, 0($s0)
	li $s0, 1
	li $s6, 4
	li $s7, 0
	xori $t0, $s7, 1
	beqz $t0, L1
	li $s7, 0
	beqz $s7, L2
L1:
	li $s7, 1
	b L3
L2:
	li $s7, 0
L3:
	nop
	li $t0, 5
	sw $t1, -44($fp)
	move $a0, $s3
	move $a1, $s0
	move $a2, $s6
	move $a3, $s7
	sw $t0, 0($sp)
	jalr $s5
	lw $t1, -44($fp)
	move $t1, $v0
	li $s0, 12
	move $a0, $s0
	jal _halloc
	move $s3, $v0
	li $s0, 4
	move $a0, $s0
	jal _halloc
	move $s5, $v0
	la $s0, B_function2
	sw $s0, 0($s5)
	sw $s5, 0($s3)
	lw $s0, 0($s3)
	lw $s5, 0($s0)
	sw $t1, -44($fp)
	move $a0, $s3
	jalr $s5
	lw $t1, -44($fp)
	move $s0, $v0
	li $s3, 10
	move $a0, $s1
	move $a1, $s4
	move $a2, $t1
	move $a3, $s0
	sw $s3, 0($sp)
	jalr $s2
	move $s5, $v0
	move $a0, $s5
	jal _print
	addu $sp, $sp, 60
	lw $ra, -4($sp)
	jal _exitret
	.text
	.globl A_function
A_function:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 40
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	sw $s5, -32($fp)
	sw $s6, -36($fp)
	sw $s7, -40($fp)
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	move $s0, $a0
	move $s1, $a1
	move $s2, $a2
	move $s3, $a3
	lw $s4, 0($fp)
	addi $s5, $s4, 1
	mul $s6, $s5, 4
	move $a0, $s6
	jal _halloc
	move $s5, $v0
	sw $s4, 0($s5)
	sw $s5, 12($s0)
	addi $s5, $s4, 1
	mul $s6, $s5, 4
	move $a0, $s6
	jal _halloc
	move $s5, $v0
	sw $s4, 0($s5)
	sw $s5, 16($s0)
	li $s5, 0
	move $s6, $s5
	li $s5, 0
	move $s7, $s5
	li $s5, 1
	sub $t0, $s4, $s5
	move $s4, $t0
L4:
	nop
	sle $s5, $s6, $s4
	beqz $s5, L5
	lw $s5, 12($s0)
	mul $t0, $s6, 4
	add $t1, $s5, $t0
	sw $s1, 4($t1)
	lw $s5, 16($s0)
	mul $t0, $s6, 4
	add $t1, $s5, $t0
	sw $s2, 4($t1)
	lw $s5, 12($s0)
	mul $t0, $s6, 4
	add $t1, $s5, $t0
	lw $s5, 4($t1)
	lw $t0, 16($s0)
	mul $t1, $s6, 4
	add $t2, $t0, $t1
	lw $t0, 4($t2)
	add $t1, $s5, $t0
	lw $s5, 12($s0)
	mul $t0, $s6, 4
	add $t2, $s5, $t0
	sw $t1, 4($t2)
	lw $s5, 12($s0)
	mul $t0, $s6, 4
	add $t1, $s5, $t0
	lw $s5, 4($t1)
	move $a0, $s5
	jal _print
	lw $s5, 12($s0)
	mul $t0, $s6, 4
	add $t1, $s5, $t0
	lw $s5, 4($t1)
	add $t0, $s7, $s5
	move $s7, $t0
	li $s5, 1
	add $t0, $s6, $s5
	move $s6, $t0
	b L4
L5:
	nop
	beqz $s3, L6
	move $s0, $s7
	b L7
L6:
	nop
	li $s1, 0
	move $s0, $s1
L7:
	nop
	move $v0, $s0
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s5, -32($fp)
	lw $s6, -36($fp)
	lw $s7, -40($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	addu $sp, $sp, 40
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl B_function2
B_function2:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 20
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	move $s0, $a0
	li $s1, 1
	sw $s1, 4($s0)
	li $s1, 1
	sw $s1, 8($s0)
	lw $s1, 4($s0)
	beqz $s1, L8
	lw $s1, 8($s0)
	beqz $s1, L8
	li $s1, 1
	b L9
L8:
	li $s1, 0
L9:
	nop
	xori $s2, $s1, 1
	beqz $s2, L13
	lw $s1, 4($s0)
	xori $s2, $s1, 1
	beqz $s2, L10
	lw $s1, 8($s0)
	beqz $s1, L11
L10:
	li $s0, 1
	b L12
L11:
	li $s0, 0
L12:
	nop
	beqz $s0, L14
L13:
	li $s0, 1
	b L15
L14:
	li $s0, 0
L15:
	nop
	xori $s1, $s0, 1
	move $v0, $s1
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	addu $sp, $sp, 20
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
