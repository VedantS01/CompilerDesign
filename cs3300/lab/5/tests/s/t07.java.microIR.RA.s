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
	li $s1, 8
	move $a0, $s1
	jal _halloc
	move $s1, $v0
	la $s2, t071_mark
	sw $s2, 4($s1)
	la $s2, t071_run
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
	.globl t071_mark
t071_mark:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 20
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	sw $s3, -24($fp)
	li $s0, 1
	li $s1, 0
	beqz $s0, L6
	beqz $s1, L6
	li $s2, 1
	b L7
L6:
	li $s2, 0
L7:
	nop
	xori $s2, $s2, 1
	beqz $s2, L3
	beqz $s0, L12
	beqz $s1, L12
	li $s2, 1
	b L13
L12:
	li $s2, 0
L13:
	nop
	beqz $s2, L10
	xori $s2, $s0, 1
	beqz $s2, L14
	beqz $s1, L15
L14:
	li $s2, 1
	b L16
L15:
	li $s2, 0
L16:
	nop
	beqz $s2, L10
	li $s2, 1
	b L11
L10:
	li $s2, 0
L11:
	nop
	beqz $s2, L8
	beqz $s0, L8
	li $s2, 1
	b L9
L8:
	li $s2, 0
L9:
	nop
	beqz $s2, L4
L3:
	li $s2, 1
	b L5
L4:
	li $s2, 0
L5:
	nop
	xori $s2, $s2, 1
	beqz $s2, L0
	beqz $s1, L1
L0:
	li $s2, 1
	b L2
L1:
	li $s2, 0
L2:
	nop
	xori $s3, $s2, 1
	beqz $s3, L19
	li $s3, 0
	b L17
L19:
	nop
	beqz $s2, L20
	beqz $s0, L20
	li $s2, 1
	b L21
L20:
	li $s2, 0
L21:
	nop
	b L18
L17:
	nop
	xori $s1, $s1, 1
	beqz $s1, L22
	beqz $s0, L23
L22:
	li $s0, 1
	b L24
L23:
	li $s0, 0
L24:
	nop
	move $s2, $s0
L18:
	nop
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
	.globl t071_run
t071_run:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 28
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	move $s0, $a0
	li $s1, 3
	li $s2, 9
	li $s3, 10
	lw $s4, 0($s0)
	lw $s4, 4($s4)
	move $a0, $s0
	jalr $s4
	move $s4, $v0
	beqz $s4, L25
	add $s2, $s1, $s2
	move $s3, $s2
L25:
	nop
	move $v0, $s3
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	lw $s3, -24($fp)
	lw $s4, -28($fp)
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
