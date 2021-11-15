	.text
	.globl main
main:
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 12
	li $s0, 32
	move $a0, $s0
	jal _halloc
	move $s0, $v0
	li $s1, 12
	move $a0, $s1
	jal _halloc
	move $s1, $v0
	la $s2, C23_setI1
	sw $s2, 4($s1)
	la $s2, C23_getI1
	sw $s2, 0($s1)
	la $s2, C23_init
	sw $s2, 8($s1)
	sw $s1, 0($s0)
	lw $s1, 0($s0)
	lw $s1, 8($s1)
	li $s2, 24
	move $a0, $s2
	jal _halloc
	move $s2, $v0
	li $s3, 12
	move $a0, $s3
	jal _halloc
	move $s3, $v0
	la $s4, B23_setI1
	sw $s4, 4($s3)
	la $s4, B23_init
	sw $s4, 8($s3)
	la $s4, B23_getI1
	sw $s4, 0($s3)
	sw $s3, 0($s2)
	move $a0, $s0
	move $a1, $s2
	jalr $s1
	move $s2, $v0
	move $a0, $s2
	jal _print
	addu $sp, $sp, 12
	lw $ra, -4($sp)
	jal _exitret
	.text
	.globl A23_init
A23_init:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 32
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	move $s0, $a1
	move $s1, $a0
	lw $s2, 0($s0)
	lw $s2, 0($s2)
	move $a0, $s0
	jalr $s2
	move $s2, $v0
	sw $s2, 8($s1)
	li $s2, 222
	sw $s2, 12($s1)
	move $s2, $s1
	lw $s0, 0($s2)
	lw $s0, 4($s0)
	lw $s3, 8($s1)
	lw $s4, 12($s1)
	add $s4, $s3, $s4
	move $a0, $s2
	move $a1, $s4
	jalr $s0
	move $s4, $v0
	sw $s4, 4($s1)
	lw $s1, 4($s1)
	move $v0, $s1
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	addu $sp, $sp, 32
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl A23_getI1
A23_getI1:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 8
	sw $s0, -12($fp)
	move $s0, $a0
	lw $s0, 4($s0)
	move $v0, $s0
	lw $s0, -12($fp)
	addu $sp, $sp, 8
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl A23_setI1
A23_setI1:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 8
	sw $s0, -12($fp)
	move $s0, $a1
	move $v0, $s0
	lw $s0, -12($fp)
	addu $sp, $sp, 8
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl B23_init
B23_init:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 32
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	move $s0, $a1
	move $s1, $a0
	li $s2, 16
	move $a0, $s2
	jal _halloc
	move $s2, $v0
	li $s3, 12
	move $a0, $s3
	jal _halloc
	move $s3, $v0
	la $s4, A23_setI1
	sw $s4, 4($s3)
	la $s4, A23_init
	sw $s4, 8($s3)
	la $s4, A23_getI1
	sw $s4, 0($s3)
	sw $s3, 0($s2)
	lw $s3, 0($s0)
	lw $s3, 0($s3)
	move $a0, $s0
	jalr $s3
	move $s3, $v0
	sw $s3, 20($s1)
	move $s3, $s1
	lw $s0, 0($s3)
	lw $s0, 4($s0)
	lw $s4, 20($s1)
	move $a0, $s3
	move $a1, $s4
	jalr $s0
	move $s4, $v0
	sw $s4, 16($s1)
	lw $s4, 0($s2)
	lw $s4, 8($s4)
	move $a0, $s2
	move $a1, $s1
	jalr $s4
	move $s1, $v0
	move $v0, $s1
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	addu $sp, $sp, 32
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl B23_getI1
B23_getI1:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 8
	sw $s0, -12($fp)
	move $s0, $a0
	lw $s0, 16($s0)
	move $v0, $s0
	lw $s0, -12($fp)
	addu $sp, $sp, 8
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl B23_setI1
B23_setI1:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 12
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	move $s0, $a1
	li $s1, 111
	add $s1, $s0, $s1
	move $v0, $s1
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	addu $sp, $sp, 12
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl C23_init
C23_init:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 32
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	move $s0, $a1
	move $s1, $a0
	li $s2, 333
	sw $s2, 28($s1)
	move $s2, $s1
	lw $s3, 0($s2)
	lw $s3, 4($s3)
	lw $s4, 28($s1)
	move $a0, $s2
	move $a1, $s4
	jalr $s3
	move $s4, $v0
	sw $s4, 24($s1)
	lw $s4, 0($s0)
	lw $s4, 8($s4)
	move $a0, $s0
	move $a1, $s1
	jalr $s4
	move $s1, $v0
	move $v0, $s1
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	addu $sp, $sp, 32
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl C23_getI1
C23_getI1:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 8
	sw $s0, -12($fp)
	move $s0, $a0
	lw $s0, 24($s0)
	move $v0, $s0
	lw $s0, -12($fp)
	addu $sp, $sp, 8
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl C23_setI1
C23_setI1:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 12
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	move $s0, $a1
	li $s1, 2
	mul $s1, $s0, $s1
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
