	.text
	.globl main
main:
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 8
	li $s0, 16
	move $a0, $s0
	jal _halloc
	move $s0, $v0
	li $s1, 12
	move $a0, $s1
	jal _halloc
	move $s1, $v0
	la $s2, A_one
	sw $s2, 8($s1)
	la $s2, A_run
	sw $s2, 0($s1)
	la $s2, A_set
	sw $s2, 4($s1)
	sw $s1, 0($s0)
	lw $s1, 0($s0)
	lw $s1, 8($s1)
	move $a0, $s0
	jalr $s1
	move $s1, $v0
	move $a0, $s1
	jal _print
	addu $sp, $sp, 8
	lw $ra, -4($sp)
	jal _exitret
	.text
	.globl A_run
A_run:
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
	move $s2, $a0
	li $s3, 0
	sle $s4, $s1, $s0
	beqz $s4, L1
	move $s3, $s1
	b L0
L1:
	nop
	move $s3, $s0
L0:
	nop
	li $s0, 1
	beqz $s0, L7
	li $s0, 1
	beqz $s0, L7
	li $s0, 1
	b L8
L7:
	li $s0, 0
L8:
	nop
	xori $s0, $s0, 1
	beqz $s0, L4
	li $s0, 1
	beqz $s0, L9
	li $s0, 0
	beqz $s0, L9
	li $s0, 1
	b L10
L9:
	li $s0, 0
L10:
	nop
	beqz $s0, L5
L4:
	li $s0, 1
	b L6
L5:
	li $s0, 0
L6:
	nop
	beqz $s0, L2
	li $s0, 0
	beqz $s0, L2
	li $s0, 1
	b L3
L2:
	li $s0, 0
L3:
	nop
	sw $s0, 8($s2)
	li $s0, 1
	li $s0, 1
	b L12
L13:
	nop
	li $s0, 1
	li $s0, 0
	b L11
L12:
	nop
	li $s0, 0
	b L11
	lw $s0, 8($s2)
	sw $s0, 12($s2)
L11:
	nop
	move $v0, $s3
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
	.globl A_one
A_one:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 12
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	move $s0, $a0
	li $s1, 1
	sw $s1, 8($s0)
	li $s1, 1
	sw $s1, 12($s0)
	lw $s1, 8($s0)
	beqz $s1, L14
	lw $s1, 12($s0)
	beqz $s1, L14
	li $s1, 999
	move $a0, $s1
	jal _print
L14:
	nop
	lw $s1, 8($s0)
	xori $s1, $s1, 1
	beqz $s1, L16
	lw $s1, 12($s0)
	li $s1, 888
	move $a0, $s1
	jal _print
	b L15
L16:
	nop
	li $s1, 333
	move $a0, $s1
	jal _print
L15:
	nop
	lw $s1, 8($s0)
	beqz $s1, L18
	lw $s1, 12($s0)
	beqz $s1, L18
	lw $s1, 12($s0)
	xori $s1, $s1, 1
	beqz $s1, L19
	lw $s1, 8($s0)
	beqz $s1, L17
L19:
	nop
L18:
	nop
	li $s1, 1
	sw $s1, 4($s0)
L17:
	nop
	lw $s1, 8($s0)
	beqz $s1, L20
	lw $s1, 8($s0)
	beqz $s1, L20
	lw $s1, 12($s0)
	beqz $s1, L20
	li $s1, 1
	sw $s1, 4($s0)
L20:
	nop
	lw $s0, 4($s0)
	li $s1, 11
	add $s1, $s0, $s1
	move $v0, $s1
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	addu $sp, $sp, 12
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl A_set
A_set:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 12
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	move $s0, $a1
	move $s1, $a0
	sw $s0, 4($s1)
	li $s1, 0
	move $v0, $s1
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
