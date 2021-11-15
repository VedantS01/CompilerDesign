	.text
	.globl main
main:
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 12
	li $s0, 16
	move $a0, $s0
	jal _halloc
	move $s0, $v0
	li $s1, 12
	move $a0, $s1
	jal _halloc
	move $s1, $v0
	la $s2, LS_Init
	sw $s2, 12($s0)
	la $s2, LS_Search
	sw $s2, 8($s0)
	la $s2, LS_Print
	sw $s2, 4($s0)
	la $s2, LS_Start
	sw $s2, 0($s0)
	li $s2, 4
L0:
	li $s3, 11
	sle $s3, $s2, $s3
	beqz $s3, L1
	add $s3, $s1, $s2
	li $s4, 0
	sw $s4, 0($s3)
	li $s4, 4
	add $s4, $s2, $s4
	move $s2, $s4
	b L0
L1:
	sw $s0, 0($s1)
	lw $s0, 0($s1)
	lw $s0, 0($s0)
	li $s2, 10
	move $a0, $s1
	move $a1, $s2
	jalr $s0
	move $s2, $v0
	move $a0, $s2
	jal _print
	addu $sp, $sp, 12
	lw $ra, -4($sp)
	jal _exitret
	.text
	.globl LS_Start
LS_Start:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 28
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	sw $s3, -24($fp)
	move $s0, $a1
	move $s1, $a0
	move $s2, $s1
	lw $s3, 0($s2)
	lw $s3, 12($s3)
	move $a0, $s2
	move $a1, $s0
	jalr $s3
	move $s3, $v0
	move $s3, $s1
	lw $s2, 0($s3)
	lw $s2, 4($s2)
	move $a0, $s3
	jalr $s2
	move $s2, $v0
	li $s2, 9999
	move $a0, $s2
	jal _print
	move $s2, $s1
	lw $s3, 0($s2)
	lw $s3, 8($s3)
	li $s0, 8
	move $a0, $s2
	move $a1, $s0
	jalr $s3
	move $s0, $v0
	move $a0, $s0
	jal _print
	move $s0, $s1
	lw $s3, 0($s0)
	lw $s3, 8($s3)
	li $s2, 12
	move $a0, $s0
	move $a1, $s2
	jalr $s3
	move $s2, $v0
	move $a0, $s2
	jal _print
	move $s2, $s1
	lw $s3, 0($s2)
	lw $s3, 8($s3)
	li $s0, 17
	move $a0, $s2
	move $a1, $s0
	jalr $s3
	move $s0, $v0
	move $a0, $s0
	jal _print
	lw $s0, 0($s1)
	lw $s0, 8($s0)
	li $s3, 50
	move $a0, $s1
	move $a1, $s3
	jalr $s0
	move $s3, $v0
	move $a0, $s3
	jal _print
	li $s3, 55
	move $v0, $s3
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	lw $s3, -24($fp)
	addu $sp, $sp, 28
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl LS_Print
LS_Print:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 32
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	sw $s5, -32($fp)
	sw $s6, -36($fp)
	move $s0, $a0
	li $s1, 1
L2:
	lw $s2, 8($s0)
	li $s3, 1
	sub $s3, $s2, $s3
	sle $s3, $s1, $s3
	beqz $s3, L3
	lw $s3, 4($s0)
	li $s2, 4
	mul $s2, $s1, $s2
	lw $s3, 4($s0)
	lw $s4, 0($s3)
	li $s5, 1
	li $s6, 1
	sub $s6, $s4, $s6
	sle $s6, $s2, $s6
	sub $s6, $s5, $s6
	beqz $s6, L4
	jal _error
L4:
	nop
	li $s6, 4
	add $s6, $s2, $s6
	add $s6, $s3, $s6
	lw $s6, 0($s6)
	move $a0, $s6
	jal _print
	li $s6, 1
	add $s6, $s1, $s6
	move $s1, $s6
	b L2
L3:
	nop
	li $s1, 0
	move $v0, $s1
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s5, -32($fp)
	lw $s6, -36($fp)
	addu $sp, $sp, 32
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl LS_Search
LS_Search:
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
	move $s0, $a1
	move $s1, $a0
	li $s2, 1
	li $s3, 0
	li $s4, 0
L5:
	lw $s5, 8($s1)
	li $s6, 1
	sub $s6, $s5, $s6
	sle $s6, $s2, $s6
	beqz $s6, L6
	lw $s6, 4($s1)
	li $s5, 4
	mul $s5, $s2, $s5
	lw $s6, 4($s1)
	lw $s7, 0($s6)
	li $t0, 1
	li $t1, 1
	sub $t1, $s7, $t1
	sle $t1, $s5, $t1
	sub $t1, $t0, $t1
	beqz $t1, L7
	jal _error
L7:
	nop
	li $t1, 4
	add $t1, $s5, $t1
	add $t1, $s6, $t1
	lw $t1, 0($t1)
	li $s6, 1
	add $s6, $s0, $s6
	li $s5, 1
	sub $s5, $s0, $s5
	sle $s5, $t1, $s5
	beqz $s5, L8
	li $s5, 0
	b L9
L8:
	li $t0, 1
	li $s7, 1
	sub $s7, $s6, $s7
	sle $s7, $t1, $s7
	sub $s7, $t0, $s7
	beqz $s7, L10
	li $s7, 0
	move $s5, $s7
	b L11
L10:
	li $s7, 1
	move $s3, $s7
	li $s7, 1
	move $s4, $s7
	lw $s7, 8($s1)
	move $s2, $s7
L11:
	nop
L9:
	nop
	li $s7, 1
	add $s7, $s2, $s7
	move $s2, $s7
	b L5
L6:
	nop
	move $v0, $s4
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
	.globl LS_Init
LS_Init:
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
	move $s0, $a1
	move $s1, $a0
	sw $s0, 8($s1)
	li $s2, 1
	add $s2, $s0, $s2
	li $s3, 4
	mul $s3, $s2, $s3
	move $a0, $s3
	jal _halloc
	move $s3, $v0
	li $s2, 4
L12:
	li $s4, 1
	add $s4, $s0, $s4
	li $s5, 4
	mul $s5, $s4, $s5
	li $s4, 1
	sub $s4, $s5, $s4
	sle $s4, $s2, $s4
	beqz $s4, L13
	add $s4, $s3, $s2
	li $s5, 0
	sw $s5, 0($s4)
	li $s5, 4
	add $s5, $s2, $s5
	move $s2, $s5
	b L12
L13:
	li $s2, 4
	mul $s2, $s0, $s2
	sw $s2, 0($s3)
	sw $s3, 4($s1)
	li $s3, 1
	lw $s2, 8($s1)
	li $s0, 1
	add $s0, $s2, $s0
L14:
	lw $s2, 8($s1)
	li $s5, 1
	sub $s5, $s2, $s5
	sle $s5, $s3, $s5
	beqz $s5, L15
	li $s5, 2
	mul $s5, $s5, $s3
	li $s2, 3
	sub $s2, $s0, $s2
	li $s4, 1
	li $s6, 4
	mul $s6, $s4, $s6
	add $s4, $s1, $s6
	lw $s4, 0($s4)
	li $s7, 4
	mul $s7, $s3, $s7
	li $t0, 1
	li $t1, 4
	mul $t1, $t0, $t1
	move $s6, $t1
	add $s6, $s1, $s6
	lw $s4, 0($s6)
	lw $s6, 0($s4)
	li $t1, 1
	li $t0, 1
	sub $t0, $s6, $t0
	sle $t0, $s7, $t0
	sub $t0, $t1, $t0
	beqz $t0, L16
	jal _error
L16:
	nop
	li $t0, 4
	add $t0, $s7, $t0
	add $t0, $s4, $t0
	add $s2, $s5, $s2
	sw $s2, 0($t0)
	li $s2, 1
	add $s2, $s3, $s2
	move $s3, $s2
	li $s2, 1
	sub $s2, $s0, $s2
	move $s0, $s2
	b L14
L15:
	nop
	li $s0, 0
	move $v0, $s0
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
