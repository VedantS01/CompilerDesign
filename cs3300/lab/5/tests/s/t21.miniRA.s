	.text
	.globl main
main:
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 24
	li $s0, 4
	move $a0, $s0
	jal _halloc
	move $s1, $v0
	li $s0, 4
	move $a0, $s0
	jal _halloc
	move $s2, $v0
	la $s0, Create_Start
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
	.globl Create_Start
Create_Start:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 24
	sw $s3, -24($fp)
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	move $s0, $a0
	li $s1, 5
	move $s2, $s1
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	li $s1, 1
	add $s3, $s2, $s1
	move $s2, $s3
	move $v0, $s2
	lw $s3, -24($fp)
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
