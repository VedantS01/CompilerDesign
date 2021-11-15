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
	sw $s2, 0($s0)
	sw $s0, 0($s1)
	lw $s0, 0($s1)
	lw $s0, 0($s0)
	move $a0, $s1
	jalr $s0
	move $s0, $v0
	move $a0, $s0
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
	subu $sp, $sp, 32
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	li $s0, 80
	move $a0, $s0
	jal _halloc
	move $s0, $v0
	li $s1, 28
	move $a0, $s1
	jal _halloc
	move $s1, $v0
	la $s2, Tree_RecPrint
	sw $s2, 76($s0)
	la $s2, Tree_Print
	sw $s2, 72($s0)
	la $s2, Tree_Search
	sw $s2, 68($s0)
	la $s2, Tree_RemoveLeft
	sw $s2, 64($s0)
	la $s2, Tree_RemoveRight
	sw $s2, 60($s0)
	la $s2, Tree_Remove
	sw $s2, 56($s0)
	la $s2, Tree_Delete
	sw $s2, 52($s0)
	la $s2, Tree_Insert
	sw $s2, 48($s0)
	la $s2, Tree_Compare
	sw $s2, 44($s0)
	la $s2, Tree_SetHas_Right
	sw $s2, 40($s0)
	la $s2, Tree_SetHas_Left
	sw $s2, 36($s0)
	la $s2, Tree_GetHas_Left
	sw $s2, 32($s0)
	la $s2, Tree_GetHas_Right
	sw $s2, 28($s0)
	la $s2, Tree_SetKey
	sw $s2, 24($s0)
	la $s2, Tree_GetKey
	sw $s2, 20($s0)
	la $s2, Tree_GetLeft
	sw $s2, 16($s0)
	la $s2, Tree_GetRight
	sw $s2, 12($s0)
	la $s2, Tree_SetLeft
	sw $s2, 8($s0)
	la $s2, Tree_SetRight
	sw $s2, 4($s0)
	la $s2, Tree_Init
	sw $s2, 0($s0)
	li $s2, 4
L2:
	li $s3, 27
	sle $s3, $s2, $s3
	beqz $s3, L3
	add $s3, $s1, $s2
	li $s4, 0
	sw $s4, 0($s3)
	li $s4, 4
	add $s4, $s2, $s4
	move $s2, $s4
	b L2
L3:
	sw $s0, 0($s1)
	move $s0, $s1
	lw $s2, 0($s0)
	lw $s2, 0($s2)
	li $s4, 16
	move $a0, $s0
	move $a1, $s4
	jalr $s2
	move $s4, $v0
	move $s2, $s1
	lw $s0, 0($s2)
	lw $s0, 72($s0)
	move $a0, $s2
	jalr $s0
	move $s0, $v0
	move $s4, $s0
	li $s0, 100000000
	move $a0, $s0
	jal _print
	move $s0, $s1
	lw $s2, 0($s0)
	lw $s2, 48($s2)
	li $s3, 8
	move $a0, $s0
	move $a1, $s3
	jalr $s2
	move $s3, $v0
	move $s4, $s3
	move $s3, $s1
	lw $s2, 0($s3)
	lw $s2, 72($s2)
	move $a0, $s3
	jalr $s2
	move $s2, $v0
	move $s4, $s2
	move $s2, $s1
	lw $s3, 0($s2)
	lw $s3, 48($s3)
	li $s0, 24
	move $a0, $s2
	move $a1, $s0
	jalr $s3
	move $s0, $v0
	move $s4, $s0
	move $s0, $s1
	lw $s3, 0($s0)
	lw $s3, 48($s3)
	li $s2, 4
	move $a0, $s0
	move $a1, $s2
	jalr $s3
	move $s2, $v0
	move $s4, $s2
	move $s2, $s1
	lw $s3, 0($s2)
	lw $s3, 48($s3)
	li $s0, 12
	move $a0, $s2
	move $a1, $s0
	jalr $s3
	move $s0, $v0
	move $s4, $s0
	move $s0, $s1
	lw $s3, 0($s0)
	lw $s3, 48($s3)
	li $s2, 20
	move $a0, $s0
	move $a1, $s2
	jalr $s3
	move $s2, $v0
	move $s4, $s2
	move $s2, $s1
	lw $s3, 0($s2)
	lw $s3, 48($s3)
	li $s0, 28
	move $a0, $s2
	move $a1, $s0
	jalr $s3
	move $s0, $v0
	move $s4, $s0
	move $s0, $s1
	lw $s3, 0($s0)
	lw $s3, 48($s3)
	li $s2, 14
	move $a0, $s0
	move $a1, $s2
	jalr $s3
	move $s2, $v0
	move $s4, $s2
	move $s2, $s1
	lw $s3, 0($s2)
	lw $s3, 72($s3)
	move $a0, $s2
	jalr $s3
	move $s3, $v0
	move $s4, $s3
	move $s3, $s1
	lw $s2, 0($s3)
	lw $s2, 68($s2)
	li $s0, 24
	move $a0, $s3
	move $a1, $s0
	jalr $s2
	move $s0, $v0
	move $a0, $s0
	jal _print
	move $s0, $s1
	lw $s2, 0($s0)
	lw $s2, 68($s2)
	li $s3, 12
	move $a0, $s0
	move $a1, $s3
	jalr $s2
	move $s3, $v0
	move $a0, $s3
	jal _print
	move $s3, $s1
	lw $s2, 0($s3)
	lw $s2, 68($s2)
	li $s0, 16
	move $a0, $s3
	move $a1, $s0
	jalr $s2
	move $s0, $v0
	move $a0, $s0
	jal _print
	move $s0, $s1
	lw $s2, 0($s0)
	lw $s2, 68($s2)
	li $s3, 50
	move $a0, $s0
	move $a1, $s3
	jalr $s2
	move $s3, $v0
	move $a0, $s3
	jal _print
	move $s3, $s1
	lw $s2, 0($s3)
	lw $s2, 68($s2)
	li $s0, 12
	move $a0, $s3
	move $a1, $s0
	jalr $s2
	move $s0, $v0
	move $a0, $s0
	jal _print
	move $s0, $s1
	lw $s2, 0($s0)
	lw $s2, 52($s2)
	li $s3, 12
	move $a0, $s0
	move $a1, $s3
	jalr $s2
	move $s3, $v0
	move $s4, $s3
	move $s3, $s1
	lw $s2, 0($s3)
	lw $s2, 72($s2)
	move $a0, $s3
	jalr $s2
	move $s2, $v0
	move $s4, $s2
	lw $s2, 0($s1)
	lw $s2, 68($s2)
	li $s4, 12
	move $a0, $s1
	move $a1, $s4
	jalr $s2
	move $s4, $v0
	move $a0, $s4
	jal _print
	li $s4, 0
	move $v0, $s4
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
	sw $s0, 12($s1)
	li $s0, 0
	sw $s0, 16($s1)
	li $s0, 0
	sw $s0, 20($s1)
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
	sw $s0, 4($s1)
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
	lw $s0, 8($s0)
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
	lw $s0, 4($s0)
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
	lw $s0, 12($s0)
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
	.globl Tree_GetHas_Right
Tree_GetHas_Right:
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
	.globl Tree_GetHas_Left
Tree_GetHas_Left:
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
	beqz $s4, L4
	li $s4, 0
	move $s2, $s4
	b L5
L4:
	li $s4, 1
	sub $s4, $s3, $s4
	li $s3, 1
	sle $s4, $s1, $s4
	sub $s4, $s3, $s4
	beqz $s4, L6
	li $s4, 0
	move $s2, $s4
	b L7
L6:
	li $s4, 1
	move $s2, $s4
L7:
	nop
L5:
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
	subu $sp, $sp, 44
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
	li $s2, 80
	move $a0, $s2
	jal _halloc
	move $s2, $v0
	li $s3, 28
	move $a0, $s3
	jal _halloc
	move $s3, $v0
	la $s4, Tree_RecPrint
	sw $s4, 76($s2)
	la $s4, Tree_Print
	sw $s4, 72($s2)
	la $s4, Tree_Search
	sw $s4, 68($s2)
	la $s4, Tree_RemoveLeft
	sw $s4, 64($s2)
	la $s4, Tree_RemoveRight
	sw $s4, 60($s2)
	la $s4, Tree_Remove
	sw $s4, 56($s2)
	la $s4, Tree_Delete
	sw $s4, 52($s2)
	la $s4, Tree_Insert
	sw $s4, 48($s2)
	la $s4, Tree_Compare
	sw $s4, 44($s2)
	la $s4, Tree_SetHas_Right
	sw $s4, 40($s2)
	la $s4, Tree_SetHas_Left
	sw $s4, 36($s2)
	la $s4, Tree_GetHas_Left
	sw $s4, 32($s2)
	la $s4, Tree_GetHas_Right
	sw $s4, 28($s2)
	la $s4, Tree_SetKey
	sw $s4, 24($s2)
	la $s4, Tree_GetKey
	sw $s4, 20($s2)
	la $s4, Tree_GetLeft
	sw $s4, 16($s2)
	la $s4, Tree_GetRight
	sw $s4, 12($s2)
	la $s4, Tree_SetLeft
	sw $s4, 8($s2)
	la $s4, Tree_SetRight
	sw $s4, 4($s2)
	la $s4, Tree_Init
	sw $s4, 0($s2)
	li $s4, 4
L8:
	li $s5, 27
	sle $s5, $s4, $s5
	beqz $s5, L9
	add $s5, $s3, $s4
	li $s6, 0
	sw $s6, 0($s5)
	li $s6, 4
	add $s6, $s4, $s6
	move $s4, $s6
	b L8
L9:
	sw $s2, 0($s3)
	move $s2, $s3
	lw $s4, 0($s2)
	lw $s4, 0($s4)
	move $a0, $s2
	move $a1, $s0
	jalr $s4
	move $s4, $v0
	li $s2, 1
L10:
	beqz $s2, L11
	move $s6, $s1
	lw $s5, 0($s6)
	lw $s5, 20($s5)
	move $a0, $s6
	jalr $s5
	move $s5, $v0
	li $s6, 1
	sub $s6, $s5, $s6
	sle $s6, $s0, $s6
	beqz $s6, L12
	move $s6, $s1
	lw $s5, 0($s6)
	lw $s5, 32($s5)
	move $a0, $s6
	jalr $s5
	move $s5, $v0
	beqz $s5, L14
	move $s5, $s1
	lw $s6, 0($s5)
	lw $s6, 16($s6)
	move $a0, $s5
	jalr $s6
	move $s6, $v0
	move $s1, $s6
	b L15
L14:
	li $s6, 0
	move $s2, $s6
	move $s6, $s1
	lw $s5, 0($s6)
	lw $s5, 36($s5)
	li $s7, 1
	move $a0, $s6
	move $a1, $s7
	jalr $s5
	move $s7, $v0
	move $s4, $s7
	move $s7, $s1
	lw $s5, 0($s7)
	lw $s5, 8($s5)
	move $a0, $s7
	move $a1, $s3
	jalr $s5
	move $s5, $v0
	move $s4, $s5
L15:
	nop
	b L13
L12:
	move $s5, $s1
	lw $s7, 0($s5)
	lw $s7, 28($s7)
	move $a0, $s5
	jalr $s7
	move $s7, $v0
	beqz $s7, L16
	move $s7, $s1
	lw $s5, 0($s7)
	lw $s5, 12($s5)
	move $a0, $s7
	jalr $s5
	move $s5, $v0
	move $s1, $s5
	b L17
L16:
	li $s5, 0
	move $s2, $s5
	move $s5, $s1
	lw $s7, 0($s5)
	lw $s7, 40($s7)
	li $s6, 1
	move $a0, $s5
	move $a1, $s6
	jalr $s7
	move $s6, $v0
	move $s4, $s6
	move $s6, $s1
	lw $s7, 0($s6)
	lw $s7, 4($s7)
	move $a0, $s6
	move $a1, $s3
	jalr $s7
	move $s7, $v0
	move $s4, $s7
L17:
	nop
L13:
	nop
	b L10
L11:
	nop
	li $s2, 1
	move $v0, $s2
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s5, -32($fp)
	lw $s6, -36($fp)
	lw $s7, -40($fp)
	addu $sp, $sp, 44
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Tree_Delete
Tree_Delete:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 60
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
L18:
	beqz $s4, L19
	move $s7, $s2
	lw $t0, 0($s7)
	lw $t0, 20($t0)
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	sw $t2, -52($fp)
	move $a0, $s7
	jalr $t0
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	lw $t2, -52($fp)
	move $t0, $v0
	li $s7, 1
	sub $s7, $t0, $s7
	sle $s7, $s0, $s7
	beqz $s7, L20
	move $s7, $s2
	lw $t1, 0($s7)
	lw $t1, 32($t1)
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	sw $t2, -52($fp)
	move $a0, $s7
	jalr $t1
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	lw $t2, -52($fp)
	move $t1, $v0
	beqz $t1, L22
	move $s3, $s2
	move $t1, $s2
	lw $s7, 0($t1)
	lw $s7, 16($s7)
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	sw $t2, -52($fp)
	move $a0, $t1
	jalr $s7
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	lw $t2, -52($fp)
	move $s7, $v0
	move $s2, $s7
	b L23
L22:
	li $s7, 0
	move $s4, $s7
L23:
	nop
	b L21
L20:
	li $s7, 1
	sub $s7, $s0, $s7
	sle $s7, $t0, $s7
	beqz $s7, L24
	move $s7, $s2
	lw $t0, 0($s7)
	lw $t0, 28($t0)
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	sw $t2, -52($fp)
	move $a0, $s7
	jalr $t0
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	lw $t2, -52($fp)
	move $t0, $v0
	beqz $t0, L26
	move $s3, $s2
	move $t0, $s2
	lw $s7, 0($t0)
	lw $s7, 12($s7)
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	sw $t2, -52($fp)
	move $a0, $t0
	jalr $s7
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	lw $t2, -52($fp)
	move $s7, $v0
	move $s2, $s7
	b L27
L26:
	li $s7, 0
	move $s4, $s7
L27:
	nop
	b L25
L24:
	beqz $s6, L28
	li $s7, 0
	li $t0, 1
	move $t1, $s2
	lw $t2, 0($t1)
	lw $t2, 28($t2)
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	sw $t2, -52($fp)
	move $a0, $t1
	jalr $t2
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	lw $t2, -52($fp)
	move $t2, $v0
	sub $t2, $t0, $t2
	beqz $t2, L32
	li $t2, 1
	move $t0, $s2
	lw $t1, 0($t0)
	lw $t1, 32($t1)
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	sw $t2, -52($fp)
	move $a0, $t0
	jalr $t1
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	lw $t2, -52($fp)
	move $t1, $v0
	sub $t1, $t2, $t1
	beqz $t1, L32
	li $t1, 1
	move $s7, $t1
L32:
	nop
	beqz $s7, L30
	li $s7, 1
	b L31
L30:
	move $t1, $s1
	lw $t2, 0($t1)
	lw $t2, 56($t2)
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	sw $t2, -52($fp)
	move $a0, $t1
	move $a1, $s3
	move $a2, $s2
	jalr $t2
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	lw $t2, -52($fp)
	move $t2, $v0
	move $s7, $t2
L31:
	nop
	b L29
L28:
	move $t2, $s1
	lw $t1, 0($t2)
	lw $t1, 56($t1)
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	sw $t2, -52($fp)
	move $a0, $t2
	move $a1, $s3
	move $a2, $s2
	jalr $t1
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	lw $t2, -52($fp)
	move $t1, $v0
	move $s7, $t1
L29:
	nop
	li $t1, 1
	move $s5, $t1
	li $t1, 0
	move $s4, $t1
L25:
	nop
L21:
	nop
	li $t1, 0
	move $s6, $t1
	b L18
L19:
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
	addu $sp, $sp, 60
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
	move $s3, $s0
	lw $s4, 0($s3)
	lw $s4, 32($s4)
	move $a0, $s3
	jalr $s4
	move $s4, $v0
	beqz $s4, L33
	move $s4, $s2
	lw $s3, 0($s4)
	lw $s3, 64($s3)
	move $a0, $s4
	move $a1, $s1
	move $a2, $s0
	jalr $s3
	move $s3, $v0
	b L34
L33:
	move $s4, $s0
	lw $s5, 0($s4)
	lw $s5, 28($s5)
	move $a0, $s4
	jalr $s5
	move $s5, $v0
	beqz $s5, L35
	move $s5, $s2
	lw $s4, 0($s5)
	lw $s4, 60($s4)
	move $a0, $s5
	move $a1, $s1
	move $a2, $s0
	jalr $s4
	move $s4, $v0
	move $s3, $s4
	b L36
L35:
	lw $s4, 0($s0)
	lw $s4, 20($s4)
	move $a0, $s0
	jalr $s4
	move $s4, $v0
	move $s0, $s1
	lw $s5, 0($s0)
	lw $s5, 16($s5)
	move $a0, $s0
	jalr $s5
	move $s5, $v0
	lw $s0, 0($s5)
	lw $s0, 20($s0)
	move $a0, $s5
	jalr $s0
	move $s0, $v0
	move $s5, $s2
	lw $s6, 0($s5)
	lw $s6, 44($s6)
	move $a0, $s5
	move $a1, $s4
	move $a2, $s0
	jalr $s6
	move $s6, $v0
	beqz $s6, L37
	move $s6, $s1
	lw $s5, 0($s6)
	lw $s5, 8($s5)
	lw $s0, 24($s2)
	move $a0, $s6
	move $a1, $s0
	jalr $s5
	move $s0, $v0
	move $s3, $s0
	move $s0, $s1
	lw $s5, 0($s0)
	lw $s5, 36($s5)
	li $s6, 0
	move $a0, $s0
	move $a1, $s6
	jalr $s5
	move $s6, $v0
	move $s3, $s6
	b L38
L37:
	move $s6, $s1
	lw $s5, 0($s6)
	lw $s5, 4($s5)
	lw $s2, 24($s2)
	move $a0, $s6
	move $a1, $s2
	jalr $s5
	move $s2, $v0
	move $s3, $s2
	lw $s2, 0($s1)
	lw $s2, 40($s2)
	li $s5, 0
	move $a0, $s1
	move $a1, $s5
	jalr $s2
	move $s5, $v0
	move $s3, $s5
L38:
	nop
L36:
	nop
L34:
	nop
	li $s5, 1
	move $v0, $s5
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
	subu $sp, $sp, 40
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
L39:
	move $s3, $s0
	lw $s4, 0($s3)
	lw $s4, 28($s4)
	move $a0, $s3
	jalr $s4
	move $s4, $v0
	beqz $s4, L40
	move $s4, $s0
	lw $s3, 0($s4)
	lw $s3, 24($s3)
	move $s5, $s0
	lw $s6, 0($s5)
	lw $s6, 12($s6)
	move $a0, $s5
	jalr $s6
	move $s6, $v0
	lw $s5, 0($s6)
	lw $s5, 20($s5)
	move $a0, $s6
	jalr $s5
	move $s5, $v0
	move $a0, $s4
	move $a1, $s5
	jalr $s3
	move $s5, $v0
	move $s1, $s0
	move $s3, $s0
	lw $s4, 0($s3)
	lw $s4, 12($s4)
	move $a0, $s3
	jalr $s4
	move $s4, $v0
	move $s0, $s4
	b L39
L40:
	nop
	move $s0, $s1
	lw $s4, 0($s0)
	lw $s4, 4($s4)
	lw $s2, 24($s2)
	move $a0, $s0
	move $a1, $s2
	jalr $s4
	move $s2, $v0
	move $s5, $s2
	lw $s2, 0($s1)
	lw $s2, 40($s2)
	li $s4, 0
	move $a0, $s1
	move $a1, $s4
	jalr $s2
	move $s4, $v0
	move $s5, $s4
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
	.globl Tree_RemoveLeft
Tree_RemoveLeft:
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
	move $s0, $a2
	move $s1, $a1
	move $s2, $a0
L41:
	move $s3, $s0
	lw $s4, 0($s3)
	lw $s4, 32($s4)
	move $a0, $s3
	jalr $s4
	move $s4, $v0
	beqz $s4, L42
	move $s4, $s0
	lw $s3, 0($s4)
	lw $s3, 24($s3)
	move $s5, $s0
	lw $s6, 0($s5)
	lw $s6, 16($s6)
	move $a0, $s5
	jalr $s6
	move $s6, $v0
	lw $s5, 0($s6)
	lw $s5, 20($s5)
	move $a0, $s6
	jalr $s5
	move $s5, $v0
	move $a0, $s4
	move $a1, $s5
	jalr $s3
	move $s5, $v0
	move $s1, $s0
	move $s3, $s0
	lw $s4, 0($s3)
	lw $s4, 16($s4)
	move $a0, $s3
	jalr $s4
	move $s4, $v0
	move $s0, $s4
	b L41
L42:
	nop
	move $s0, $s1
	lw $s4, 0($s0)
	lw $s4, 8($s4)
	lw $s2, 24($s2)
	move $a0, $s0
	move $a1, $s2
	jalr $s4
	move $s2, $v0
	move $s5, $s2
	lw $s2, 0($s1)
	lw $s2, 36($s2)
	li $s4, 0
	move $a0, $s1
	move $a1, $s4
	jalr $s2
	move $s4, $v0
	move $s5, $s4
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
	.globl Tree_Search
Tree_Search:
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
	sw $s6, -36($fp)
	move $s0, $a1
	move $s1, $a0
	li $s2, 1
	li $s3, 0
L43:
	beqz $s2, L44
	move $s4, $s1
	lw $s5, 0($s4)
	lw $s5, 20($s5)
	move $a0, $s4
	jalr $s5
	move $s5, $v0
	li $s4, 1
	sub $s4, $s5, $s4
	sle $s4, $s0, $s4
	beqz $s4, L45
	move $s4, $s1
	lw $s6, 0($s4)
	lw $s6, 32($s6)
	move $a0, $s4
	jalr $s6
	move $s6, $v0
	beqz $s6, L47
	move $s6, $s1
	lw $s4, 0($s6)
	lw $s4, 16($s4)
	move $a0, $s6
	jalr $s4
	move $s4, $v0
	move $s1, $s4
	b L48
L47:
	li $s4, 0
	move $s2, $s4
L48:
	nop
	b L46
L45:
	li $s4, 1
	sub $s4, $s0, $s4
	sle $s4, $s5, $s4
	beqz $s4, L49
	move $s4, $s1
	lw $s5, 0($s4)
	lw $s5, 28($s5)
	move $a0, $s4
	jalr $s5
	move $s5, $v0
	beqz $s5, L51
	move $s5, $s1
	lw $s4, 0($s5)
	lw $s4, 12($s4)
	move $a0, $s5
	jalr $s4
	move $s4, $v0
	move $s1, $s4
	b L52
L51:
	li $s4, 0
	move $s2, $s4
L52:
	nop
	b L50
L49:
	li $s4, 1
	move $s3, $s4
	li $s4, 0
	move $s2, $s4
L50:
	nop
L46:
	nop
	b L43
L44:
	nop
	move $v0, $s3
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s5, -32($fp)
	lw $s6, -36($fp)
	addu $sp, $sp, 36
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
	lw $s2, 76($s2)
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
	subu $sp, $sp, 36
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	sw $s5, -32($fp)
	move $s0, $a1
	move $s1, $a0
	move $s2, $s0
	lw $s3, 0($s2)
	lw $s3, 32($s3)
	move $a0, $s2
	jalr $s3
	move $s3, $v0
	beqz $s3, L53
	move $s3, $s1
	lw $s2, 0($s3)
	lw $s2, 76($s2)
	move $s4, $s0
	lw $s5, 0($s4)
	lw $s5, 16($s5)
	move $a0, $s4
	jalr $s5
	move $s5, $v0
	move $a0, $s3
	move $a1, $s5
	jalr $s2
	move $s5, $v0
	b L54
L53:
	li $s2, 1
	move $s5, $s2
L54:
	nop
	move $s2, $s0
	lw $s3, 0($s2)
	lw $s3, 20($s3)
	move $a0, $s2
	jalr $s3
	move $s3, $v0
	move $a0, $s3
	jal _print
	move $s3, $s0
	lw $s2, 0($s3)
	lw $s2, 28($s2)
	move $a0, $s3
	jalr $s2
	move $s2, $v0
	beqz $s2, L55
	lw $s2, 0($s1)
	lw $s2, 76($s2)
	lw $s3, 0($s0)
	lw $s3, 12($s3)
	move $a0, $s0
	jalr $s3
	move $s3, $v0
	move $a0, $s1
	move $a1, $s3
	jalr $s2
	move $s3, $v0
	move $s5, $s3
	b L56
L55:
	li $s3, 1
	move $s5, $s3
L56:
	nop
	li $s3, 1
	move $v0, $s3
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
