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
	la $s0, LL_Start
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
	.globl Element_Init
Element_Init:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 24
	sw $s3, -24($fp)
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	move $s0, $a0
	move $s1, $a1
	move $s2, $a2
	move $s3, $a3
	sw $s1, 12($s0)
	sw $s2, 4($s0)
	sw $s3, 8($s0)
	li $s0, 1
	move $v0, $s0
	lw $s3, -24($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	addu $sp, $sp, 24
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Element_GetAge
Element_GetAge:
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
	.globl Element_GetSalary
Element_GetSalary:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 16
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	move $s0, $a0
	lw $s1, 4($s0)
	move $v0, $s1
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	addu $sp, $sp, 16
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Element_GetMarried
Element_GetMarried:
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
	.globl Element_Equal
Element_Equal:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 56
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
	li $s3, 1
	move $s4, $s3
	lw $s3, 0($s1)
	lw $s5, 4($s3)
	move $a0, $s1
	jalr $s5
	move $s3, $v0
	move $s5, $s3
	move $s3, $s0
	lw $s6, 0($s3)
	lw $s7, 12($s6)
	lw $s6, 12($s0)
	sw $t0, -44($fp)
	move $a0, $s3
	move $a1, $s5
	move $a2, $s6
	jalr $s7
	lw $t0, -44($fp)
	move $t0, $v0
	xori $s3, $t0, 1
	beqz $s3, L1
	li $s3, 0
	move $s4, $s3
	b L10
L1:
	nop
	lw $s3, 0($s1)
	lw $s5, 20($s3)
	move $a0, $s1
	jalr $s5
	move $s3, $v0
	move $s5, $s3
	move $s3, $s0
	lw $s6, 0($s3)
	lw $s7, 12($s6)
	lw $s6, 4($s0)
	sw $t0, -44($fp)
	move $a0, $s3
	move $a1, $s5
	move $a2, $s6
	jalr $s7
	lw $t0, -44($fp)
	move $t0, $v0
	xori $s3, $t0, 1
	beqz $s3, L2
	li $s3, 0
	move $s4, $s3
	b L9
L2:
	nop
	lw $s3, 8($s0)
	beqz $s3, L5
	lw $s0, 0($s1)
	lw $s3, 16($s0)
	move $a0, $s1
	jalr $s3
	move $s0, $v0
	xori $s3, $s0, 1
	beqz $s3, L3
	li $s0, 0
	move $s4, $s0
	b L4
L3:
	nop
	li $s0, 0
L4:
	nop
	b L8
L5:
	nop
	lw $s0, 0($s1)
	lw $s3, 16($s0)
	move $a0, $s1
	jalr $s3
	move $s0, $v0
	beqz $s0, L6
	li $s0, 0
	move $s4, $s0
	b L7
L6:
	nop
	li $s0, 0
L7:
	nop
L8:
	nop
L9:
	nop
L10:
	nop
	move $v0, $s4
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s5, -32($fp)
	lw $s6, -36($fp)
	lw $s7, -40($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	addu $sp, $sp, 56
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Element_Compare
Element_Compare:
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
	beqz $s4, L11
	xor $s4, $s1, $s2
	beqz $s4, L11
	li $s2, 0
	move $s4, $s2
	b L14
L11:
	nop
	li $s2, 1
	sub $s5, $s3, $s2
	sle $s2, $s1, $s5
	xori $s1, $s2, 1
	beqz $s1, L12
	li $s1, 0
	move $s4, $s1
	b L13
L12:
	nop
	li $s1, 1
	move $s4, $s1
L13:
	nop
L14:
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
	.globl List_Init
List_Init:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 16
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	move $s0, $a0
	li $s1, 1
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
	.globl List_InitNew
List_InitNew:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 24
	sw $s3, -24($fp)
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	move $s0, $a0
	move $s1, $a1
	move $s2, $a2
	move $s3, $a3
	sw $s3, 12($s0)
	sw $s1, 4($s0)
	sw $s2, 8($s0)
	li $s0, 1
	move $v0, $s0
	lw $s3, -24($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	addu $sp, $sp, 24
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl List_Insert
List_Insert:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 52
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	sw $s5, -32($fp)
	sw $s6, -36($fp)
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	move $s0, $a0
	move $s1, $a1
	move $s3, $s0
	move $s0, $s3
	li $s3, 16
	move $a0, $s3
	jal _halloc
	move $s4, $v0
	li $s3, 40
	move $a0, $s3
	jal _halloc
	move $s5, $v0
	la $s3, List_Delete
	sw $s3, 24($s5)
	la $s3, List_Search
	sw $s3, 28($s5)
	la $s3, List_Insert
	sw $s3, 36($s5)
	la $s3, List_InitNew
	sw $s3, 16($s5)
	la $s3, List_SetNext
	sw $s3, 8($s5)
	la $s3, List_Init
	sw $s3, 0($s5)
	la $s3, List_GetNext
	sw $s3, 12($s5)
	la $s3, List_GetEnd
	sw $s3, 32($s5)
	la $s3, List_Print
	sw $s3, 20($s5)
	la $s3, List_GetElem
	sw $s3, 4($s5)
	sw $s5, 0($s4)
	move $s3, $s4
	lw $s4, 0($s3)
	lw $s5, 16($s4)
	li $s4, 0
	move $a0, $s3
	move $a1, $s1
	move $a2, $s0
	move $a3, $s4
	jalr $s5
	move $s6, $v0
	move $v0, $s3
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s5, -32($fp)
	lw $s6, -36($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	addu $sp, $sp, 52
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl List_SetNext
List_SetNext:
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
	.globl List_Delete
List_Delete:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 68
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
	move $s4, $s0
	move $s5, $s4
	li $s4, 0
	move $s6, $s4
	li $s4, 0
	li $s7, 1
	sub $t0, $s4, $s7
	move $s4, $t0
	move $s7, $s0
	move $t0, $s7
	move $s7, $s0
	move $t1, $s7
	lw $s7, 12($s0)
	move $t2, $s7
	lw $s7, 4($s0)
	move $s0, $s7
L15:
	nop
	xori $s7, $t2, 1
	beqz $s7, L22
	xori $s7, $s6, 1
	beqz $s7, L22
	lw $s7, 0($s1)
	lw $t3, 8($s7)
	sw $t2, -44($fp)
	sw $t1, -48($fp)
	sw $t0, -52($fp)
	move $a0, $s1
	move $a1, $s0
	jalr $t3
	lw $t2, -44($fp)
	lw $t1, -48($fp)
	lw $t0, -52($fp)
	move $s7, $v0
	beqz $s7, L18
	li $s7, 1
	move $s6, $s7
	li $s7, 0
	sle $t3, $s4, $s7
	beqz $t3, L16
	li $s7, 0
	xor $t3, $s4, $s7
	beqz $t3, L16
	lw $s7, 0($t0)
	lw $t3, 12($s7)
	sw $t2, -44($fp)
	sw $t1, -48($fp)
	sw $t0, -52($fp)
	move $a0, $t0
	jalr $t3
	lw $t2, -44($fp)
	lw $t1, -48($fp)
	lw $t0, -52($fp)
	move $s7, $v0
	move $s5, $s7
	b L17
L16:
	nop
	li $s7, 0
	li $t3, 555
	sub $t4, $s7, $t3
	move $a0, $t4
	jal _print
	lw $s7, 0($t1)
	lw $t3, 8($s7)
	lw $s7, 0($t0)
	lw $t4, 12($s7)
	sw $t2, -44($fp)
	sw $t1, -48($fp)
	sw $t3, -52($fp)
	sw $t0, -56($fp)
	move $a0, $t0
	jalr $t4
	lw $t2, -44($fp)
	lw $t1, -48($fp)
	lw $t3, -52($fp)
	lw $t0, -56($fp)
	move $s7, $v0
	sw $t2, -44($fp)
	sw $t4, -48($fp)
	sw $t1, -52($fp)
	sw $t0, -56($fp)
	move $a0, $t1
	move $a1, $s7
	jalr $t3
	lw $t2, -44($fp)
	lw $t4, -48($fp)
	lw $t1, -52($fp)
	lw $t0, -56($fp)
	move $t4, $v0
	li $s7, 0
	li $t3, 555
	sub $t4, $s7, $t3
	move $a0, $t4
	jal _print
L17:
	nop
	b L19
L18:
	nop
	li $s7, 0
L19:
	nop
	xori $s7, $s6, 1
	beqz $s7, L20
	move $t1, $t0
	lw $s7, 0($t0)
	lw $t3, 12($s7)
	sw $t1, -44($fp)
	move $a0, $t0
	jalr $t3
	lw $t1, -44($fp)
	move $s7, $v0
	move $t0, $s7
	lw $s7, 0($t0)
	lw $t3, 32($s7)
	sw $t1, -44($fp)
	sw $t0, -48($fp)
	move $a0, $t0
	jalr $t3
	lw $t1, -44($fp)
	lw $t0, -48($fp)
	move $s7, $v0
	move $t2, $s7
	lw $s7, 0($t0)
	lw $t3, 4($s7)
	sw $t2, -44($fp)
	sw $t1, -48($fp)
	sw $t0, -52($fp)
	move $a0, $t0
	jalr $t3
	lw $t2, -44($fp)
	lw $t1, -48($fp)
	lw $t0, -52($fp)
	move $s7, $v0
	move $s0, $s7
	li $s7, 1
	move $s4, $s7
	b L21
L20:
	nop
	li $s7, 0
L21:
	nop
	b L15
L22:
	nop
	move $v0, $s5
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s5, -32($fp)
	lw $s6, -36($fp)
	lw $s7, -40($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	addu $sp, $sp, 68
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl List_Search
List_Search:
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
	li $s3, 0
	move $s4, $s3
	move $s3, $s0
	move $s5, $s3
	lw $s3, 12($s0)
	move $s6, $s3
	lw $s3, 4($s0)
	move $s0, $s3
L23:
	nop
	xori $s3, $s6, 1
	beqz $s3, L26
	lw $s3, 0($s1)
	lw $s7, 8($s3)
	move $a0, $s1
	move $a1, $s0
	jalr $s7
	move $s3, $v0
	beqz $s3, L24
	li $s3, 1
	move $s4, $s3
	b L25
L24:
	nop
	li $s3, 0
L25:
	nop
	lw $s3, 0($s5)
	lw $s7, 12($s3)
	move $a0, $s5
	jalr $s7
	move $s3, $v0
	move $s5, $s3
	lw $s3, 0($s5)
	lw $s7, 32($s3)
	move $a0, $s5
	jalr $s7
	move $s3, $v0
	move $s6, $s3
	lw $s3, 0($s5)
	lw $s7, 4($s3)
	move $a0, $s5
	jalr $s7
	move $s3, $v0
	move $s0, $s3
	b L23
L26:
	nop
	move $v0, $s4
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
	.globl List_GetEnd
List_GetEnd:
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
	.globl List_GetElem
List_GetElem:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 16
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	move $s0, $a0
	lw $s1, 4($s0)
	move $v0, $s1
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	addu $sp, $sp, 16
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl List_GetNext
List_GetNext:
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
	.globl List_Print
List_Print:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 32
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	move $s0, $a0
	move $s1, $s0
	move $s2, $s1
	lw $s1, 12($s0)
	move $s3, $s1
	lw $s1, 4($s0)
	move $s0, $s1
L27:
	nop
	xori $s1, $s3, 1
	beqz $s1, L28
	lw $s1, 0($s0)
	lw $s4, 4($s1)
	move $a0, $s0
	jalr $s4
	move $s1, $v0
	move $a0, $s1
	jal _print
	lw $s1, 0($s2)
	lw $s4, 12($s1)
	move $a0, $s2
	jalr $s4
	move $s1, $v0
	move $s2, $s1
	lw $s1, 0($s2)
	lw $s4, 32($s1)
	move $a0, $s2
	jalr $s4
	move $s1, $v0
	move $s3, $s1
	lw $s1, 0($s2)
	lw $s4, 4($s1)
	move $a0, $s2
	jalr $s4
	move $s1, $v0
	move $s0, $s1
	b L27
L28:
	nop
	li $s0, 1
	move $v0, $s0
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	addu $sp, $sp, 32
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl LL_Start
LL_Start:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 68
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	sw $s5, -32($fp)
	sw $s6, -36($fp)
	sw $s7, -40($fp)
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	move $s0, $a0
	li $s2, 16
	move $a0, $s2
	jal _halloc
	move $s3, $v0
	li $s2, 40
	move $a0, $s2
	jal _halloc
	move $s4, $v0
	la $s2, List_Delete
	sw $s2, 24($s4)
	la $s2, List_Search
	sw $s2, 28($s4)
	la $s2, List_Insert
	sw $s2, 36($s4)
	la $s2, List_InitNew
	sw $s2, 16($s4)
	la $s2, List_SetNext
	sw $s2, 8($s4)
	la $s2, List_Init
	sw $s2, 0($s4)
	la $s2, List_GetNext
	sw $s2, 12($s4)
	la $s2, List_GetEnd
	sw $s2, 32($s4)
	la $s2, List_Print
	sw $s2, 20($s4)
	la $s2, List_GetElem
	sw $s2, 4($s4)
	sw $s4, 0($s3)
	move $s2, $s3
	lw $s3, 0($s2)
	lw $s4, 0($s3)
	move $a0, $s2
	jalr $s4
	move $s3, $v0
	move $s3, $s2
	lw $s2, 0($s3)
	lw $s4, 0($s2)
	move $a0, $s3
	jalr $s4
	move $s2, $v0
	lw $s2, 0($s3)
	lw $s4, 20($s2)
	move $a0, $s3
	jalr $s4
	move $s2, $v0
	li $s2, 16
	move $a0, $s2
	jal _halloc
	move $s4, $v0
	li $s2, 24
	move $a0, $s2
	jal _halloc
	move $s5, $v0
	la $s2, Element_GetAge
	sw $s2, 4($s5)
	la $s2, Element_Compare
	sw $s2, 12($s5)
	la $s2, Element_Init
	sw $s2, 0($s5)
	la $s2, Element_GetMarried
	sw $s2, 16($s5)
	la $s2, Element_GetSalary
	sw $s2, 20($s5)
	la $s2, Element_Equal
	sw $s2, 8($s5)
	sw $s5, 0($s4)
	move $s2, $s4
	lw $s4, 0($s2)
	lw $s5, 0($s4)
	li $s4, 25
	li $s6, 37000
	li $s7, 0
	sw $t0, -44($fp)
	move $a0, $s2
	move $a1, $s4
	move $a2, $s6
	move $a3, $s7
	jalr $s5
	lw $t0, -44($fp)
	move $t0, $v0
	lw $s4, 0($s3)
	lw $s5, 36($s4)
	move $a0, $s3
	move $a1, $s2
	jalr $s5
	move $s4, $v0
	move $s3, $s4
	lw $s4, 0($s3)
	lw $s5, 20($s4)
	move $a0, $s3
	jalr $s5
	move $s4, $v0
	li $s4, 10000000
	move $a0, $s4
	jal _print
	li $s4, 16
	move $a0, $s4
	jal _halloc
	move $s5, $v0
	li $s4, 24
	move $a0, $s4
	jal _halloc
	move $s6, $v0
	la $s4, Element_GetAge
	sw $s4, 4($s6)
	la $s4, Element_Compare
	sw $s4, 12($s6)
	la $s4, Element_Init
	sw $s4, 0($s6)
	la $s4, Element_GetMarried
	sw $s4, 16($s6)
	la $s4, Element_GetSalary
	sw $s4, 20($s6)
	la $s4, Element_Equal
	sw $s4, 8($s6)
	sw $s6, 0($s5)
	move $s2, $s5
	lw $s4, 0($s2)
	lw $s5, 0($s4)
	li $s4, 39
	li $s6, 42000
	li $s7, 1
	sw $t0, -44($fp)
	move $a0, $s2
	move $a1, $s4
	move $a2, $s6
	move $a3, $s7
	jalr $s5
	lw $t0, -44($fp)
	move $t0, $v0
	move $s4, $s2
	lw $s5, 0($s3)
	lw $s6, 36($s5)
	move $a0, $s3
	move $a1, $s2
	jalr $s6
	move $s5, $v0
	move $s3, $s5
	lw $s5, 0($s3)
	lw $s6, 20($s5)
	move $a0, $s3
	jalr $s6
	move $s5, $v0
	li $s5, 10000000
	move $a0, $s5
	jal _print
	li $s5, 16
	move $a0, $s5
	jal _halloc
	move $s6, $v0
	li $s5, 24
	move $a0, $s5
	jal _halloc
	move $s7, $v0
	la $s5, Element_GetAge
	sw $s5, 4($s7)
	la $s5, Element_Compare
	sw $s5, 12($s7)
	la $s5, Element_Init
	sw $s5, 0($s7)
	la $s5, Element_GetMarried
	sw $s5, 16($s7)
	la $s5, Element_GetSalary
	sw $s5, 20($s7)
	la $s5, Element_Equal
	sw $s5, 8($s7)
	sw $s7, 0($s6)
	move $s2, $s6
	lw $s5, 0($s2)
	lw $s6, 0($s5)
	li $s5, 22
	li $s7, 34000
	li $t0, 0
	sw $t1, -44($fp)
	move $a0, $s2
	move $a1, $s5
	move $a2, $s7
	move $a3, $t0
	jalr $s6
	lw $t1, -44($fp)
	move $t1, $v0
	lw $s5, 0($s3)
	lw $s6, 36($s5)
	move $a0, $s3
	move $a1, $s2
	jalr $s6
	move $s5, $v0
	move $s3, $s5
	lw $s5, 0($s3)
	lw $s6, 20($s5)
	move $a0, $s3
	jalr $s6
	move $s5, $v0
	li $s5, 16
	move $a0, $s5
	jal _halloc
	move $s6, $v0
	li $s5, 24
	move $a0, $s5
	jal _halloc
	move $s7, $v0
	la $s5, Element_GetAge
	sw $s5, 4($s7)
	la $s5, Element_Compare
	sw $s5, 12($s7)
	la $s5, Element_Init
	sw $s5, 0($s7)
	la $s5, Element_GetMarried
	sw $s5, 16($s7)
	la $s5, Element_GetSalary
	sw $s5, 20($s7)
	la $s5, Element_Equal
	sw $s5, 8($s7)
	sw $s7, 0($s6)
	move $s5, $s6
	lw $s6, 0($s5)
	lw $s7, 0($s6)
	li $s6, 27
	li $t0, 34000
	li $t1, 0
	sw $t2, -44($fp)
	move $a0, $s5
	move $a1, $s6
	move $a2, $t0
	move $a3, $t1
	jalr $s7
	lw $t2, -44($fp)
	move $t2, $v0
	lw $s6, 0($s3)
	lw $s7, 28($s6)
	move $a0, $s3
	move $a1, $s4
	jalr $s7
	move $s6, $v0
	move $a0, $s6
	jal _print
	lw $s6, 0($s3)
	lw $s7, 28($s6)
	move $a0, $s3
	move $a1, $s5
	jalr $s7
	move $s6, $v0
	move $a0, $s6
	jal _print
	li $s5, 10000000
	move $a0, $s5
	jal _print
	li $s5, 16
	move $a0, $s5
	jal _halloc
	move $s6, $v0
	li $s5, 24
	move $a0, $s5
	jal _halloc
	move $s7, $v0
	la $s5, Element_GetAge
	sw $s5, 4($s7)
	la $s5, Element_Compare
	sw $s5, 12($s7)
	la $s5, Element_Init
	sw $s5, 0($s7)
	la $s5, Element_GetMarried
	sw $s5, 16($s7)
	la $s5, Element_GetSalary
	sw $s5, 20($s7)
	la $s5, Element_Equal
	sw $s5, 8($s7)
	sw $s7, 0($s6)
	move $s2, $s6
	lw $s5, 0($s2)
	lw $s6, 0($s5)
	li $s5, 28
	li $s7, 35000
	li $t0, 0
	sw $t1, -44($fp)
	move $a0, $s2
	move $a1, $s5
	move $a2, $s7
	move $a3, $t0
	jalr $s6
	lw $t1, -44($fp)
	move $t1, $v0
	lw $s5, 0($s3)
	lw $s6, 36($s5)
	move $a0, $s3
	move $a1, $s2
	jalr $s6
	move $s5, $v0
	move $s3, $s5
	lw $s5, 0($s3)
	lw $s6, 20($s5)
	move $a0, $s3
	jalr $s6
	move $s5, $v0
	li $s5, 2220000
	move $a0, $s5
	jal _print
	lw $s5, 0($s3)
	lw $s6, 24($s5)
	move $a0, $s3
	move $a1, $s4
	jalr $s6
	move $s5, $v0
	move $s3, $s5
	lw $s4, 0($s3)
	lw $s5, 20($s4)
	move $a0, $s3
	jalr $s5
	move $s4, $v0
	li $s4, 33300000
	move $a0, $s4
	jal _print
	lw $s4, 0($s3)
	lw $s5, 24($s4)
	move $a0, $s3
	move $a1, $s2
	jalr $s5
	move $s4, $v0
	move $s3, $s4
	lw $s2, 0($s3)
	lw $s4, 20($s2)
	move $a0, $s3
	jalr $s4
	move $s2, $v0
	li $s2, 44440000
	move $a0, $s2
	jal _print
	li $s2, 0
	move $v0, $s2
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s5, -32($fp)
	lw $s6, -36($fp)
	lw $s7, -40($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	addu $sp, $sp, 68
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
