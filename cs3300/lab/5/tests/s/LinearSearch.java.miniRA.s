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
	la $s0, LS_Print
	sw $s0, 8($s2)
	la $s0, LS_Start
	sw $s0, 0($s2)
	la $s0, LS_Init
	sw $s0, 4($s2)
	la $s0, LS_Search
	sw $s0, 12($s2)
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
	.globl LS_Start
LS_Start:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 44
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	sw $s5, -32($fp)
	sw $s6, -36($fp)
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	move $s0, $a0
	move $s1, $a1
	move $s4, $s0
	lw $s5, 0($s4)
	lw $s6, 4($s5)
	move $a0, $s4
	move $a1, $s1
	jalr $s6
	move $s5, $v0
	move $s1, $s0
	lw $s4, 0($s1)
	lw $s5, 8($s4)
	move $a0, $s1
	jalr $s5
	move $s4, $v0
	li $s1, 9999
	move $a0, $s1
	jal _print
	move $s1, $s0
	lw $s4, 0($s1)
	lw $s5, 12($s4)
	li $s4, 8
	move $a0, $s1
	move $a1, $s4
	jalr $s5
	move $s6, $v0
	move $a0, $s6
	jal _print
	move $s1, $s0
	lw $s4, 0($s1)
	lw $s5, 12($s4)
	li $s4, 12
	move $a0, $s1
	move $a1, $s4
	jalr $s5
	move $s6, $v0
	move $a0, $s6
	jal _print
	move $s1, $s0
	lw $s4, 0($s1)
	lw $s5, 12($s4)
	li $s4, 17
	move $a0, $s1
	move $a1, $s4
	jalr $s5
	move $s6, $v0
	move $a0, $s6
	jal _print
	move $s1, $s0
	lw $s0, 0($s1)
	lw $s4, 12($s0)
	li $s0, 50
	move $a0, $s1
	move $a1, $s0
	jalr $s4
	move $s5, $v0
	move $a0, $s5
	jal _print
	li $s0, 55
	move $v0, $s0
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s5, -32($fp)
	lw $s6, -36($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	addu $sp, $sp, 44
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl LS_Print
LS_Print:
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
	li $s1, 1
	move $s2, $s1
L1:
	nop
	lw $s1, 8($s0)
	li $s3, 1
	sub $s4, $s1, $s3
	sle $s1, $s2, $s4
	beqz $s1, L2
	lw $s1, 4($s0)
	mul $s3, $s2, 4
	add $s4, $s1, $s3
	lw $s1, 4($s4)
	move $a0, $s1
	jal _print
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	b L1
L2:
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
	.globl LS_Search
LS_Search:
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
	li $s4, 1
	move $s5, $s4
	li $s4, 0
	li $s4, 0
	move $s6, $s4
L3:
	nop
	lw $s4, 8($s0)
	li $s7, 1
	sub $t0, $s4, $s7
	sle $s4, $s5, $t0
	beqz $s4, L8
	lw $s4, 4($s0)
	mul $s7, $s5, 4
	add $t0, $s4, $s7
	lw $s4, 4($t0)
	move $s7, $s4
	li $s4, 1
	add $t0, $s1, $s4
	move $s4, $t0
	sle $t0, $s7, $s1
	beqz $t0, L4
	xor $t0, $s7, $s1
	beqz $t0, L4
	li $t0, 0
	b L7
L4:
	nop
	li $t0, 1
	sub $t1, $s4, $t0
	sle $s4, $s7, $t1
	xori $s7, $s4, 1
	beqz $s7, L5
	li $s4, 0
	b L6
L5:
	nop
	li $s4, 1
	li $s4, 1
	move $s6, $s4
	lw $s4, 8($s0)
	move $s5, $s4
L6:
	nop
L7:
	nop
	li $s4, 1
	add $s7, $s5, $s4
	move $s5, $s7
	b L3
L8:
	nop
	move $v0, $s6
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
	.globl LS_Init
LS_Init:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 36
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	sw $s5, -32($fp)
	sw $s6, -36($fp)
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
	li $s1, 1
	move $s2, $s1
	lw $s1, 8($s0)
	li $s3, 1
	add $s4, $s1, $s3
	move $s1, $s4
L9:
	nop
	lw $s3, 8($s0)
	li $s4, 1
	sub $s5, $s3, $s4
	sle $s3, $s2, $s5
	beqz $s3, L10
	li $s3, 2
	mul $s4, $s3, $s2
	move $s3, $s4
	li $s4, 3
	sub $s5, $s1, $s4
	move $s4, $s5
	add $s5, $s3, $s4
	lw $s3, 4($s0)
	mul $s4, $s2, 4
	add $s6, $s3, $s4
	sw $s5, 4($s6)
	li $s3, 1
	add $s4, $s2, $s3
	move $s2, $s4
	li $s3, 1
	sub $s4, $s1, $s3
	move $s1, $s4
	b L9
L10:
	nop
	li $s0, 0
	move $v0, $s0
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s5, -32($fp)
	lw $s6, -36($fp)
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
