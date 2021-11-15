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
	la $s0, TV_Start
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
	.globl TV_Start
TV_Start:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 44
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	sw $s5, -32($fp)
	sw $s6, -36($fp)
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	move $s0, $a0
	li $s3, 28
	move $a0, $s3
	jal _halloc
	move $s4, $v0
	li $s3, 84
	move $a0, $s3
	jal _halloc
	move $s5, $v0
	la $s3, Tree_SetHas_Left
	sw $s3, 0($s5)
	la $s3, Tree_RemoveRight
	sw $s3, 52($s5)
	la $s3, Tree_GetHas_Right
	sw $s3, 60($s5)
	la $s3, Tree_Print
	sw $s3, 68($s5)
	la $s3, Tree_SetLeft
	sw $s3, 36($s5)
	la $s3, Tree_GetRight
	sw $s3, 44($s5)
	la $s3, Tree_Search
	sw $s3, 24($s5)
	la $s3, Tree_GetKey
	sw $s3, 4($s5)
	la $s3, Tree_RecPrint
	sw $s3, 16($s5)
	la $s3, Tree_SetKey
	sw $s3, 40($s5)
	la $s3, Tree_Remove
	sw $s3, 56($s5)
	la $s3, Tree_Delete
	sw $s3, 72($s5)
	la $s3, Tree_Init
	sw $s3, 28($s5)
	la $s3, Tree_Insert
	sw $s3, 80($s5)
	la $s3, Tree_GetLeft
	sw $s3, 12($s5)
	la $s3, Tree_SetHas_Right
	sw $s3, 32($s5)
	la $s3, Tree_accept
	sw $s3, 8($s5)
	la $s3, Tree_SetRight
	sw $s3, 20($s5)
	la $s3, Tree_Compare
	sw $s3, 76($s5)
	la $s3, Tree_GetHas_Left
	sw $s3, 48($s5)
	la $s3, Tree_RemoveLeft
	sw $s3, 64($s5)
	sw $s5, 0($s4)
	move $s3, $s4
	lw $s4, 0($s3)
	lw $s5, 28($s4)
	li $s4, 16
	move $a0, $s3
	move $a1, $s4
	jalr $s5
	move $s6, $v0
	lw $s4, 0($s3)
	lw $s5, 68($s4)
	move $a0, $s3
	jalr $s5
	move $s4, $v0
	li $s4, 100000000
	move $a0, $s4
	jal _print
	lw $s4, 0($s3)
	lw $s5, 80($s4)
	li $s4, 8
	move $a0, $s3
	move $a1, $s4
	jalr $s5
	move $s6, $v0
	lw $s4, 0($s3)
	lw $s5, 80($s4)
	li $s4, 24
	move $a0, $s3
	move $a1, $s4
	jalr $s5
	move $s6, $v0
	lw $s4, 0($s3)
	lw $s5, 80($s4)
	li $s4, 4
	move $a0, $s3
	move $a1, $s4
	jalr $s5
	move $s6, $v0
	lw $s4, 0($s3)
	lw $s5, 80($s4)
	li $s4, 12
	move $a0, $s3
	move $a1, $s4
	jalr $s5
	move $s6, $v0
	lw $s4, 0($s3)
	lw $s5, 80($s4)
	li $s4, 20
	move $a0, $s3
	move $a1, $s4
	jalr $s5
	move $s6, $v0
	lw $s4, 0($s3)
	lw $s5, 80($s4)
	li $s4, 28
	move $a0, $s3
	move $a1, $s4
	jalr $s5
	move $s6, $v0
	lw $s4, 0($s3)
	lw $s5, 80($s4)
	li $s4, 14
	move $a0, $s3
	move $a1, $s4
	jalr $s5
	move $s6, $v0
	lw $s4, 0($s3)
	lw $s5, 68($s4)
	move $a0, $s3
	jalr $s5
	move $s4, $v0
	li $s4, 100000000
	move $a0, $s4
	jal _print
	li $s4, 12
	move $a0, $s4
	jal _halloc
	move $s5, $v0
	li $s4, 4
	move $a0, $s4
	jal _halloc
	move $s6, $v0
	la $s4, MyVisitor_visit
	sw $s4, 0($s6)
	sw $s6, 0($s5)
	move $s4, $s5
	li $s5, 50000000
	move $a0, $s5
	jal _print
	lw $s5, 0($s3)
	lw $s6, 8($s5)
	move $a0, $s3
	move $a1, $s4
	jalr $s6
	move $s5, $v0
	li $s4, 100000000
	move $a0, $s4
	jal _print
	lw $s4, 0($s3)
	lw $s5, 24($s4)
	li $s4, 24
	move $a0, $s3
	move $a1, $s4
	jalr $s5
	move $s6, $v0
	move $a0, $s6
	jal _print
	lw $s4, 0($s3)
	lw $s5, 24($s4)
	li $s4, 12
	move $a0, $s3
	move $a1, $s4
	jalr $s5
	move $s6, $v0
	move $a0, $s6
	jal _print
	lw $s4, 0($s3)
	lw $s5, 24($s4)
	li $s4, 16
	move $a0, $s3
	move $a1, $s4
	jalr $s5
	move $s6, $v0
	move $a0, $s6
	jal _print
	lw $s4, 0($s3)
	lw $s5, 24($s4)
	li $s4, 50
	move $a0, $s3
	move $a1, $s4
	jalr $s5
	move $s6, $v0
	move $a0, $s6
	jal _print
	lw $s4, 0($s3)
	lw $s5, 24($s4)
	li $s4, 12
	move $a0, $s3
	move $a1, $s4
	jalr $s5
	move $s6, $v0
	move $a0, $s6
	jal _print
	lw $s4, 0($s3)
	lw $s5, 72($s4)
	li $s4, 12
	move $a0, $s3
	move $a1, $s4
	jalr $s5
	move $s6, $v0
	lw $s4, 0($s3)
	lw $s5, 68($s4)
	move $a0, $s3
	jalr $s5
	move $s4, $v0
	lw $s4, 0($s3)
	lw $s5, 24($s4)
	li $s4, 12
	move $a0, $s3
	move $a1, $s4
	jalr $s5
	move $s6, $v0
	move $a0, $s6
	jal _print
	li $s3, 0
	move $v0, $s3
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s5, -32($fp)
	lw $s6, -36($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	addu $sp, $sp, 44
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Tree_Init
Tree_Init:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 16
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	move $s0, $a0
	move $s1, $a1
	sw $s1, 8($s0)
	li $s1, 0
	sw $s1, 20($s0)
	li $s1, 0
	sw $s1, 12($s0)
	li $s0, 1
	move $v0, $s0
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	addu $sp, $sp, 16
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Tree_SetRight
Tree_SetRight:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 16
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	move $s0, $a0
	move $s1, $a1
	sw $s1, 16($s0)
	li $s0, 1
	move $v0, $s0
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	addu $sp, $sp, 16
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Tree_SetLeft
Tree_SetLeft:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 16
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	move $s0, $a0
	move $s1, $a1
	sw $s1, 24($s0)
	li $s0, 1
	move $v0, $s0
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	addu $sp, $sp, 16
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Tree_GetRight
Tree_GetRight:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 16
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	move $s0, $a0
	lw $s1, 16($s0)
	move $v0, $s1
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	addu $sp, $sp, 16
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Tree_GetLeft
Tree_GetLeft:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 16
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	move $s0, $a0
	lw $s1, 24($s0)
	move $v0, $s1
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	addu $sp, $sp, 16
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Tree_GetKey
Tree_GetKey:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 16
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	move $s0, $a0
	lw $s1, 8($s0)
	move $v0, $s1
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	addu $sp, $sp, 16
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Tree_SetKey
Tree_SetKey:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 16
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	move $s0, $a0
	move $s1, $a1
	sw $s1, 8($s0)
	li $s0, 1
	move $v0, $s0
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	addu $sp, $sp, 16
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Tree_GetHas_Right
Tree_GetHas_Right:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 16
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	move $s0, $a0
	lw $s1, 12($s0)
	move $v0, $s1
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	addu $sp, $sp, 16
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Tree_GetHas_Left
Tree_GetHas_Left:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 16
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	move $s0, $a0
	lw $s1, 20($s0)
	move $v0, $s1
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	addu $sp, $sp, 16
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Tree_SetHas_Left
Tree_SetHas_Left:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 16
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	move $s0, $a0
	move $s1, $a1
	sw $s1, 20($s0)
	li $s0, 1
	move $v0, $s0
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	addu $sp, $sp, 16
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Tree_SetHas_Right
Tree_SetHas_Right:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 16
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	move $s0, $a0
	move $s1, $a1
	sw $s1, 12($s0)
	li $s0, 1
	move $v0, $s0
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	addu $sp, $sp, 16
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Tree_Compare
Tree_Compare:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 32
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	sw $s5, -32($fp)
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	move $s0, $a0
	move $s1, $a1
	move $s2, $a2
	li $s3, 0
	li $s3, 1
	add $s4, $s2, $s3
	move $s3, $s4
	sle $s4, $s1, $s2
	beqz $s4, L1
	xor $s4, $s1, $s2
	beqz $s4, L1
	li $s2, 0
	move $s4, $s2
	b L4
L1:
	nop
	li $s2, 1
	sub $s5, $s3, $s2
	sle $s2, $s1, $s5
	xori $s1, $s2, 1
	beqz $s1, L2
	li $s1, 0
	move $s4, $s1
	b L3
L2:
	nop
	li $s1, 1
	move $s4, $s1
L3:
	nop
L4:
	nop
	move $v0, $s4
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s5, -32($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	addu $sp, $sp, 32
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Tree_Insert
Tree_Insert:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 48
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
	li $s3, 28
	move $a0, $s3
	jal _halloc
	move $s4, $v0
	li $s3, 84
	move $a0, $s3
	jal _halloc
	move $s5, $v0
	la $s3, Tree_SetHas_Left
	sw $s3, 0($s5)
	la $s3, Tree_RemoveRight
	sw $s3, 52($s5)
	la $s3, Tree_GetHas_Right
	sw $s3, 60($s5)
	la $s3, Tree_Print
	sw $s3, 68($s5)
	la $s3, Tree_SetLeft
	sw $s3, 36($s5)
	la $s3, Tree_GetRight
	sw $s3, 44($s5)
	la $s3, Tree_Search
	sw $s3, 24($s5)
	la $s3, Tree_GetKey
	sw $s3, 4($s5)
	la $s3, Tree_RecPrint
	sw $s3, 16($s5)
	la $s3, Tree_SetKey
	sw $s3, 40($s5)
	la $s3, Tree_Remove
	sw $s3, 56($s5)
	la $s3, Tree_Delete
	sw $s3, 72($s5)
	la $s3, Tree_Init
	sw $s3, 28($s5)
	la $s3, Tree_Insert
	sw $s3, 80($s5)
	la $s3, Tree_GetLeft
	sw $s3, 12($s5)
	la $s3, Tree_SetHas_Right
	sw $s3, 32($s5)
	la $s3, Tree_accept
	sw $s3, 8($s5)
	la $s3, Tree_SetRight
	sw $s3, 20($s5)
	la $s3, Tree_Compare
	sw $s3, 76($s5)
	la $s3, Tree_GetHas_Left
	sw $s3, 48($s5)
	la $s3, Tree_RemoveLeft
	sw $s3, 64($s5)
	sw $s5, 0($s4)
	move $s3, $s4
	lw $s4, 0($s3)
	lw $s5, 28($s4)
	move $a0, $s3
	move $a1, $s1
	jalr $s5
	move $s4, $v0
	move $s4, $s0
	move $s0, $s4
	li $s4, 1
	move $s5, $s4
L5:
	nop
	beqz $s5, L12
	lw $s4, 0($s0)
	lw $s6, 4($s4)
	move $a0, $s0
	jalr $s6
	move $s4, $v0
	move $s6, $s4
	li $s4, 1
	sub $s7, $s6, $s4
	sle $s4, $s1, $s7
	beqz $s4, L8
	lw $s4, 0($s0)
	lw $s6, 48($s4)
	move $a0, $s0
	jalr $s6
	move $s4, $v0
	beqz $s4, L6
	lw $s4, 0($s0)
	lw $s6, 12($s4)
	move $a0, $s0
	jalr $s6
	move $s4, $v0
	move $s0, $s4
	b L7
L6:
	nop
	li $s4, 0
	move $s5, $s4
	lw $s4, 0($s0)
	lw $s6, 0($s4)
	li $s4, 1
	move $a0, $s0
	move $a1, $s4
	jalr $s6
	move $s7, $v0
	lw $s4, 0($s0)
	lw $s6, 36($s4)
	move $a0, $s0
	move $a1, $s3
	jalr $s6
	move $s4, $v0
L7:
	nop
	b L11
L8:
	nop
	lw $s4, 0($s0)
	lw $s6, 60($s4)
	move $a0, $s0
	jalr $s6
	move $s4, $v0
	beqz $s4, L9
	lw $s4, 0($s0)
	lw $s6, 44($s4)
	move $a0, $s0
	jalr $s6
	move $s4, $v0
	move $s0, $s4
	b L10
L9:
	nop
	li $s4, 0
	move $s5, $s4
	lw $s4, 0($s0)
	lw $s6, 32($s4)
	li $s4, 1
	move $a0, $s0
	move $a1, $s4
	jalr $s6
	move $s7, $v0
	lw $s4, 0($s0)
	lw $s6, 20($s4)
	move $a0, $s0
	move $a1, $s3
	jalr $s6
	move $s4, $v0
L10:
	nop
L11:
	nop
	b L5
L12:
	nop
	li $s0, 1
	move $v0, $s0
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s5, -32($fp)
	lw $s6, -36($fp)
	lw $s7, -40($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	addu $sp, $sp, 48
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Tree_Delete
Tree_Delete:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 64
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
	move $s3, $s0
	move $s4, $s3
	move $s3, $s0
	move $s5, $s3
	li $s3, 1
	move $s6, $s3
	li $s3, 0
	move $s7, $s3
	li $s3, 1
	move $t0, $s3
L13:
	nop
	beqz $s6, L26
	lw $s3, 0($s4)
	lw $t1, 4($s3)
	sw $t0, -44($fp)
	move $a0, $s4
	jalr $t1
	lw $t0, -44($fp)
	move $s3, $v0
	move $t1, $s3
	li $s3, 1
	sub $t2, $t1, $s3
	sle $s3, $s1, $t2
	beqz $s3, L16
	lw $s3, 0($s4)
	lw $t2, 48($s3)
	move $a0, $s4
	jalr $t2
	move $s3, $v0
	beqz $s3, L14
	move $s5, $s4
	lw $s3, 0($s4)
	lw $t2, 12($s3)
	move $a0, $s4
	jalr $t2
	move $s3, $v0
	move $s4, $s3
	b L15
L14:
	nop
	li $s3, 0
	move $s6, $s3
L15:
	nop
	b L25
L16:
	nop
	sle $s3, $t1, $s1
	beqz $s3, L19
	xor $s3, $t1, $s1
	beqz $s3, L19
	lw $s3, 0($s4)
	lw $t1, 60($s3)
	move $a0, $s4
	jalr $t1
	move $s3, $v0
	beqz $s3, L17
	move $s5, $s4
	lw $s3, 0($s4)
	lw $t1, 44($s3)
	move $a0, $s4
	jalr $t1
	move $s3, $v0
	move $s4, $s3
	b L18
L17:
	nop
	li $s3, 0
	move $s6, $s3
L18:
	nop
	b L24
L19:
	nop
	beqz $t0, L22
	lw $s3, 0($s4)
	lw $t1, 60($s3)
	move $a0, $s4
	jalr $t1
	move $s3, $v0
	xori $t1, $s3, 1
	beqz $t1, L20
	lw $s3, 0($s4)
	lw $t1, 48($s3)
	move $a0, $s4
	jalr $t1
	move $s3, $v0
	xori $t1, $s3, 1
	beqz $t1, L20
	li $s3, 1
	b L21
L20:
	nop
	move $s3, $s0
	lw $t1, 0($s3)
	lw $t2, 56($t1)
	sw $t1, -44($fp)
	move $a0, $s3
	move $a1, $s5
	move $a2, $s4
	jalr $t2
	lw $t1, -44($fp)
	move $t1, $v0
L21:
	nop
	b L23
L22:
	nop
	move $s3, $s0
	lw $t1, 0($s3)
	lw $t2, 56($t1)
	sw $t1, -44($fp)
	move $a0, $s3
	move $a1, $s5
	move $a2, $s4
	jalr $t2
	lw $t1, -44($fp)
	move $t1, $v0
L23:
	nop
	li $s3, 1
	move $s7, $s3
	li $s3, 0
	move $s6, $s3
L24:
	nop
L25:
	nop
	li $s3, 0
	move $t0, $s3
	b L13
L26:
	nop
	move $v0, $s7
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s5, -32($fp)
	lw $s6, -36($fp)
	lw $s7, -40($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	addu $sp, $sp, 64
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Tree_Remove
Tree_Remove:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 52
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
	lw $s4, 0($s2)
	lw $s5, 48($s4)
	move $a0, $s2
	jalr $s5
	move $s4, $v0
	beqz $s4, L27
	move $s4, $s0
	lw $s5, 0($s4)
	lw $s6, 64($s5)
	move $a0, $s4
	move $a1, $s1
	move $a2, $s2
	jalr $s6
	move $s5, $v0
	b L32
L27:
	nop
	lw $s4, 0($s2)
	lw $s5, 60($s4)
	move $a0, $s2
	jalr $s5
	move $s4, $v0
	beqz $s4, L28
	move $s4, $s0
	lw $s5, 0($s4)
	lw $s6, 52($s5)
	move $a0, $s4
	move $a1, $s1
	move $a2, $s2
	jalr $s6
	move $s5, $v0
	b L31
L28:
	nop
	lw $s4, 0($s2)
	lw $s5, 4($s4)
	move $a0, $s2
	jalr $s5
	move $s4, $v0
	move $s2, $s4
	lw $s4, 0($s1)
	lw $s5, 12($s4)
	move $a0, $s1
	jalr $s5
	move $s4, $v0
	lw $s5, 0($s4)
	lw $s6, 4($s5)
	move $a0, $s4
	jalr $s6
	move $s5, $v0
	move $s4, $s5
	move $s5, $s0
	lw $s6, 0($s5)
	lw $s7, 76($s6)
	move $a0, $s5
	move $a1, $s2
	move $a2, $s4
	jalr $s7
	move $s6, $v0
	beqz $s6, L29
	lw $s2, 0($s1)
	lw $s4, 36($s2)
	lw $s2, 4($s0)
	move $a0, $s1
	move $a1, $s2
	jalr $s4
	move $s5, $v0
	lw $s2, 0($s1)
	lw $s4, 0($s2)
	li $s2, 0
	move $a0, $s1
	move $a1, $s2
	jalr $s4
	move $s5, $v0
	b L30
L29:
	nop
	lw $s2, 0($s1)
	lw $s4, 20($s2)
	lw $s2, 4($s0)
	move $a0, $s1
	move $a1, $s2
	jalr $s4
	move $s0, $v0
	lw $s0, 0($s1)
	lw $s2, 32($s0)
	li $s0, 0
	move $a0, $s1
	move $a1, $s0
	jalr $s2
	move $s4, $v0
L30:
	nop
L31:
	nop
L32:
	nop
	li $s0, 1
	move $v0, $s0
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s5, -32($fp)
	lw $s6, -36($fp)
	lw $s7, -40($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	addu $sp, $sp, 52
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Tree_RemoveRight
Tree_RemoveRight:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 48
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
L33:
	nop
	lw $s4, 0($s2)
	lw $s5, 60($s4)
	move $a0, $s2
	jalr $s5
	move $s4, $v0
	beqz $s4, L34
	lw $s4, 0($s2)
	lw $s5, 40($s4)
	lw $s4, 0($s2)
	lw $s6, 44($s4)
	move $a0, $s2
	jalr $s6
	move $s4, $v0
	lw $s6, 0($s4)
	lw $s7, 4($s6)
	move $a0, $s4
	jalr $s7
	move $s6, $v0
	move $a0, $s2
	move $a1, $s6
	jalr $s5
	move $s4, $v0
	move $s1, $s2
	lw $s4, 0($s2)
	lw $s5, 44($s4)
	move $a0, $s2
	jalr $s5
	move $s4, $v0
	move $s2, $s4
	b L33
L34:
	nop
	lw $s2, 0($s1)
	lw $s4, 20($s2)
	lw $s2, 4($s0)
	move $a0, $s1
	move $a1, $s2
	jalr $s4
	move $s0, $v0
	lw $s0, 0($s1)
	lw $s2, 32($s0)
	li $s0, 0
	move $a0, $s1
	move $a1, $s0
	jalr $s2
	move $s4, $v0
	li $s0, 1
	move $v0, $s0
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s5, -32($fp)
	lw $s6, -36($fp)
	lw $s7, -40($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	addu $sp, $sp, 48
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Tree_RemoveLeft
Tree_RemoveLeft:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 48
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
L35:
	nop
	lw $s4, 0($s2)
	lw $s5, 48($s4)
	move $a0, $s2
	jalr $s5
	move $s4, $v0
	beqz $s4, L36
	lw $s4, 0($s2)
	lw $s5, 40($s4)
	lw $s4, 0($s2)
	lw $s6, 12($s4)
	move $a0, $s2
	jalr $s6
	move $s4, $v0
	lw $s6, 0($s4)
	lw $s7, 4($s6)
	move $a0, $s4
	jalr $s7
	move $s6, $v0
	move $a0, $s2
	move $a1, $s6
	jalr $s5
	move $s4, $v0
	move $s1, $s2
	lw $s4, 0($s2)
	lw $s5, 12($s4)
	move $a0, $s2
	jalr $s5
	move $s4, $v0
	move $s2, $s4
	b L35
L36:
	nop
	lw $s2, 0($s1)
	lw $s4, 36($s2)
	lw $s2, 4($s0)
	move $a0, $s1
	move $a1, $s2
	jalr $s4
	move $s0, $v0
	lw $s0, 0($s1)
	lw $s2, 0($s0)
	li $s0, 0
	move $a0, $s1
	move $a1, $s0
	jalr $s2
	move $s4, $v0
	li $s0, 1
	move $v0, $s0
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s5, -32($fp)
	lw $s6, -36($fp)
	lw $s7, -40($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	addu $sp, $sp, 48
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Tree_Search
Tree_Search:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 40
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	sw $s5, -32($fp)
	sw $s6, -36($fp)
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	move $s0, $a0
	move $s1, $a1
	move $s2, $s0
	move $s0, $s2
	li $s2, 1
	move $s3, $s2
	li $s2, 0
	move $s4, $s2
L37:
	nop
	beqz $s3, L46
	lw $s2, 0($s0)
	lw $s5, 4($s2)
	move $a0, $s0
	jalr $s5
	move $s2, $v0
	move $s5, $s2
	li $s2, 1
	sub $s6, $s5, $s2
	sle $s2, $s1, $s6
	beqz $s2, L40
	lw $s2, 0($s0)
	lw $s6, 48($s2)
	move $a0, $s0
	jalr $s6
	move $s2, $v0
	beqz $s2, L38
	lw $s2, 0($s0)
	lw $s6, 12($s2)
	move $a0, $s0
	jalr $s6
	move $s2, $v0
	move $s0, $s2
	b L39
L38:
	nop
	li $s2, 0
	move $s3, $s2
L39:
	nop
	b L45
L40:
	nop
	li $s2, 1
	sub $s6, $s1, $s2
	sle $s2, $s5, $s6
	beqz $s2, L43
	lw $s2, 0($s0)
	lw $s5, 60($s2)
	move $a0, $s0
	jalr $s5
	move $s2, $v0
	beqz $s2, L41
	lw $s2, 0($s0)
	lw $s5, 44($s2)
	move $a0, $s0
	jalr $s5
	move $s2, $v0
	move $s0, $s2
	b L42
L41:
	nop
	li $s2, 0
	move $s3, $s2
L42:
	nop
	b L44
L43:
	nop
	li $s2, 1
	move $s4, $s2
	li $s2, 0
	move $s3, $s2
L44:
	nop
L45:
	nop
	b L37
L46:
	nop
	move $v0, $s4
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s5, -32($fp)
	lw $s6, -36($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	addu $sp, $sp, 40
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Tree_Print
Tree_Print:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 36
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	move $s0, $a0
	move $s2, $s0
	move $s3, $s2
	move $s2, $s0
	lw $s0, 0($s2)
	lw $s4, 16($s0)
	move $a0, $s2
	move $a1, $s3
	jalr $s4
	move $s0, $v0
	li $s0, 1
	move $v0, $s0
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	addu $sp, $sp, 36
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Tree_RecPrint
Tree_RecPrint:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 44
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	sw $s5, -32($fp)
	sw $s6, -36($fp)
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	move $s0, $a0
	move $s1, $a1
	lw $s3, 0($s1)
	lw $s4, 48($s3)
	move $a0, $s1
	jalr $s4
	move $s3, $v0
	beqz $s3, L47
	move $s3, $s0
	lw $s4, 0($s3)
	lw $s5, 16($s4)
	lw $s4, 0($s1)
	lw $s6, 12($s4)
	move $a0, $s1
	jalr $s6
	move $s4, $v0
	move $a0, $s3
	move $a1, $s4
	jalr $s5
	move $s6, $v0
	b L48
L47:
	nop
	li $s3, 1
L48:
	nop
	lw $s3, 0($s1)
	lw $s4, 4($s3)
	move $a0, $s1
	jalr $s4
	move $s3, $v0
	move $a0, $s3
	jal _print
	lw $s3, 0($s1)
	lw $s4, 60($s3)
	move $a0, $s1
	jalr $s4
	move $s3, $v0
	beqz $s3, L49
	move $s3, $s0
	lw $s0, 0($s3)
	lw $s4, 16($s0)
	lw $s0, 0($s1)
	lw $s5, 44($s0)
	move $a0, $s1
	jalr $s5
	move $s0, $v0
	move $a0, $s3
	move $a1, $s0
	jalr $s4
	move $s1, $v0
	b L50
L49:
	nop
	li $s0, 1
L50:
	nop
	li $s0, 1
	move $v0, $s0
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s5, -32($fp)
	lw $s6, -36($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	addu $sp, $sp, 44
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Tree_accept
Tree_accept:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 36
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	move $s0, $a0
	move $s1, $a1
	li $s3, 333
	move $a0, $s3
	jal _print
	lw $s3, 0($s1)
	lw $s4, 0($s3)
	move $s3, $s0
	move $a0, $s1
	move $a1, $s3
	jalr $s4
	move $s0, $v0
	li $s0, 0
	move $v0, $s0
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	addu $sp, $sp, 36
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Visitor_visit
Visitor_visit:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 44
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	sw $s5, -32($fp)
	sw $s6, -36($fp)
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	move $s0, $a0
	move $s1, $a1
	lw $s3, 0($s1)
	lw $s4, 60($s3)
	move $a0, $s1
	jalr $s4
	move $s3, $v0
	beqz $s3, L51
	lw $s3, 0($s1)
	lw $s4, 44($s3)
	move $a0, $s1
	jalr $s4
	move $s3, $v0
	sw $s3, 4($s0)
	lw $s3, 4($s0)
	lw $s4, 0($s3)
	lw $s5, 8($s4)
	move $s4, $s0
	move $a0, $s3
	move $a1, $s4
	jalr $s5
	move $s6, $v0
	b L52
L51:
	nop
	li $s3, 0
L52:
	nop
	lw $s3, 0($s1)
	lw $s4, 48($s3)
	move $a0, $s1
	jalr $s4
	move $s3, $v0
	beqz $s3, L53
	lw $s3, 0($s1)
	lw $s4, 12($s3)
	move $a0, $s1
	jalr $s4
	move $s3, $v0
	sw $s3, 8($s0)
	lw $s1, 8($s0)
	lw $s3, 0($s1)
	lw $s4, 8($s3)
	move $s3, $s0
	move $a0, $s1
	move $a1, $s3
	jalr $s4
	move $s0, $v0
	b L54
L53:
	nop
	li $s0, 0
L54:
	nop
	li $s0, 0
	move $v0, $s0
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s5, -32($fp)
	lw $s6, -36($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	addu $sp, $sp, 44
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl MyVisitor_visit
MyVisitor_visit:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 44
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	sw $s5, -32($fp)
	sw $s6, -36($fp)
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	move $s0, $a0
	move $s1, $a1
	lw $s3, 0($s1)
	lw $s4, 60($s3)
	move $a0, $s1
	jalr $s4
	move $s3, $v0
	beqz $s3, L55
	lw $s3, 0($s1)
	lw $s4, 44($s3)
	move $a0, $s1
	jalr $s4
	move $s3, $v0
	sw $s3, 4($s0)
	lw $s3, 4($s0)
	lw $s4, 0($s3)
	lw $s5, 8($s4)
	move $s4, $s0
	move $a0, $s3
	move $a1, $s4
	jalr $s5
	move $s6, $v0
	b L56
L55:
	nop
	li $s3, 0
L56:
	nop
	lw $s3, 0($s1)
	lw $s4, 4($s3)
	move $a0, $s1
	jalr $s4
	move $s3, $v0
	move $a0, $s3
	jal _print
	lw $s3, 0($s1)
	lw $s4, 48($s3)
	move $a0, $s1
	jalr $s4
	move $s3, $v0
	beqz $s3, L57
	lw $s3, 0($s1)
	lw $s4, 12($s3)
	move $a0, $s1
	jalr $s4
	move $s3, $v0
	sw $s3, 8($s0)
	lw $s1, 8($s0)
	lw $s3, 0($s1)
	lw $s4, 8($s3)
	move $s3, $s0
	move $a0, $s1
	move $a1, $s3
	jalr $s4
	move $s0, $v0
	b L58
L57:
	nop
	li $s0, 0
L58:
	nop
	li $s0, 0
	move $v0, $s0
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s5, -32($fp)
	lw $s6, -36($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	addu $sp, $sp, 44
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
