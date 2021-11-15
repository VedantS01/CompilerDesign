	.text
	.globl main
main:
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 4
	jal Test35
	move $s0, $v0
	move $a0, $s0
	jal _print
	addu $sp, $sp, 4
	lw $ra, -4($sp)
	jal _exitret
	.text
	.globl Test35
Test35:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 104
	sw $s0, -80($fp)
	sw $s1, -84($fp)
	sw $s2, -88($fp)
	sw $s3, -92($fp)
	sw $s4, -96($fp)
	sw $s5, -100($fp)
	sw $s6, -104($fp)
	sw $s7, -108($fp)
	li $v1, 0
	sw $v1, -12($fp)
	li $v1, 1
	sw $v1, -16($fp)
	li $v1, 2
	sw $v1, -20($fp)
	li $v1, 3
	sw $v1, -24($fp)
	li $v1, 4
	sw $v1, -28($fp)
	li $v1, 5
	sw $v1, -32($fp)
	li $v1, 6
	sw $v1, -36($fp)
	li $v1, 7
	sw $v1, -40($fp)
	li $v1, 8
	sw $v1, -44($fp)
	li $v1, 9
	sw $v1, -48($fp)
	li $v1, 10
	sw $v1, -52($fp)
	li $v1, 11
	sw $v1, -56($fp)
	li $v1, 12
	sw $v1, -60($fp)
	li $v1, 13
	sw $v1, -64($fp)
	li $t6, 14
	li $t7, 15
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
	li $v1, 32
	sw $v1, -68($fp)
	li $v1, 33
	sw $v1, -72($fp)
	lw $v1, -68($fp)
	lw $v0, -72($fp)
	add $v0, $v0, $v1
	sw $v0, -76($fp)
	lw $v1, -76($fp)
	move $a0, $v1
	jal _print
	lw $v1, -72($fp)
	move $a0, $v1
	jal _print
	lw $v1, -68($fp)
	move $a0, $v1
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
	move $a0, $t7
	jal _print
	move $a0, $t6
	jal _print
	lw $v1, -64($fp)
	move $a0, $v1
	jal _print
	lw $v1, -60($fp)
	move $a0, $v1
	jal _print
	lw $v1, -56($fp)
	move $a0, $v1
	jal _print
	lw $v1, -52($fp)
	move $a0, $v1
	jal _print
	lw $v1, -48($fp)
	move $a0, $v1
	jal _print
	lw $v1, -44($fp)
	move $a0, $v1
	jal _print
	lw $v1, -40($fp)
	move $a0, $v1
	jal _print
	lw $v1, -36($fp)
	move $a0, $v1
	jal _print
	lw $v1, -32($fp)
	move $a0, $v1
	jal _print
	lw $v1, -28($fp)
	move $a0, $v1
	jal _print
	lw $v1, -24($fp)
	move $a0, $v1
	jal _print
	lw $v1, -20($fp)
	move $a0, $v1
	jal _print
	lw $v1, -16($fp)
	move $a0, $v1
	jal _print
	lw $v1, -12($fp)
	move $a0, $v1
	jal _print
	lw $v1, -68($fp)
	move $a0, $v1
	jal _print
	lw $v1, -72($fp)
	move $a0, $v1
	jal _print
	lw $v1, -76($fp)
	move $a0, $v1
	jal _print
	lw $v1, -12($fp)
	move $v0, $v1
	lw $s0, -80($fp)
	lw $s1, -84($fp)
	lw $s2, -88($fp)
	lw $s3, -92($fp)
	lw $s4, -96($fp)
	lw $s5, -100($fp)
	lw $s6, -104($fp)
	lw $s7, -108($fp)
	addu $sp, $sp, 104
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
