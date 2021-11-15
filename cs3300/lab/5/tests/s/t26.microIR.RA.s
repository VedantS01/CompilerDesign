	.text
	.globl main
main:
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 4
	la $s0, Test
	jalr $s0
	move $s0, $v0
	move $a0, $s0
	jal _print
	addu $sp, $sp, 4
	lw $ra, -4($sp)
	jal _exitret
	.text
	.globl Test
Test:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 64
	sw $s0, -40($fp)
	sw $s1, -44($fp)
	sw $s2, -48($fp)
	sw $s3, -52($fp)
	sw $s4, -56($fp)
	sw $s5, -60($fp)
	sw $s6, -64($fp)
	sw $s7, -68($fp)
	li $s0, 0
	li $s1, 0
	li $s2, 0
	li $s3, 0
	li $s4, 0
	li $s5, 0
	li $s6, 0
	li $s7, 0
	li $t0, 0
	li $t1, 0
	li $t2, 0
	li $t3, 0
	li $t4, 0
	li $t5, 0
	li $t6, 0
	li $t7, 0
	li $v1, 0
	sw $v1, -36($fp)
	li $v1, 0
	sw $v1, -32($fp)
	li $v1, 0
	sw $v1, -12($fp)
	li $v1, 0
	sw $v1, -16($fp)
	li $v1, 0
	sw $v1, -20($fp)
	li $v1, 0
	sw $v1, -24($fp)
	li $v1, 0
	sw $v1, -28($fp)
	li $t9, 1
	lw $v1, -28($fp)
	move $a0, $v1
	jal _print
	li $t8, 2
	move $a0, $t9
	jal _print
	li $v1, 3
	sw $v1, -28($fp)
	move $a0, $t8
	jal _print
	lw $v1, -28($fp)
	move $a0, $v1
	jal _print
	move $a0, $s0
	jal _print
	move $a0, $s1
	jal _print
	move $a0, $s2
	jal _print
	move $a0, $s3
	jal _print
	move $a0, $s4
	jal _print
	move $a0, $s5
	jal _print
	move $a0, $s6
	jal _print
	move $a0, $s7
	jal _print
	move $a0, $t0
	jal _print
	move $a0, $t1
	jal _print
	move $a0, $t2
	jal _print
	move $a0, $t3
	jal _print
	move $a0, $t4
	jal _print
	move $a0, $t5
	jal _print
	move $a0, $t6
	jal _print
	move $a0, $t7
	jal _print
	lw $v1, -36($fp)
	move $a0, $v1
	jal _print
	lw $v1, -32($fp)
	move $a0, $v1
	jal _print
	lw $v1, -12($fp)
	move $a0, $v1
	jal _print
	lw $v1, -16($fp)
	move $a0, $v1
	jal _print
	lw $v1, -20($fp)
	move $a0, $v1
	jal _print
	lw $v1, -24($fp)
	move $a0, $v1
	jal _print
	lw $v1, -28($fp)
	move $a0, $v1
	jal _print
	li $v0, 1
	lw $s0, -40($fp)
	lw $s1, -44($fp)
	lw $s2, -48($fp)
	lw $s3, -52($fp)
	lw $s4, -56($fp)
	lw $s5, -60($fp)
	lw $s6, -64($fp)
	lw $s7, -68($fp)
	addu $sp, $sp, 64
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
