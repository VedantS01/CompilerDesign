	.text
	.globl main
main:
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 36
	li $s0, 4
	move $a0, $s0
	jal _halloc
	move $s1, $v0
	li $s0, 8
	move $a0, $s0
	jal _halloc
	move $s2, $v0
	la $s0, t061_run
	sw $s0, 0($s2)
	la $s0, t061_mark
	sw $s0, 4($s2)
	sw $s2, 0($s1)
	lw $s0, 0($s1)
	lw $s2, 0($s0)
	li $s0, 4
	move $a0, $s0
	jal _halloc
	move $s3, $v0
	li $s0, 8
	move $a0, $s0
	jal _halloc
	move $s4, $v0
	la $s0, t061_run
	sw $s0, 0($s4)
	la $s0, t061_mark
	sw $s0, 4($s4)
	sw $s4, 0($s3)
	move $a0, $s1
	move $a1, $s3
	jalr $s2
	move $s0, $v0
	move $a0, $s0
	jal _print
	addu $sp, $sp, 36
	lw $ra, -4($sp)
	jal _exitret
	.text
	.globl t061_mark
t061_mark:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 32
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	sw $s5, -32($fp)
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	move $s0, $a0
	li $s2, 1
	move $s3, $s2
	li $s2, 0
	move $s4, $s2
	beqz $s3, L1
	beqz $s4, L1
	li $s2, 1
	b L2
L1:
	li $s2, 0
L2:
	nop
	xori $s5, $s2, 1
	beqz $s5, L12
	beqz $s3, L3
	beqz $s4, L3
	li $s2, 1
	b L4
L3:
	li $s2, 0
L4:
	nop
	beqz $s2, L8
	xori $s2, $s3, 1
	beqz $s2, L5
	beqz $s4, L6
L5:
	li $s2, 1
	b L7
L6:
	li $s2, 0
L7:
	nop
	beqz $s2, L8
	li $s2, 1
	b L9
L8:
	li $s2, 0
L9:
	nop
	beqz $s2, L10
	beqz $s3, L10
	li $s2, 1
	b L11
L10:
	li $s2, 0
L11:
	nop
	beqz $s2, L13
L12:
	li $s2, 1
	b L14
L13:
	li $s2, 0
L14:
	nop
	xori $s5, $s2, 1
	beqz $s5, L15
	beqz $s4, L16
L15:
	li $s2, 1
	b L17
L16:
	li $s2, 0
L17:
	nop
	move $s5, $s2
	xori $s2, $s5, 1
	beqz $s2, L18
	b L21
L18:
	nop
	beqz $s5, L19
	beqz $s3, L19
	li $s2, 1
	b L20
L19:
	li $s2, 0
L20:
	nop
	move $s5, $s2
	b L25
L21:
	nop
	xori $s2, $s4, 1
	beqz $s2, L22
	beqz $s3, L23
L22:
	li $s2, 1
	b L24
L23:
	li $s2, 0
L24:
	nop
	move $s5, $s2
L25:
	nop
	move $v0, $s5
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s5, -32($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	addu $sp, $sp, 32
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl t061_run
t061_run:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 32
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	move $s0, $a0
	move $s1, $a1
	li $s2, 2
	move $s3, $s2
	lw $s2, 0($s1)
	lw $s4, 4($s2)
	move $a0, $s1
	jalr $s4
	move $s2, $v0
	beqz $s2, L26
	move $s2, $s0
	lw $s0, 0($s2)
	lw $s4, 4($s0)
	move $a0, $s2
	jalr $s4
	move $s0, $v0
	move $s2, $s0
	b L27
L26:
	nop
	lw $s0, 0($s1)
	lw $s4, 4($s0)
	move $a0, $s1
	jalr $s4
	move $s0, $v0
	move $s2, $s0
L27:
	nop
	beqz $s2, L28
	li $s0, 4
	move $s3, $s0
L28:
	nop
	move $v0, $s3
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	addu $sp, $sp, 32
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
