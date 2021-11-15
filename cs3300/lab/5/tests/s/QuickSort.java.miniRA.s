	.text
	.globl main
main:
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 32
	li $s0, 12
	move $a0, $s0
	jal _halloc
	move $s1, $v0
	li $s0, 16
	move $a0, $s0
	jal _halloc
	move $s2, $v0
	la $s0, QS_Sort
	sw $s0, 12($s2)
	la $s0, QS_Start
	sw $s0, 0($s2)
	la $s0, QS_Init
	sw $s0, 4($s2)
	la $s0, QS_Print
	sw $s0, 8($s2)
	sw $s2, 0($s1)
	lw $s0, 0($s1)
	lw $s2, 0($s0)
	li $s0, 10
	move $a0, $s1
	move $a1, $s0
	jalr $s2
	move $s3, $v0
	move $a0, $s3
	jal _print
	addu $sp, $sp, 32
	lw $ra, -4($sp)
	jal _exitret
	.text
	.globl QS_Start
QS_Start:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 44
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	sw $s5, -32($fp)
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	move $s0, $a0
	move $s1, $a1
	move $s2, $s0
	lw $s3, 0($s2)
	lw $s4, 4($s3)
	move $a0, $s2
	move $a1, $s1
	jalr $s4
	move $s3, $v0
	move $s1, $s0
	lw $s2, 0($s1)
	lw $s3, 8($s2)
	move $a0, $s1
	jalr $s3
	move $s2, $v0
	li $s1, 9999
	move $a0, $s1
	jal _print
	lw $s1, 8($s0)
	li $s2, 1
	sub $s3, $s1, $s2
	move $s1, $s3
	move $s2, $s0
	lw $s3, 0($s2)
	lw $s4, 12($s3)
	li $s3, 0
	move $a0, $s2
	move $a1, $s3
	move $a2, $s1
	jalr $s4
	move $s5, $v0
	move $s1, $s0
	lw $s0, 0($s1)
	lw $s2, 8($s0)
	move $a0, $s1
	jalr $s2
	move $s0, $v0
	li $s0, 0
	move $v0, $s0
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s5, -32($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	addu $sp, $sp, 44
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl QS_Sort
QS_Sort:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 76
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
	li $s4, 0
	move $s5, $s4
	sle $s4, $s1, $s2
	beqz $s4, L13
	xor $s4, $s1, $s2
	beqz $s4, L13
	lw $s4, 4($s0)
	mul $s6, $s2, 4
	add $s7, $s4, $s6
	lw $s4, 4($s7)
	move $s6, $s4
	li $s4, 1
	sub $s7, $s1, $s4
	move $s4, $s7
	move $s7, $s2
	li $t0, 1
	move $t1, $t0
L1:
	nop
	beqz $t1, L12
	li $t0, 1
	move $t2, $t0
L2:
	nop
	beqz $t2, L5
	li $t0, 1
	add $t3, $s4, $t0
	move $s4, $t3
	lw $t0, 4($s0)
	mul $t3, $s4, 4
	add $t4, $t0, $t3
	lw $t0, 4($t4)
	move $t3, $t0
	li $t0, 1
	sub $t4, $s6, $t0
	sle $t0, $t3, $t4
	xori $t4, $t0, 1
	beqz $t4, L3
	li $t0, 0
	move $t2, $t0
	b L4
L3:
	nop
	li $t0, 1
	move $t2, $t0
L4:
	nop
	b L2
L5:
	nop
	li $t0, 1
	move $t2, $t0
L6:
	nop
	beqz $t2, L9
	li $t0, 1
	sub $t4, $s7, $t0
	move $s7, $t4
	lw $t0, 4($s0)
	mul $t4, $s7, 4
	add $t5, $t0, $t4
	lw $t0, 4($t5)
	move $t3, $t0
	li $t0, 1
	sub $t4, $t3, $t0
	sle $t0, $s6, $t4
	xori $t3, $t0, 1
	beqz $t3, L7
	li $t0, 0
	move $t2, $t0
	b L8
L7:
	nop
	li $t0, 1
	move $t2, $t0
L8:
	nop
	b L6
L9:
	nop
	lw $t0, 4($s0)
	mul $t2, $s4, 4
	add $t3, $t0, $t2
	lw $t0, 4($t3)
	move $s5, $t0
	lw $t0, 4($s0)
	mul $t2, $s7, 4
	add $t3, $t0, $t2
	lw $t0, 4($t3)
	lw $t2, 4($s0)
	mul $t3, $s4, 4
	add $t4, $t2, $t3
	sw $t0, 4($t4)
	lw $t0, 4($s0)
	mul $t2, $s7, 4
	add $t3, $t0, $t2
	sw $s5, 4($t3)
	sle $t0, $s7, $s4
	beqz $t0, L10
	li $t0, 0
	move $t1, $t0
	b L11
L10:
	nop
	li $t0, 1
	move $t1, $t0
L11:
	nop
	b L1
L12:
	nop
	lw $s6, 4($s0)
	mul $t0, $s4, 4
	add $t1, $s6, $t0
	lw $s6, 4($t1)
	lw $t0, 4($s0)
	mul $t1, $s7, 4
	add $s7, $t0, $t1
	sw $s6, 4($s7)
	lw $s6, 4($s0)
	mul $s7, $s2, 4
	add $t0, $s6, $s7
	lw $s6, 4($t0)
	lw $s7, 4($s0)
	mul $t0, $s4, 4
	add $t1, $s7, $t0
	sw $s6, 4($t1)
	lw $s6, 4($s0)
	mul $s7, $s2, 4
	add $t0, $s6, $s7
	sw $s5, 4($t0)
	move $s5, $s0
	lw $s6, 0($s5)
	lw $s7, 12($s6)
	li $s6, 1
	sub $t0, $s4, $s6
	move $a0, $s5
	move $a1, $s1
	move $a2, $t0
	jalr $s7
	move $s6, $v0
	move $s1, $s0
	lw $s0, 0($s1)
	lw $s5, 12($s0)
	li $s0, 1
	add $s6, $s4, $s0
	move $a0, $s1
	move $a1, $s6
	move $a2, $s2
	jalr $s5
	move $s0, $v0
	b L14
L13:
	nop
	li $s0, 0
L14:
	nop
	li $s0, 0
	move $v0, $s0
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s5, -32($fp)
	lw $s6, -36($fp)
	lw $s7, -40($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	addu $sp, $sp, 76
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl QS_Print
QS_Print:
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
	li $s1, 0
	move $s2, $s1
L15:
	nop
	lw $s1, 8($s0)
	li $s3, 1
	sub $s4, $s1, $s3
	sle $s1, $s2, $s4
	beqz $s1, L16
	lw $s1, 4($s0)
	mul $s3, $s2, 4
	add $s4, $s1, $s3
	lw $s1, 4($s4)
	move $a0, $s1
	jal _print
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	b L15
L16:
	nop
	li $s0, 0
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
	.globl QS_Init
QS_Init:
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
	sw $s1, 8($s0)
	addi $s2, $s1, 1
	mul $s3, $s2, 4
	move $a0, $s3
	jal _halloc
	move $s2, $v0
	sw $s1, 0($s2)
	sw $s2, 4($s0)
	li $s1, 0
	li $s2, 20
	lw $s3, 4($s0)
	mul $s4, $s1, 4
	add $s1, $s3, $s4
	sw $s2, 4($s1)
	li $s1, 1
	li $s2, 7
	lw $s3, 4($s0)
	mul $s4, $s1, 4
	add $s1, $s3, $s4
	sw $s2, 4($s1)
	li $s1, 2
	li $s2, 12
	lw $s3, 4($s0)
	mul $s4, $s1, 4
	add $s1, $s3, $s4
	sw $s2, 4($s1)
	li $s1, 3
	li $s2, 18
	lw $s3, 4($s0)
	mul $s4, $s1, 4
	add $s1, $s3, $s4
	sw $s2, 4($s1)
	li $s1, 4
	li $s2, 2
	lw $s3, 4($s0)
	mul $s4, $s1, 4
	add $s1, $s3, $s4
	sw $s2, 4($s1)
	li $s1, 5
	li $s2, 11
	lw $s3, 4($s0)
	mul $s4, $s1, 4
	add $s1, $s3, $s4
	sw $s2, 4($s1)
	li $s1, 6
	li $s2, 6
	lw $s3, 4($s0)
	mul $s4, $s1, 4
	add $s1, $s3, $s4
	sw $s2, 4($s1)
	li $s1, 7
	li $s2, 9
	lw $s3, 4($s0)
	mul $s4, $s1, 4
	add $s1, $s3, $s4
	sw $s2, 4($s1)
	li $s1, 8
	li $s2, 19
	lw $s3, 4($s0)
	mul $s4, $s1, 4
	add $s1, $s3, $s4
	sw $s2, 4($s1)
	li $s1, 9
	li $s2, 5
	lw $s3, 4($s0)
	mul $s0, $s1, 4
	add $s1, $s3, $s0
	sw $s2, 4($s1)
	li $s0, 0
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
