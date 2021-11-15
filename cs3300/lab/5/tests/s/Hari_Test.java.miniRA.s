	.text
	.globl main
main:
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 24
	li $s0, 36
	move $a0, $s0
	jal _halloc
	move $s1, $v0
	li $s0, 4
	move $a0, $s0
	jal _halloc
	move $s2, $v0
	la $s0, E_prnt
	sw $s0, 0($s2)
	sw $s2, 0($s1)
	lw $s0, 0($s1)
	lw $s2, 0($s0)
	move $a0, $s1
	jalr $s2
	move $s0, $v0
	move $a0, $s0
	jal _print
	addu $sp, $sp, 24
	lw $ra, -4($sp)
	jal _exitret
	.text
	.globl E_prnt
E_prnt:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 28
	sw $s3, -24($fp)
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	move $s0, $a0
	li $s1, 12
	move $a0, $s1
	jal _halloc
	move $s2, $v0
	li $s1, 12
	move $a0, $s1
	jal _halloc
	move $s3, $v0
	la $s1, A_fna
	sw $s1, 0($s3)
	la $s1, A_fnc
	sw $s1, 8($s3)
	la $s1, A_fnb
	sw $s1, 4($s3)
	sw $s3, 0($s2)
	sw $s2, 16($s0)
	lw $s1, 16($s0)
	lw $s2, 0($s1)
	lw $s3, 0($s2)
	move $a0, $s1
	jalr $s3
	move $s2, $v0
	sw $s2, 12($s0)
	li $s1, 12
	move $a0, $s1
	jal _halloc
	move $s2, $v0
	li $s1, 12
	move $a0, $s1
	jal _halloc
	move $s3, $v0
	la $s1, B_fnb
	sw $s1, 4($s3)
	la $s1, A_fna
	sw $s1, 0($s3)
	la $s1, A_fnc
	sw $s1, 8($s3)
	sw $s3, 0($s2)
	sw $s2, 8($s0)
	lw $s1, 8($s0)
	lw $s2, 0($s1)
	lw $s3, 0($s2)
	move $a0, $s1
	jalr $s3
	move $s2, $v0
	sw $s2, 20($s0)
	li $s1, 16
	move $a0, $s1
	jal _halloc
	move $s2, $v0
	li $s1, 20
	move $a0, $s1
	jal _halloc
	move $s3, $v0
	la $s1, B_fnb
	sw $s1, 4($s3)
	la $s1, A_fna
	sw $s1, 0($s3)
	la $s1, A_fnc
	sw $s1, 8($s3)
	la $s1, D_fnc
	sw $s1, 12($s3)
	la $s1, D_fnd
	sw $s1, 16($s3)
	sw $s3, 0($s2)
	sw $s2, 4($s0)
	lw $s1, 4($s0)
	lw $s2, 0($s1)
	lw $s3, 0($s2)
	move $a0, $s1
	jalr $s3
	move $s2, $v0
	sw $s2, 24($s0)
	li $s0, 1
	move $v0, $s0
	lw $s3, -24($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	addu $sp, $sp, 28
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl A_fna
A_fna:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 28
	sw $s3, -24($fp)
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	move $s0, $a0
	li $s1, 2
	move $a0, $s1
	jal _print
	move $s1, $s0
	lw $s2, 0($s1)
	lw $s3, 4($s2)
	move $a0, $s1
	jalr $s3
	move $s2, $v0
	sw $s2, 4($s0)
	move $s1, $s0
	lw $s2, 0($s1)
	lw $s3, 8($s2)
	move $a0, $s1
	jalr $s3
	move $s2, $v0
	sw $s2, 8($s0)
	li $s0, 1
	move $v0, $s0
	lw $s3, -24($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	addu $sp, $sp, 28
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl A_fnc
A_fnc:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 28
	sw $s3, -24($fp)
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	move $s0, $a0
	li $s1, 2999
	move $a0, $s1
	jal _print
	move $s1, $s0
	lw $s2, 0($s1)
	lw $s3, 4($s2)
	move $a0, $s1
	jalr $s3
	move $s2, $v0
	sw $s2, 4($s0)
	li $s0, 1
	move $v0, $s0
	lw $s3, -24($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	addu $sp, $sp, 28
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl A_fnb
A_fnb:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 16
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	move $s0, $a0
	li $s1, 666
	move $a0, $s1
	jal _print
	li $s1, 2
	move $v0, $s1
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	addu $sp, $sp, 16
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl B_fnb
B_fnb:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 16
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	move $s0, $a0
	li $s1, 888
	move $a0, $s1
	jal _print
	li $s1, 3
	move $v0, $s1
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	addu $sp, $sp, 16
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl D_fnc
D_fnc:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 28
	sw $s3, -24($fp)
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	move $s0, $a0
	li $s1, 3434
	move $a0, $s1
	jal _print
	move $s1, $s0
	lw $s2, 0($s1)
	lw $s3, 4($s2)
	move $a0, $s1
	jalr $s3
	move $s2, $v0
	sw $s2, 12($s0)
	li $s0, 4
	move $v0, $s0
	lw $s3, -24($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	addu $sp, $sp, 28
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl D_fnd
D_fnd:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 24
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	move $s0, $a0
	move $s1, $s0
	lw $s0, 0($s1)
	lw $s2, 12($s0)
	move $a0, $s1
	jalr $s2
	move $s0, $v0
	move $v0, $s0
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	addu $sp, $sp, 24
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
