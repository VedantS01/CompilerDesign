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
	la $s2, BBS_Init
	sw $s2, 12($s0)
	la $s2, BBS_Print
	sw $s2, 8($s0)
	la $s2, BBS_Sort
	sw $s2, 4($s0)
	la $s2, BBS_Start
	sw $s2, 0($s0)
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
	.globl BBS_Start
BBS_Start:
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
	move $s2, $s1
	lw $s0, 0($s2)
	lw $s0, 8($s0)
	move $a0, $s2
	jalr $s0
	move $s0, $v0
	move $s3, $s0
	li $s0, 99999
	move $a0, $s0
	jal _print
	move $s0, $s1
	lw $s2, 0($s0)
	lw $s2, 4($s2)
	move $a0, $s0
	jalr $s2
	move $s2, $v0
	move $s3, $s2
	lw $s2, 0($s1)
	lw $s2, 8($s2)
	move $a0, $s1
	jalr $s2
	move $s2, $v0
	move $s3, $s2
	li $s2, 0
	move $v0, $s2
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	lw $s3, -24($fp)
	addu $sp, $sp, 28
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl BBS_Sort
BBS_Sort:
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
	move $s0, $a0
	lw $s1, 8($s0)
	li $s2, 1
	sub $s2, $s1, $s2
	li $s1, 0
	li $s3, 1
	sub $s3, $s1, $s3
L2:
	li $s1, 1
	sub $s1, $s2, $s1
	sle $s1, $s3, $s1
	beqz $s1, L3
	li $s1, 1
L4:
	sle $s4, $s1, $s2
	beqz $s4, L5
	li $s4, 1
	sub $s4, $s1, $s4
	lw $s5, 4($s0)
	li $s6, 4
	mul $s6, $s4, $s6
	lw $s5, 4($s0)
	lw $s4, 0($s5)
	li $s7, 1
	li $t0, 1
	sub $t0, $s4, $t0
	sle $t0, $s6, $t0
	sub $t0, $s7, $t0
	beqz $t0, L6
	jal _error
L6:
	nop
	li $t0, 4
	add $t0, $s6, $t0
	add $t0, $s5, $t0
	lw $t0, 0($t0)
	lw $s5, 4($s0)
	li $s6, 4
	mul $s6, $s1, $s6
	lw $s5, 4($s0)
	lw $s7, 0($s5)
	li $s4, 1
	li $t1, 1
	sub $t1, $s7, $t1
	sle $t1, $s6, $t1
	sub $t1, $s4, $t1
	beqz $t1, L7
	jal _error
L7:
	nop
	li $t1, 4
	add $t1, $s6, $t1
	add $t1, $s5, $t1
	lw $t1, 0($t1)
	li $s5, 1
	sub $s5, $t0, $s5
	sle $s5, $t1, $s5
	beqz $s5, L8
	li $s5, 1
	sub $s5, $s1, $s5
	lw $t1, 4($s0)
	li $t0, 4
	mul $t0, $s5, $t0
	lw $t1, 4($s0)
	lw $s6, 0($t1)
	li $s4, 1
	li $s7, 1
	sub $s7, $s6, $s7
	sle $s7, $t0, $s7
	sub $s7, $s4, $s7
	beqz $s7, L10
	jal _error
L10:
	nop
	li $s7, 4
	add $s7, $t0, $s7
	add $s7, $t1, $s7
	lw $s7, 0($s7)
	li $t1, 1
	li $t0, 4
	mul $t0, $t1, $t0
	add $t1, $s0, $t0
	lw $t1, 0($t1)
	li $s4, 4
	mul $s4, $s5, $s4
	li $s5, 1
	li $s6, 4
	mul $s6, $s5, $s6
	move $t0, $s6
	add $t0, $s0, $t0
	lw $t1, 0($t0)
	lw $t0, 0($t1)
	li $s6, 1
	li $s5, 1
	sub $s5, $t0, $s5
	sle $s5, $s4, $s5
	sub $s5, $s6, $s5
	beqz $s5, L11
	jal _error
L11:
	nop
	li $s5, 4
	add $s5, $s4, $s5
	add $s5, $t1, $s5
	lw $t1, 4($s0)
	li $s4, 4
	mul $s4, $s1, $s4
	lw $t1, 4($s0)
	lw $s6, 0($t1)
	li $t0, 1
	li $t2, 1
	sub $t2, $s6, $t2
	sle $t2, $s4, $t2
	sub $t2, $t0, $t2
	beqz $t2, L12
	jal _error
L12:
	nop
	li $t2, 4
	add $t2, $s4, $t2
	add $t2, $t1, $t2
	lw $t2, 0($t2)
	sw $t2, 0($s5)
	li $t2, 1
	li $s5, 4
	mul $s5, $t2, $s5
	add $t2, $s0, $s5
	lw $t2, 0($t2)
	li $t1, 4
	mul $t1, $s1, $t1
	li $s4, 1
	li $t0, 4
	mul $t0, $s4, $t0
	move $s5, $t0
	add $s5, $s0, $s5
	lw $t2, 0($s5)
	lw $s5, 0($t2)
	li $t0, 1
	li $s4, 1
	sub $s4, $s5, $s4
	sle $s4, $t1, $s4
	sub $s4, $t0, $s4
	beqz $s4, L13
	jal _error
L13:
	nop
	li $s4, 4
	add $s4, $t1, $s4
	add $s4, $t2, $s4
	sw $s7, 0($s4)
	b L9
L8:
	li $s4, 0
L9:
	nop
	li $s4, 1
	add $s4, $s1, $s4
	move $s1, $s4
	b L4
L5:
	nop
	li $s1, 1
	sub $s1, $s2, $s1
	move $s2, $s1
	b L2
L3:
	nop
	li $s3, 0
	move $v0, $s3
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
	.globl BBS_Print
BBS_Print:
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
	li $s1, 0
L14:
	lw $s2, 8($s0)
	li $s3, 1
	sub $s3, $s2, $s3
	sle $s3, $s1, $s3
	beqz $s3, L15
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
	beqz $s6, L16
	jal _error
L16:
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
	b L14
L15:
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
	.globl BBS_Init
BBS_Init:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 28
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	sw $s5, -32($fp)
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
L17:
	li $s4, 1
	add $s4, $s0, $s4
	li $s5, 4
	mul $s5, $s4, $s5
	li $s4, 1
	sub $s4, $s5, $s4
	sle $s4, $s2, $s4
	beqz $s4, L18
	add $s4, $s3, $s2
	li $s5, 0
	sw $s5, 0($s4)
	li $s5, 4
	add $s5, $s2, $s5
	move $s2, $s5
	b L17
L18:
	li $s2, 4
	mul $s2, $s0, $s2
	sw $s2, 0($s3)
	sw $s3, 4($s1)
	li $s3, 1
	li $s2, 4
	mul $s2, $s3, $s2
	add $s3, $s1, $s2
	lw $s3, 0($s3)
	li $s0, 0
	li $s5, 4
	mul $s5, $s0, $s5
	li $s0, 1
	li $s4, 4
	mul $s4, $s0, $s4
	move $s2, $s4
	add $s2, $s1, $s2
	lw $s3, 0($s2)
	lw $s2, 0($s3)
	li $s4, 1
	li $s0, 1
	sub $s0, $s2, $s0
	sle $s0, $s5, $s0
	sub $s0, $s4, $s0
	beqz $s0, L19
	jal _error
L19:
	nop
	li $s0, 4
	add $s0, $s5, $s0
	add $s0, $s3, $s0
	li $s3, 20
	sw $s3, 0($s0)
	li $s3, 1
	li $s0, 4
	mul $s0, $s3, $s0
	add $s3, $s1, $s0
	lw $s3, 0($s3)
	li $s5, 1
	li $s4, 4
	mul $s4, $s5, $s4
	li $s5, 1
	li $s2, 4
	mul $s2, $s5, $s2
	move $s0, $s2
	add $s0, $s1, $s0
	lw $s3, 0($s0)
	lw $s0, 0($s3)
	li $s2, 1
	li $s5, 1
	sub $s5, $s0, $s5
	sle $s5, $s4, $s5
	sub $s5, $s2, $s5
	beqz $s5, L20
	jal _error
L20:
	nop
	li $s5, 4
	add $s5, $s4, $s5
	add $s5, $s3, $s5
	li $s3, 7
	sw $s3, 0($s5)
	li $s3, 1
	li $s5, 4
	mul $s5, $s3, $s5
	add $s3, $s1, $s5
	lw $s3, 0($s3)
	li $s4, 2
	li $s2, 4
	mul $s2, $s4, $s2
	li $s4, 1
	li $s0, 4
	mul $s0, $s4, $s0
	move $s5, $s0
	add $s5, $s1, $s5
	lw $s3, 0($s5)
	lw $s5, 0($s3)
	li $s0, 1
	li $s4, 1
	sub $s4, $s5, $s4
	sle $s4, $s2, $s4
	sub $s4, $s0, $s4
	beqz $s4, L21
	jal _error
L21:
	nop
	li $s4, 4
	add $s4, $s2, $s4
	add $s4, $s3, $s4
	li $s3, 12
	sw $s3, 0($s4)
	li $s3, 1
	li $s4, 4
	mul $s4, $s3, $s4
	add $s3, $s1, $s4
	lw $s3, 0($s3)
	li $s2, 3
	li $s0, 4
	mul $s0, $s2, $s0
	li $s2, 1
	li $s5, 4
	mul $s5, $s2, $s5
	move $s4, $s5
	add $s4, $s1, $s4
	lw $s3, 0($s4)
	lw $s4, 0($s3)
	li $s5, 1
	li $s2, 1
	sub $s2, $s4, $s2
	sle $s2, $s0, $s2
	sub $s2, $s5, $s2
	beqz $s2, L22
	jal _error
L22:
	nop
	li $s2, 4
	add $s2, $s0, $s2
	add $s2, $s3, $s2
	li $s3, 18
	sw $s3, 0($s2)
	li $s3, 1
	li $s2, 4
	mul $s2, $s3, $s2
	add $s3, $s1, $s2
	lw $s3, 0($s3)
	li $s0, 4
	li $s5, 4
	mul $s5, $s0, $s5
	li $s0, 1
	li $s4, 4
	mul $s4, $s0, $s4
	move $s2, $s4
	add $s2, $s1, $s2
	lw $s3, 0($s2)
	lw $s2, 0($s3)
	li $s4, 1
	li $s0, 1
	sub $s0, $s2, $s0
	sle $s0, $s5, $s0
	sub $s0, $s4, $s0
	beqz $s0, L23
	jal _error
L23:
	nop
	li $s0, 4
	add $s0, $s5, $s0
	add $s0, $s3, $s0
	li $s3, 2
	sw $s3, 0($s0)
	li $s3, 1
	li $s0, 4
	mul $s0, $s3, $s0
	add $s3, $s1, $s0
	lw $s3, 0($s3)
	li $s5, 5
	li $s4, 4
	mul $s4, $s5, $s4
	li $s5, 1
	li $s2, 4
	mul $s2, $s5, $s2
	move $s0, $s2
	add $s0, $s1, $s0
	lw $s3, 0($s0)
	lw $s0, 0($s3)
	li $s2, 1
	li $s5, 1
	sub $s5, $s0, $s5
	sle $s5, $s4, $s5
	sub $s5, $s2, $s5
	beqz $s5, L24
	jal _error
L24:
	nop
	li $s5, 4
	add $s5, $s4, $s5
	add $s5, $s3, $s5
	li $s3, 11
	sw $s3, 0($s5)
	li $s3, 1
	li $s5, 4
	mul $s5, $s3, $s5
	add $s3, $s1, $s5
	lw $s3, 0($s3)
	li $s4, 6
	li $s2, 4
	mul $s2, $s4, $s2
	li $s4, 1
	li $s0, 4
	mul $s0, $s4, $s0
	move $s5, $s0
	add $s5, $s1, $s5
	lw $s3, 0($s5)
	lw $s5, 0($s3)
	li $s0, 1
	li $s4, 1
	sub $s4, $s5, $s4
	sle $s4, $s2, $s4
	sub $s4, $s0, $s4
	beqz $s4, L25
	jal _error
L25:
	nop
	li $s4, 4
	add $s4, $s2, $s4
	add $s4, $s3, $s4
	li $s3, 6
	sw $s3, 0($s4)
	li $s3, 1
	li $s4, 4
	mul $s4, $s3, $s4
	add $s3, $s1, $s4
	lw $s3, 0($s3)
	li $s2, 7
	li $s0, 4
	mul $s0, $s2, $s0
	li $s2, 1
	li $s5, 4
	mul $s5, $s2, $s5
	move $s4, $s5
	add $s4, $s1, $s4
	lw $s3, 0($s4)
	lw $s4, 0($s3)
	li $s5, 1
	li $s2, 1
	sub $s2, $s4, $s2
	sle $s2, $s0, $s2
	sub $s2, $s5, $s2
	beqz $s2, L26
	jal _error
L26:
	nop
	li $s2, 4
	add $s2, $s0, $s2
	add $s2, $s3, $s2
	li $s3, 9
	sw $s3, 0($s2)
	li $s3, 1
	li $s2, 4
	mul $s2, $s3, $s2
	add $s3, $s1, $s2
	lw $s3, 0($s3)
	li $s0, 8
	li $s5, 4
	mul $s5, $s0, $s5
	li $s0, 1
	li $s4, 4
	mul $s4, $s0, $s4
	move $s2, $s4
	add $s2, $s1, $s2
	lw $s3, 0($s2)
	lw $s2, 0($s3)
	li $s4, 1
	li $s0, 1
	sub $s0, $s2, $s0
	sle $s0, $s5, $s0
	sub $s0, $s4, $s0
	beqz $s0, L27
	jal _error
L27:
	nop
	li $s0, 4
	add $s0, $s5, $s0
	add $s0, $s3, $s0
	li $s3, 19
	sw $s3, 0($s0)
	li $s3, 1
	li $s0, 4
	mul $s0, $s3, $s0
	add $s3, $s1, $s0
	lw $s3, 0($s3)
	li $s5, 9
	li $s4, 4
	mul $s4, $s5, $s4
	li $s5, 1
	li $s2, 4
	mul $s2, $s5, $s2
	move $s0, $s2
	add $s0, $s1, $s0
	lw $s3, 0($s0)
	lw $s0, 0($s3)
	li $s1, 1
	li $s2, 1
	sub $s2, $s0, $s2
	sle $s2, $s4, $s2
	sub $s2, $s1, $s2
	beqz $s2, L28
	jal _error
L28:
	nop
	li $s2, 4
	add $s2, $s4, $s2
	add $s2, $s3, $s2
	li $s3, 5
	sw $s3, 0($s2)
	li $s3, 0
	move $v0, $s3
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s5, -32($fp)
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
