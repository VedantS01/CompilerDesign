	.text
	.globl main
main:
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 32
	li $s0, 8
	move $a0, $s0
	jal _halloc
	move $s0, $v0
	li $s1, 4
	move $a0, $s1
	jal _halloc
	move $s1, $v0
	la $s2, MT4_Change
	sw $s2, 4($s0)
	la $s2, MT4_Start
	sw $s2, 0($s0)
	sw $s0, 0($s1)
	lw $s0, 0($s1)
	lw $s0, 0($s0)
	li $s2, 1
	li $s3, 2
	li $s4, 3
	li $s5, 4
	li $s6, 5
	li $s7, 6
	move $a0, $s1
	move $a1, $s2
	move $a2, $s3
	move $a3, $s4
	sw $s5, 0($sp)
	sw $s6, 4($sp)
	sw $s7, 8($sp)
	jalr $s0
	move $s7, $v0
	move $a0, $s7
	jal _print
	addu $sp, $sp, 32
	lw $ra, -4($sp)
	jal _exitret
	.text
	.globl MT4_Start
MT4_Start:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 52
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	move $s0, $a3
	move $s1, $a2
	move $s2, $a1
	move $s3, $a0
	move $a0, $s2
	jal _print
	move $a0, $s1
	jal _print
	move $a0, $s0
	jal _print
	lw $v1, 0($fp)
	move $a0, $v1
	jal _print
	lw $v1, 4($fp)
	move $a0, $v1
	jal _print
	lw $v1, 8($fp)
	move $a0, $v1
	jal _print
	lw $s4, 0($s3)
	lw $s4, 4($s4)
	move $a0, $s3
	lw $v1, 8($fp)
	move $a1, $v1
	lw $v1, 4($fp)
	move $a2, $v1
	lw $v1, 0($fp)
	move $a3, $v1
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $s2, 8($sp)
	jalr $s4
	move $s4, $v0
	move $v0, $s4
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	addu $sp, $sp, 52
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl MT4_Change
MT4_Change:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 16
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	move $s0, $a3
	move $s1, $a2
	move $s2, $a1
	move $a0, $s2
	jal _print
	move $a0, $s1
	jal _print
	move $a0, $s0
	jal _print
	lw $v1, 0($fp)
	move $a0, $v1
	jal _print
	lw $v1, 4($fp)
	move $a0, $v1
	jal _print
	lw $v1, 8($fp)
	move $a0, $v1
	jal _print
	lw $v1, 8($fp)
	lw $v0, 0($fp)
	add $v0, $v0, $v1
	sw $v0, 4($fp)
	lw $v1, 0($fp)
	move $a0, $v1
	jal _print
	lw $v1, 0($fp)
	move $s0, $v1
	move $v0, $s0
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	addu $sp, $sp, 16
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
