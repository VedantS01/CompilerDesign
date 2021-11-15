	.text
	.globl main
main:
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 68
	li $s0, 8
	move $a0, $s0
	jal _halloc
	move $s1, $v0
	move $s0, $s1
	li $s1, 4
	move $a0, $s1
	jal _halloc
	move $s2, $v0
	move $s1, $s2
	la $s2, MT4_Change
	sw $s2, 4($s0)
	la $s2, MT4_Start
	sw $s2, 0($s0)
	sw $s0, 0($s1)
	move $s0, $s1
	lw $s1, 0($s0)
	lw $s2, 0($s1)
	li $s1, 1
	li $s3, 2
	li $s4, 3
	li $s5, 4
	li $s6, 5
	li $s7, 6
	sw $t0, -44($fp)
	move $a0, $s0
	move $a1, $s1
	move $a2, $s3
	move $a3, $s4
	sw $s5, 0($sp)
	sw $s6, 4($sp)
	sw $s7, 8($sp)
	jalr $s2
	lw $t0, -44($fp)
	move $t0, $v0
	move $a0, $t0
	jal _print
	addu $sp, $sp, 68
	lw $ra, -4($sp)
	jal _exitret
	.text
	.globl MT4_Start
MT4_Start:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 72
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	sw $s5, -32($fp)
	sw $s6, -36($fp)
	sw $s7, -40($fp)
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	move $s0, $a0
	move $s1, $a1
	move $s2, $a2
	move $s3, $a3
	lw $s4, 0($fp)
	lw $s5, 4($fp)
	lw $s6, 8($fp)
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
	move $s7, $s0
	lw $s0, 0($s7)
	lw $t0, 4($s0)
	move $a0, $s7
	move $a1, $s6
	move $a2, $s5
	move $a3, $s4
	sw $s3, 0($sp)
	sw $s2, 4($sp)
	sw $s1, 8($sp)
	jalr $t0
	move $s0, $v0
	move $s1, $s0
	move $v0, $s1
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s5, -32($fp)
	lw $s6, -36($fp)
	lw $s7, -40($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	addu $sp, $sp, 72
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl MT4_Change
MT4_Change:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 36
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	sw $s5, -32($fp)
	sw $s6, -36($fp)
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	move $s0, $a0
	move $s1, $a1
	move $s2, $a2
	move $s3, $a3
	lw $s4, 0($fp)
	lw $s5, 4($fp)
	lw $s6, 8($fp)
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
	move $a0, $s4
	jal _print
	move $s1, $s4
	move $s2, $s1
	move $v0, $s2
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s5, -32($fp)
	lw $s6, -36($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	addu $sp, $sp, 36
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
