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
	subu $sp, $sp, 52
	sw $s0, -28($fp)
	sw $s1, -32($fp)
	sw $s2, -36($fp)
	sw $s3, -40($fp)
	sw $s4, -44($fp)
	sw $s5, -48($fp)
	sw $s6, -52($fp)
	sw $s7, -56($fp)
	move $s0, $a3
	move $s1, $a2
	move $s2, $a1
	move $a0, $s2
	jal _print
	move $a0, $s1
	jal _print
	move $a0, $s0
	jal _print
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
	li $t8, 0
	li $v1, 0
	sw $v1, -24($fp)
	li $v1, 0
	sw $v1, -12($fp)
	li $v1, 0
	sw $v1, -16($fp)
	lw $v1, 0($fp)
	move $a0, $v1
	jal _print
	lw $v1, 4($fp)
	move $a0, $v1
	jal _print
	lw $v1, 8($fp)
	move $a0, $v1
	jal _print
	b L2
L1:
	nop
	lw $v1, -16($fp)
	lw $v0, -20($fp)
	add $v0, $v0, $v1
	sw $v0, 0($fp)
	lw $v1, 8($fp)
	lw $v0, 0($fp)
	add $v0, $v0, $v1
	sw $v0, 4($fp)
	b L3
L2:
	li $v1, 12
	sw $v1, -20($fp)
	b L1
L3:
	nop
	lw $v1, 0($fp)
	move $a0, $v1
	jal _print
	lw $v1, 0($fp)
	move $t9, $v1
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
	move $a0, $t8
	jal _print
	lw $v1, -24($fp)
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
	move $v0, $t9
	lw $s0, -28($fp)
	lw $s1, -32($fp)
	lw $s2, -36($fp)
	lw $s3, -40($fp)
	lw $s4, -44($fp)
	lw $s5, -48($fp)
	lw $s6, -52($fp)
	lw $s7, -56($fp)
	addu $sp, $sp, 52
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
