	.text
	.globl main
main:
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 12
	jal Test35
	move $s0, $v0
	move $a0, $s0
	jal _print
	addu $sp, $sp, 12
	lw $ra, -4($sp)
	jal _exitret
	.text
	.globl Test35
Test35:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 108
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	sw $s5, -32($fp)
	sw $s6, -36($fp)
	sw $s7, -40($fp)
	li $v0, 0
	sw $v0, -44($fp)
	li $v0, 1
	sw $v0, -48($fp)
	li $v0, 2
	sw $v0, -52($fp)
	li $v0, 3
	sw $v0, -56($fp)
	li $v0, 4
	sw $v0, -60($fp)
	li $v0, 5
	sw $v0, -64($fp)
	li $v0, 6
	sw $v0, -68($fp)
	li $v0, 7
	sw $v0, -72($fp)
	li $v0, 8
	sw $v0, -76($fp)
	li $v0, 9
	sw $v0, -80($fp)
	li $v0, 10
	sw $v0, -84($fp)
	li $v0, 11
	sw $v0, -88($fp)
	li $v0, 12
	sw $v0, -92($fp)
	li $v0, 13
	sw $v0, -96($fp)
	li $v0, 14
	sw $v0, -100($fp)
	li $v0, 15
	sw $v0, -104($fp)
	li $t8, 16
	li $t9, 17
	li $s0, 18
	li $s1, 19
	li $s2, 20
	li $s3, 21
	li $s4, 22
	li $s5, 23
	li $s6, 24
	li $s7, 25
	li $t0, 26
	li $t1, 27
	li $t2, 28
	li $t3, 29
	li $t4, 30
	li $t5, 31
	li $t6, 32
	li $t7, 33
	move $a0, $t7
	jal _print
	move $a0, $t6
	jal _print
	move $a0, $t5
	jal _print
	move $a0, $t4
	jal _print
	move $a0, $t3
	jal _print
	move $a0, $t2
	jal _print
	move $a0, $t1
	jal _print
	move $a0, $t0
	jal _print
	move $a0, $s7
	jal _print
	move $a0, $s6
	jal _print
	move $a0, $s5
	jal _print
	move $a0, $s4
	jal _print
	move $a0, $s3
	jal _print
	move $a0, $s2
	jal _print
	move $a0, $s1
	jal _print
	move $a0, $s0
	jal _print
	move $a0, $t9
	jal _print
	move $a0, $t8
	jal _print
	lw $v0, -104($fp)
	move $a0, $v0
	jal _print
	lw $v0, -100($fp)
	move $a0, $v0
	jal _print
	lw $v0, -96($fp)
	move $a0, $v0
	jal _print
	lw $v0, -92($fp)
	move $a0, $v0
	jal _print
	lw $v0, -88($fp)
	move $a0, $v0
	jal _print
	lw $v0, -84($fp)
	move $a0, $v0
	jal _print
	lw $v0, -80($fp)
	move $a0, $v0
	jal _print
	lw $v0, -76($fp)
	move $a0, $v0
	jal _print
	lw $v0, -72($fp)
	move $a0, $v0
	jal _print
	lw $v0, -68($fp)
	move $a0, $v0
	jal _print
	lw $v0, -64($fp)
	move $a0, $v0
	jal _print
	lw $v0, -60($fp)
	move $a0, $v0
	jal _print
	lw $v0, -56($fp)
	move $a0, $v0
	jal _print
	lw $v0, -52($fp)
	move $a0, $v0
	jal _print
	lw $v0, -48($fp)
	move $a0, $v0
	jal _print
	lw $v0, -44($fp)
	move $a0, $v0
	jal _print
	lw $v0, -44($fp)
	move $v0, $v0
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s5, -32($fp)
	lw $s6, -36($fp)
	lw $s7, -40($fp)
	addu $sp, $sp, 108
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
