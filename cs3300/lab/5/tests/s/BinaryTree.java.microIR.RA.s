	.text
	.globl main
main:
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 8
	li $s0, 4
	move $a0, $s0
	jal _halloc
	move $s0, $v0
	li $s1, 4
	move $a0, $s1
	jal _halloc
	move $s1, $v0
	la $s2, BT_Start
	sw $s2, 0($s1)
	sw $s1, 0($s0)
	lw $s1, 0($s0)
	lw $s1, 0($s1)
	move $a0, $s0
	jalr $s1
	move $s1, $v0
	move $a0, $s1
	jal _print
	addu $sp, $sp, 8
	lw $ra, -4($sp)
	jal _exitret
	.text
	.globl BT_Start
BT_Start:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 28
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	sw $s3, -24($fp)
	li $s0, 28
	move $a0, $s0
	jal _halloc
	move $s0, $v0
	li $s1, 80
	move $a0, $s1
	jal _halloc
	move $s1, $v0
	la $s2, Tree_Init
	sw $s2, 24($s1)
	la $s2, Tree_Insert
	sw $s2, 76($s1)
	la $s2, Tree_RemoveLeft
	sw $s2, 60($s1)
	la $s2, Tree_Delete
	sw $s2, 68($s1)
	la $s2, Tree_RemoveRight
	sw $s2, 48($s1)
	la $s2, Tree_SetHas_Right
	sw $s2, 28($s1)
	la $s2, Tree_GetRight
	sw $s2, 40($s1)
	la $s2, Tree_Print
	sw $s2, 64($s1)
	la $s2, Tree_Remove
	sw $s2, 52($s1)
	la $s2, Tree_SetKey
	sw $s2, 36($s1)
	la $s2, Tree_SetRight
	sw $s2, 16($s1)
	la $s2, Tree_GetHas_Right
	sw $s2, 56($s1)
	la $s2, Tree_SetHas_Left
	sw $s2, 0($s1)
	la $s2, Tree_Search
	sw $s2, 20($s1)
	la $s2, Tree_GetKey
	sw $s2, 4($s1)
	la $s2, Tree_SetLeft
	sw $s2, 32($s1)
	la $s2, Tree_GetHas_Left
	sw $s2, 44($s1)
	la $s2, Tree_Compare
	sw $s2, 72($s1)
	la $s2, Tree_GetLeft
	sw $s2, 8($s1)
	la $s2, Tree_RecPrint
	sw $s2, 12($s1)
	sw $s1, 0($s0)
	lw $s1, 0($s0)
	lw $s1, 24($s1)
	li $s2, 16
	move $a0, $s0
	move $a1, $s2
	jalr $s1
	move $s2, $v0
	lw $s1, 0($s0)
	lw $s1, 64($s1)
	move $a0, $s0
	jalr $s1
	move $s1, $v0
	move $s2, $s1
	li $s1, 100000000
	move $a0, $s1
	jal _print
	lw $s1, 0($s0)
	lw $s1, 76($s1)
	li $s3, 8
	move $a0, $s0
	move $a1, $s3
	jalr $s1
	move $s3, $v0
	move $s2, $s3
	lw $s3, 0($s0)
	lw $s3, 64($s3)
	move $a0, $s0
	jalr $s3
	move $s3, $v0
	move $s2, $s3
	lw $s3, 0($s0)
	lw $s3, 76($s3)
	li $s1, 24
	move $a0, $s0
	move $a1, $s1
	jalr $s3
	move $s1, $v0
	move $s2, $s1
	lw $s1, 0($s0)
	lw $s1, 76($s1)
	li $s3, 4
	move $a0, $s0
	move $a1, $s3
	jalr $s1
	move $s3, $v0
	move $s2, $s3
	lw $s3, 0($s0)
	lw $s3, 76($s3)
	li $s1, 12
	move $a0, $s0
	move $a1, $s1
	jalr $s3
	move $s1, $v0
	move $s2, $s1
	lw $s1, 0($s0)
	lw $s1, 76($s1)
	li $s3, 20
	move $a0, $s0
	move $a1, $s3
	jalr $s1
	move $s3, $v0
	move $s2, $s3
	lw $s3, 0($s0)
	lw $s3, 76($s3)
	li $s1, 28
	move $a0, $s0
	move $a1, $s1
	jalr $s3
	move $s1, $v0
	move $s2, $s1
	lw $s1, 0($s0)
	lw $s1, 76($s1)
	li $s3, 14
	move $a0, $s0
	move $a1, $s3
	jalr $s1
	move $s3, $v0
	move $s2, $s3
	lw $s3, 0($s0)
	lw $s3, 64($s3)
	move $a0, $s0
	jalr $s3
	move $s3, $v0
	move $s2, $s3
	lw $s3, 0($s0)
	lw $s3, 20($s3)
	li $s1, 24
	move $a0, $s0
	move $a1, $s1
	jalr $s3
	move $s1, $v0
	move $a0, $s1
	jal _print
	lw $s1, 0($s0)
	lw $s1, 20($s1)
	li $s3, 12
	move $a0, $s0
	move $a1, $s3
	jalr $s1
	move $s3, $v0
	move $a0, $s3
	jal _print
	lw $s3, 0($s0)
	lw $s3, 20($s3)
	li $s1, 16
	move $a0, $s0
	move $a1, $s1
	jalr $s3
	move $s1, $v0
	move $a0, $s1
	jal _print
	lw $s1, 0($s0)
	lw $s1, 20($s1)
	li $s3, 50
	move $a0, $s0
	move $a1, $s3
	jalr $s1
	move $s3, $v0
	move $a0, $s3
	jal _print
	lw $s3, 0($s0)
	lw $s3, 20($s3)
	li $s1, 12
	move $a0, $s0
	move $a1, $s1
	jalr $s3
	move $s1, $v0
	move $a0, $s1
	jal _print
	lw $s1, 0($s0)
	lw $s1, 68($s1)
	li $s3, 12
	move $a0, $s0
	move $a1, $s3
	jalr $s1
	move $s3, $v0
	move $s2, $s3
	lw $s3, 0($s0)
	lw $s3, 64($s3)
	move $a0, $s0
	jalr $s3
	move $s3, $v0
	move $s2, $s3
	lw $s3, 0($s0)
	lw $s3, 20($s3)
	li $s2, 12
	move $a0, $s0
	move $a1, $s2
	jalr $s3
	move $s2, $v0
	move $a0, $s2
	jal _print
	li $s2, 0
	move $v0, $s2
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	lw $s3, -24($fp)
	addu $sp, $sp, 28
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Tree_Init
Tree_Init:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 12
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	move $s0, $a1
	move $s1, $a0
	sw $s0, 8($s1)
	li $s0, 0
	sw $s0, 20($s1)
	li $s0, 0
	sw $s0, 12($s1)
	li $s0, 1
	move $v0, $s0
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	addu $sp, $sp, 12
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Tree_SetRight
Tree_SetRight:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 12
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	move $s0, $a1
	move $s1, $a0
	sw $s0, 16($s1)
	li $s1, 1
	move $v0, $s1
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	addu $sp, $sp, 12
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Tree_SetLeft
Tree_SetLeft:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 12
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	move $s0, $a1
	move $s1, $a0
	sw $s0, 24($s1)
	li $s1, 1
	move $v0, $s1
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	addu $sp, $sp, 12
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Tree_GetRight
Tree_GetRight:
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
	.globl Tree_GetLeft
Tree_GetLeft:
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
	.globl Tree_GetKey
Tree_GetKey:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 8
	sw $s0, -12($fp)
	move $s0, $a0
	lw $s0, 8($s0)
	move $v0, $s0
	lw $s0, -12($fp)
	addu $sp, $sp, 8
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Tree_SetKey
Tree_SetKey:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 12
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	move $s0, $a1
	move $s1, $a0
	sw $s0, 8($s1)
	li $s1, 1
	move $v0, $s1
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	addu $sp, $sp, 12
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Tree_GetHas_Right
Tree_GetHas_Right:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 8
	sw $s0, -12($fp)
	move $s0, $a0
	lw $s0, 12($s0)
	move $v0, $s0
	lw $s0, -12($fp)
	addu $sp, $sp, 8
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Tree_GetHas_Left
Tree_GetHas_Left:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 8
	sw $s0, -12($fp)
	move $s0, $a0
	lw $s0, 20($s0)
	move $v0, $s0
	lw $s0, -12($fp)
	addu $sp, $sp, 8
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Tree_SetHas_Left
Tree_SetHas_Left:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 12
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	move $s0, $a1
	move $s1, $a0
	sw $s0, 20($s1)
	li $s1, 1
	move $v0, $s1
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	addu $sp, $sp, 12
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Tree_SetHas_Right
Tree_SetHas_Right:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 12
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	move $s0, $a1
	move $s1, $a0
	sw $s0, 12($s1)
	li $s1, 1
	move $v0, $s1
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	addu $sp, $sp, 12
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Tree_Compare
Tree_Compare:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 24
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	move $s0, $a2
	move $s1, $a1
	li $s2, 0
	li $s3, 1
	add $s3, $s0, $s3
	li $s4, 1
	sub $s4, $s0, $s4
	sle $s4, $s1, $s4
	beqz $s4, L1
	li $s4, 0
	move $s2, $s4
	b L0
L1:
	nop
	li $s4, 1
	sub $s4, $s3, $s4
	sle $s4, $s1, $s4
	xori $s4, $s4, 1
	beqz $s4, L3
	li $s4, 0
	move $s2, $s4
	b L2
L3:
	nop
	li $s4, 1
	move $s2, $s4
L2:
	nop
L0:
	nop
	move $v0, $s2
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	addu $sp, $sp, 24
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Tree_Insert
Tree_Insert:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 40
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	sw $s5, -32($fp)
	sw $s6, -36($fp)
	move $s0, $a1
	move $s1, $a0
	li $s2, 28
	move $a0, $s2
	jal _halloc
	move $s2, $v0
	li $s3, 80
	move $a0, $s3
	jal _halloc
	move $s3, $v0
	la $s4, Tree_Init
	sw $s4, 24($s3)
	la $s4, Tree_Insert
	sw $s4, 76($s3)
	la $s4, Tree_RemoveLeft
	sw $s4, 60($s3)
	la $s4, Tree_Delete
	sw $s4, 68($s3)
	la $s4, Tree_RemoveRight
	sw $s4, 48($s3)
	la $s4, Tree_SetHas_Right
	sw $s4, 28($s3)
	la $s4, Tree_GetRight
	sw $s4, 40($s3)
	la $s4, Tree_Print
	sw $s4, 64($s3)
	la $s4, Tree_Remove
	sw $s4, 52($s3)
	la $s4, Tree_SetKey
	sw $s4, 36($s3)
	la $s4, Tree_SetRight
	sw $s4, 16($s3)
	la $s4, Tree_GetHas_Right
	sw $s4, 56($s3)
	la $s4, Tree_SetHas_Left
	sw $s4, 0($s3)
	la $s4, Tree_Search
	sw $s4, 20($s3)
	la $s4, Tree_GetKey
	sw $s4, 4($s3)
	la $s4, Tree_SetLeft
	sw $s4, 32($s3)
	la $s4, Tree_GetHas_Left
	sw $s4, 44($s3)
	la $s4, Tree_Compare
	sw $s4, 72($s3)
	la $s4, Tree_GetLeft
	sw $s4, 8($s3)
	la $s4, Tree_RecPrint
	sw $s4, 12($s3)
	sw $s3, 0($s2)
	lw $s3, 0($s2)
	lw $s3, 24($s3)
	move $a0, $s2
	move $a1, $s0
	jalr $s3
	move $s3, $v0
	li $s4, 1
L4:
	nop
	beqz $s4, L5
	lw $s5, 0($s1)
	lw $s5, 4($s5)
	move $a0, $s1
	jalr $s5
	move $s5, $v0
	sle $s6, $s0, $s5
	beqz $s6, L7
	xor $s5, $s0, $s5
	beqz $s5, L7
	lw $s5, 0($s1)
	lw $s5, 44($s5)
	move $a0, $s1
	jalr $s5
	move $s5, $v0
	beqz $s5, L9
	lw $s5, 0($s1)
	lw $s5, 8($s5)
	move $a0, $s1
	jalr $s5
	move $s5, $v0
	move $s1, $s5
	b L8
L9:
	nop
	li $s5, 0
	move $s4, $s5
	lw $s5, 0($s1)
	lw $s5, 0($s5)
	li $s6, 1
	move $a0, $s1
	move $a1, $s6
	jalr $s5
	move $s6, $v0
	move $s3, $s6
	lw $s6, 0($s1)
	lw $s6, 32($s6)
	move $a0, $s1
	move $a1, $s2
	jalr $s6
	move $s6, $v0
	move $s3, $s6
L8:
	nop
	b L6
L7:
	nop
	lw $s6, 0($s1)
	lw $s6, 56($s6)
	move $a0, $s1
	jalr $s6
	move $s6, $v0
	beqz $s6, L11
	lw $s6, 0($s1)
	lw $s6, 40($s6)
	move $a0, $s1
	jalr $s6
	move $s6, $v0
	move $s1, $s6
	b L10
L11:
	nop
	li $s6, 0
	move $s4, $s6
	lw $s6, 0($s1)
	lw $s6, 28($s6)
	li $s5, 1
	move $a0, $s1
	move $a1, $s5
	jalr $s6
	move $s5, $v0
	move $s3, $s5
	lw $s5, 0($s1)
	lw $s5, 16($s5)
	move $a0, $s1
	move $a1, $s2
	jalr $s5
	move $s5, $v0
	move $s3, $s5
L10:
	nop
L6:
	nop
	b L4
L5:
	nop
	li $s4, 1
	move $v0, $s4
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s5, -32($fp)
	lw $s6, -36($fp)
	addu $sp, $sp, 40
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Tree_Delete
Tree_Delete:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 56
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	sw $s5, -32($fp)
	sw $s6, -36($fp)
	sw $s7, -40($fp)
	move $s0, $a1
	move $s1, $a0
	move $s2, $s1
	move $s3, $s1
	li $s4, 1
	li $s5, 0
	li $s6, 1
L12:
	nop
	beqz $s4, L13
	lw $s7, 0($s2)
	lw $s7, 4($s7)
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	move $a0, $s2
	jalr $s7
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	move $s7, $v0
	sle $t0, $s0, $s7
	beqz $t0, L15
	xor $t0, $s0, $s7
	beqz $t0, L15
	lw $t0, 0($s2)
	lw $t0, 44($t0)
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	move $a0, $s2
	jalr $t0
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	move $t0, $v0
	beqz $t0, L17
	move $s3, $s2
	lw $t0, 0($s2)
	lw $t0, 8($t0)
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	move $a0, $s2
	jalr $t0
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	move $t0, $v0
	move $s2, $t0
	b L16
L17:
	nop
	li $t0, 0
	move $s4, $t0
L16:
	nop
	b L14
L15:
	nop
	sle $t0, $s7, $s0
	beqz $t0, L19
	xor $s7, $s7, $s0
	beqz $s7, L19
	lw $s7, 0($s2)
	lw $s7, 56($s7)
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	move $a0, $s2
	jalr $s7
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	move $s7, $v0
	beqz $s7, L21
	move $s3, $s2
	lw $s7, 0($s2)
	lw $s7, 40($s7)
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	move $a0, $s2
	jalr $s7
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	move $s7, $v0
	move $s2, $s7
	b L20
L21:
	nop
	li $s7, 0
	move $s4, $s7
L20:
	nop
	b L18
L19:
	nop
	beqz $s6, L23
	lw $s7, 0($s2)
	lw $s7, 56($s7)
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	move $a0, $s2
	jalr $s7
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	move $s7, $v0
	xori $s7, $s7, 1
	beqz $s7, L25
	lw $s7, 0($s2)
	lw $s7, 44($s7)
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	move $a0, $s2
	jalr $s7
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	move $s7, $v0
	xori $s7, $s7, 1
	beqz $s7, L25
	li $s7, 1
	b L24
L25:
	nop
	move $t0, $s1
	lw $t1, 0($t0)
	lw $t1, 52($t1)
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	move $a0, $t0
	move $a1, $s3
	move $a2, $s2
	jalr $t1
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	move $t1, $v0
	move $s7, $t1
L24:
	nop
	b L22
L23:
	nop
	move $t1, $s1
	lw $t0, 0($t1)
	lw $t0, 52($t0)
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	move $a0, $t1
	move $a1, $s3
	move $a2, $s2
	jalr $t0
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	move $t0, $v0
	move $s7, $t0
L22:
	nop
	li $t0, 1
	move $s5, $t0
	li $t0, 0
	move $s4, $t0
L18:
	nop
L14:
	nop
	li $t0, 0
	move $s6, $t0
	b L12
L13:
	nop
	move $v0, $s5
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s5, -32($fp)
	lw $s6, -36($fp)
	lw $s7, -40($fp)
	addu $sp, $sp, 56
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Tree_Remove
Tree_Remove:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 44
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	sw $s5, -32($fp)
	sw $s6, -36($fp)
	move $s0, $a2
	move $s1, $a1
	move $s2, $a0
	lw $s3, 0($s0)
	lw $s3, 44($s3)
	move $a0, $s0
	jalr $s3
	move $s3, $v0
	beqz $s3, L27
	move $s3, $s2
	lw $s4, 0($s3)
	lw $s4, 60($s4)
	move $a0, $s3
	move $a1, $s1
	move $a2, $s0
	jalr $s4
	move $s4, $v0
	b L26
L27:
	nop
	lw $s3, 0($s0)
	lw $s3, 56($s3)
	move $a0, $s0
	jalr $s3
	move $s3, $v0
	beqz $s3, L29
	move $s3, $s2
	lw $s5, 0($s3)
	lw $s5, 48($s5)
	move $a0, $s3
	move $a1, $s1
	move $a2, $s0
	jalr $s5
	move $s5, $v0
	move $s4, $s5
	b L28
L29:
	nop
	lw $s5, 0($s0)
	lw $s5, 4($s5)
	move $a0, $s0
	jalr $s5
	move $s5, $v0
	lw $s0, 0($s1)
	lw $s0, 8($s0)
	move $a0, $s1
	jalr $s0
	move $s0, $v0
	lw $s3, 0($s0)
	lw $s3, 4($s3)
	move $a0, $s0
	jalr $s3
	move $s3, $v0
	move $s0, $s2
	lw $s6, 0($s0)
	lw $s6, 72($s6)
	move $a0, $s0
	move $a1, $s5
	move $a2, $s3
	jalr $s6
	move $s6, $v0
	beqz $s6, L31
	lw $s6, 0($s1)
	lw $s6, 32($s6)
	lw $s0, 4($s2)
	move $a0, $s1
	move $a1, $s0
	jalr $s6
	move $s0, $v0
	move $s4, $s0
	lw $s0, 0($s1)
	lw $s0, 0($s0)
	li $s6, 0
	move $a0, $s1
	move $a1, $s6
	jalr $s0
	move $s6, $v0
	move $s4, $s6
	b L30
L31:
	nop
	lw $s6, 0($s1)
	lw $s6, 16($s6)
	lw $s2, 4($s2)
	move $a0, $s1
	move $a1, $s2
	jalr $s6
	move $s2, $v0
	move $s4, $s2
	lw $s2, 0($s1)
	lw $s2, 28($s2)
	li $s6, 0
	move $a0, $s1
	move $a1, $s6
	jalr $s2
	move $s6, $v0
	move $s4, $s6
L30:
	nop
L28:
	nop
L26:
	nop
	li $s6, 1
	move $v0, $s6
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s5, -32($fp)
	lw $s6, -36($fp)
	addu $sp, $sp, 44
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Tree_RemoveRight
Tree_RemoveRight:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 36
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	sw $s5, -32($fp)
	move $s0, $a2
	move $s1, $a1
	move $s2, $a0
L32:
	nop
	lw $s3, 0($s0)
	lw $s3, 56($s3)
	move $a0, $s0
	jalr $s3
	move $s3, $v0
	beqz $s3, L33
	lw $s3, 0($s0)
	lw $s3, 36($s3)
	lw $s4, 0($s0)
	lw $s4, 40($s4)
	move $a0, $s0
	jalr $s4
	move $s4, $v0
	lw $s5, 0($s4)
	lw $s5, 4($s5)
	move $a0, $s4
	jalr $s5
	move $s5, $v0
	move $a0, $s0
	move $a1, $s5
	jalr $s3
	move $s5, $v0
	move $s1, $s0
	lw $s3, 0($s0)
	lw $s3, 40($s3)
	move $a0, $s0
	jalr $s3
	move $s3, $v0
	move $s0, $s3
	b L32
L33:
	nop
	lw $s0, 0($s1)
	lw $s0, 16($s0)
	lw $s2, 4($s2)
	move $a0, $s1
	move $a1, $s2
	jalr $s0
	move $s2, $v0
	move $s5, $s2
	lw $s2, 0($s1)
	lw $s2, 28($s2)
	li $s0, 0
	move $a0, $s1
	move $a1, $s0
	jalr $s2
	move $s0, $v0
	move $s5, $s0
	li $s0, 1
	move $v0, $s0
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s5, -32($fp)
	addu $sp, $sp, 36
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Tree_RemoveLeft
Tree_RemoveLeft:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 36
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	sw $s5, -32($fp)
	move $s0, $a2
	move $s1, $a1
	move $s2, $a0
L34:
	nop
	lw $s3, 0($s0)
	lw $s3, 44($s3)
	move $a0, $s0
	jalr $s3
	move $s3, $v0
	beqz $s3, L35
	lw $s3, 0($s0)
	lw $s3, 36($s3)
	lw $s4, 0($s0)
	lw $s4, 8($s4)
	move $a0, $s0
	jalr $s4
	move $s4, $v0
	lw $s5, 0($s4)
	lw $s5, 4($s5)
	move $a0, $s4
	jalr $s5
	move $s5, $v0
	move $a0, $s0
	move $a1, $s5
	jalr $s3
	move $s5, $v0
	move $s1, $s0
	lw $s3, 0($s0)
	lw $s3, 8($s3)
	move $a0, $s0
	jalr $s3
	move $s3, $v0
	move $s0, $s3
	b L34
L35:
	nop
	lw $s0, 0($s1)
	lw $s0, 32($s0)
	lw $s2, 4($s2)
	move $a0, $s1
	move $a1, $s2
	jalr $s0
	move $s2, $v0
	move $s5, $s2
	lw $s2, 0($s1)
	lw $s2, 0($s2)
	li $s0, 0
	move $a0, $s1
	move $a1, $s0
	jalr $s2
	move $s0, $v0
	move $s5, $s0
	li $s0, 1
	move $v0, $s0
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s5, -32($fp)
	addu $sp, $sp, 36
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Tree_Search
Tree_Search:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 32
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	sw $s5, -32($fp)
	move $s0, $a1
	move $s1, $a0
	li $s2, 1
	li $s3, 0
L36:
	nop
	beqz $s2, L37
	lw $s4, 0($s1)
	lw $s4, 4($s4)
	move $a0, $s1
	jalr $s4
	move $s4, $v0
	sle $s5, $s0, $s4
	beqz $s5, L39
	xor $s5, $s0, $s4
	beqz $s5, L39
	lw $s5, 0($s1)
	lw $s5, 44($s5)
	move $a0, $s1
	jalr $s5
	move $s5, $v0
	beqz $s5, L41
	lw $s5, 0($s1)
	lw $s5, 8($s5)
	move $a0, $s1
	jalr $s5
	move $s5, $v0
	move $s1, $s5
	b L40
L41:
	nop
	li $s5, 0
	move $s2, $s5
L40:
	nop
	b L38
L39:
	nop
	sle $s5, $s4, $s0
	beqz $s5, L43
	xor $s4, $s4, $s0
	beqz $s4, L43
	lw $s4, 0($s1)
	lw $s4, 56($s4)
	move $a0, $s1
	jalr $s4
	move $s4, $v0
	beqz $s4, L45
	lw $s4, 0($s1)
	lw $s4, 40($s4)
	move $a0, $s1
	jalr $s4
	move $s4, $v0
	move $s1, $s4
	b L44
L45:
	nop
	li $s4, 0
	move $s2, $s4
L44:
	nop
	b L42
L43:
	nop
	li $s4, 1
	move $s3, $s4
	li $s4, 0
	move $s2, $s4
L42:
	nop
L38:
	nop
	b L36
L37:
	nop
	move $v0, $s3
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s5, -32($fp)
	addu $sp, $sp, 32
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Tree_Print
Tree_Print:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 24
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	move $s0, $a0
	move $s1, $s0
	lw $s2, 0($s0)
	lw $s2, 12($s2)
	move $a0, $s0
	move $a1, $s1
	jalr $s2
	move $s2, $v0
	li $s2, 1
	move $v0, $s2
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	addu $sp, $sp, 24
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Tree_RecPrint
Tree_RecPrint:
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
	lw $s2, 44($s2)
	move $a0, $s0
	jalr $s2
	move $s2, $v0
	beqz $s2, L47
	move $s2, $s1
	lw $s3, 0($s2)
	lw $s3, 12($s3)
	lw $s4, 0($s0)
	lw $s4, 8($s4)
	move $a0, $s0
	jalr $s4
	move $s4, $v0
	move $a0, $s2
	move $a1, $s4
	jalr $s3
	move $s4, $v0
	b L46
L47:
	nop
	li $s3, 1
	move $s4, $s3
L46:
	nop
	lw $s3, 0($s0)
	lw $s3, 4($s3)
	move $a0, $s0
	jalr $s3
	move $s3, $v0
	move $a0, $s3
	jal _print
	lw $s3, 0($s0)
	lw $s3, 56($s3)
	move $a0, $s0
	jalr $s3
	move $s3, $v0
	beqz $s3, L49
	lw $s3, 0($s1)
	lw $s3, 12($s3)
	lw $s2, 0($s0)
	lw $s2, 40($s2)
	move $a0, $s0
	jalr $s2
	move $s2, $v0
	move $a0, $s1
	move $a1, $s2
	jalr $s3
	move $s2, $v0
	move $s4, $s2
	b L48
L49:
	nop
	li $s2, 1
	move $s4, $s2
L48:
	nop
	li $s2, 1
	move $v0, $s2
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
