	.text
	.globl main
main:
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 12
	li $s0, 12
	move $a0, $s0
	jal _halloc
	move $s0, $v0
	li $s1, 24
	move $a0, $s1
	jal _halloc
	move $s1, $v0
	la $s2, BS_Div
	sw $s2, 20($s1)
	la $s2, BS_Init
	sw $s2, 4($s1)
	la $s2, BS_Print
	sw $s2, 8($s1)
	la $s2, BS_Search
	sw $s2, 12($s1)
	la $s2, BS_Compare
	sw $s2, 16($s1)
	la $s2, BS_Start
	sw $s2, 0($s1)
	sw $s1, 0($s0)
	lw $s1, 0($s0)
	lw $s1, 0($s1)
	li $s2, 20
	li $s3, 0
	add $s3, $s2, $s3
	move $a0, $s0
	move $a1, $s3
	jalr $s1
	move $s3, $v0
	move $a0, $s3
	jal _print
	addu $sp, $sp, 12
	lw $ra, -4($sp)
	jal _exitret
	.text
	.globl BS_Start
BS_Start:
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
	lw $s3, 4($s3)
	move $a0, $s2
	move $a1, $s0
	jalr $s3
	move $s3, $v0
	move $s3, $s1
	lw $s2, 0($s3)
	lw $s2, 8($s2)
	move $a0, $s3
	jalr $s2
	move $s2, $v0
	move $s2, $s1
	lw $s3, 0($s2)
	lw $s3, 12($s3)
	li $s0, 8
	move $a0, $s2
	move $a1, $s0
	jalr $s3
	move $s0, $v0
	beqz $s0, L1
	li $s0, 1
	li $s3, 0
	add $s3, $s0, $s3
	move $a0, $s3
	jal _print
	b L0
L1:
	nop
	li $s3, 0
	li $s0, 0
	add $s0, $s3, $s0
	move $a0, $s0
	jal _print
L0:
	nop
	move $s0, $s1
	lw $s3, 0($s0)
	lw $s3, 12($s3)
	li $s2, 19
	move $a0, $s0
	move $a1, $s2
	jalr $s3
	move $s2, $v0
	beqz $s2, L3
	li $s2, 1
	li $s3, 0
	add $s3, $s2, $s3
	move $a0, $s3
	jal _print
	b L2
L3:
	nop
	li $s3, 0
	li $s2, 0
	add $s2, $s3, $s2
	move $a0, $s2
	jal _print
L2:
	nop
	move $s2, $s1
	lw $s3, 0($s2)
	lw $s3, 12($s3)
	li $s0, 20
	move $a0, $s2
	move $a1, $s0
	jalr $s3
	move $s0, $v0
	beqz $s0, L5
	li $s0, 1
	li $s3, 0
	add $s3, $s0, $s3
	move $a0, $s3
	jal _print
	b L4
L5:
	nop
	li $s3, 0
	li $s0, 0
	add $s0, $s3, $s0
	move $a0, $s0
	jal _print
L4:
	nop
	move $s0, $s1
	lw $s3, 0($s0)
	lw $s3, 12($s3)
	li $s2, 21
	move $a0, $s0
	move $a1, $s2
	jalr $s3
	move $s2, $v0
	beqz $s2, L7
	li $s2, 1
	li $s3, 0
	add $s3, $s2, $s3
	move $a0, $s3
	jal _print
	b L6
L7:
	nop
	li $s3, 0
	li $s2, 0
	add $s2, $s3, $s2
	move $a0, $s2
	jal _print
L6:
	nop
	move $s2, $s1
	lw $s3, 0($s2)
	lw $s3, 12($s3)
	li $s0, 37
	move $a0, $s2
	move $a1, $s0
	jalr $s3
	move $s0, $v0
	beqz $s0, L9
	li $s0, 1
	li $s3, 0
	add $s3, $s0, $s3
	move $a0, $s3
	jal _print
	b L8
L9:
	nop
	li $s3, 0
	li $s0, 0
	add $s0, $s3, $s0
	move $a0, $s0
	jal _print
L8:
	nop
	move $s0, $s1
	lw $s3, 0($s0)
	lw $s3, 12($s3)
	li $s2, 38
	move $a0, $s0
	move $a1, $s2
	jalr $s3
	move $s2, $v0
	beqz $s2, L11
	li $s2, 1
	li $s3, 0
	add $s3, $s2, $s3
	move $a0, $s3
	jal _print
	b L10
L11:
	nop
	li $s3, 0
	li $s2, 0
	add $s2, $s3, $s2
	move $a0, $s2
	jal _print
L10:
	nop
	move $s2, $s1
	lw $s3, 0($s2)
	lw $s3, 12($s3)
	li $s0, 39
	move $a0, $s2
	move $a1, $s0
	jalr $s3
	move $s0, $v0
	beqz $s0, L13
	li $s0, 1
	li $s3, 0
	add $s3, $s0, $s3
	move $a0, $s3
	jal _print
	b L12
L13:
	nop
	li $s3, 0
	li $s0, 0
	add $s0, $s3, $s0
	move $a0, $s0
	jal _print
L12:
	nop
	lw $s0, 0($s1)
	lw $s0, 12($s0)
	li $s3, 50
	move $a0, $s1
	move $a1, $s3
	jalr $s0
	move $s3, $v0
	beqz $s3, L15
	li $s3, 1
	li $s0, 0
	add $s0, $s3, $s0
	move $a0, $s0
	jal _print
	b L14
L15:
	nop
	li $s0, 0
	li $s3, 0
	add $s3, $s0, $s3
	move $a0, $s3
	jal _print
L14:
	nop
	li $s3, 999
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
	.globl BS_Search
BS_Search:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 56
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
	li $s2, 0
	li $s3, 0
	lw $s4, 4($s1)
	lw $s4, 0($s4)
	li $s5, 1
	sub $s5, $s4, $s5
	move $s4, $s5
	li $s5, 0
	li $s6, 1
L16:
	nop
	beqz $s6, L17
	add $s7, $s5, $s4
	move $t0, $s1
	lw $t1, 0($t0)
	lw $t1, 20($t1)
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	move $a0, $t0
	move $a1, $s7
	jalr $t1
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	move $t1, $v0
	move $s7, $t1
	lw $t1, 4($s1)
	mul $t0, $s7, 4
	add $t0, $t1, $t0
	lw $t0, 4($t0)
	move $s2, $t0
	li $t0, 1
	sub $t0, $s2, $t0
	sle $t0, $s0, $t0
	beqz $t0, L19
	li $t0, 1
	sub $t0, $s7, $t0
	move $s4, $t0
	b L18
L19:
	nop
	li $t0, 1
	add $t0, $s7, $t0
	move $s5, $t0
L18:
	nop
	move $t0, $s1
	lw $s7, 0($t0)
	lw $s7, 16($s7)
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	move $a0, $t0
	move $a1, $s2
	move $a2, $s0
	jalr $s7
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	move $s7, $v0
	beqz $s7, L21
	li $s7, 0
	move $s6, $s7
	b L20
L21:
	nop
	li $s7, 1
	move $s6, $s7
L20:
	nop
	li $s7, 1
	sub $s7, $s5, $s7
	sle $s7, $s4, $s7
	beqz $s7, L23
	li $s7, 0
	move $s6, $s7
	b L22
L23:
	nop
	li $s7, 0
L22:
	nop
	b L16
L17:
	nop
	lw $s6, 0($s1)
	lw $s6, 16($s6)
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	move $a0, $s1
	move $a1, $s2
	move $a2, $s0
	jalr $s6
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	move $s6, $v0
	beqz $s6, L25
	li $s6, 1
	move $s3, $s6
	b L24
L25:
	nop
	li $s6, 0
	move $s3, $s6
L24:
	nop
	move $v0, $s3
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s5, -32($fp)
	lw $s6, -36($fp)
	lw $s7, -40($fp)
	addu $sp, $sp, 56
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl BS_Div
BS_Div:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 20
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	sw $s3, -24($fp)
	move $s0, $a1
	li $s1, 0
	li $s2, 0
	li $s3, 1
	sub $s3, $s0, $s3
L26:
	nop
	sle $s0, $s2, $s3
	beqz $s0, L27
	xor $s0, $s2, $s3
	beqz $s0, L27
	li $s0, 1
	add $s0, $s1, $s0
	move $s1, $s0
	li $s0, 2
	add $s0, $s2, $s0
	move $s2, $s0
	b L26
L27:
	nop
	move $v0, $s1
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	lw $s3, -24($fp)
	addu $sp, $sp, 20
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl BS_Compare
BS_Compare:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 24
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	move $s0, $a2
	move $s1, $a1
	li $s2, 0
	li $s3, 1
	add $s3, $s0, $s3
	li $s4, 1
	sub $s4, $s0, $s4
	sle $s4, $s1, $s4
	beqz $s4, L29
	li $s4, 0
	move $s2, $s4
	b L28
L29:
	nop
	li $s4, 1
	sub $s4, $s3, $s4
	sle $s4, $s1, $s4
	xori $s4, $s4, 1
	beqz $s4, L31
	li $s4, 0
	move $s2, $s4
	b L30
L31:
	nop
	li $s4, 1
	move $s2, $s4
L30:
	nop
L28:
	nop
	move $v0, $s2
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	addu $sp, $sp, 24
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl BS_Print
BS_Print:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 20
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	sw $s3, -24($fp)
	move $s0, $a0
	li $s1, 1
L32:
	nop
	lw $s2, 8($s0)
	sle $s2, $s1, $s2
	beqz $s2, L33
	lw $s2, 8($s0)
	xor $s2, $s1, $s2
	beqz $s2, L33
	lw $s2, 4($s0)
	mul $s3, $s1, 4
	add $s3, $s2, $s3
	lw $s3, 4($s3)
	move $a0, $s3
	jal _print
	li $s3, 1
	add $s3, $s1, $s3
	move $s1, $s3
	b L32
L33:
	nop
	li $s1, 9999
	li $s0, 0
	add $s0, $s1, $s0
	move $a0, $s0
	jal _print
	li $s0, 0
	move $v0, $s0
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	lw $s3, -24($fp)
	addu $sp, $sp, 20
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl BS_Init
BS_Init:
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
	addi $s2, $s0, 1
	mul $s2, $s2, 4
	move $a0, $s2
	jal _halloc
	move $s2, $v0
	sw $s0, 0($s2)
	sw $s2, 4($s1)
	li $s2, 0
	li $s0, 0
	lw $s3, 4($s1)
	mul $s2, $s2, 4
	add $s2, $s3, $s2
	sw $s0, 4($s2)
	li $s2, 1
	lw $s0, 8($s1)
	li $s3, 1
	add $s3, $s0, $s3
L34:
	nop
	lw $s0, 8($s1)
	li $s4, 1
	sub $s4, $s0, $s4
	sle $s4, $s2, $s4
	beqz $s4, L35
	li $s4, 2
	mul $s4, $s4, $s2
	li $s0, 3
	sub $s0, $s3, $s0
	add $s0, $s4, $s0
	lw $s4, 4($s1)
	mul $s5, $s2, 4
	add $s5, $s4, $s5
	sw $s0, 4($s5)
	li $s5, 1
	add $s5, $s2, $s5
	move $s2, $s5
	li $s5, 1
	sub $s5, $s3, $s5
	move $s3, $s5
	b L34
L35:
	nop
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
