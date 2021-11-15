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
	la $s2, LL_Start
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
	.globl Element_Init
Element_Init:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 20
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	sw $s3, -24($fp)
	move $s0, $a3
	move $s1, $a2
	move $s2, $a1
	move $s3, $a0
	sw $s2, 4($s3)
	sw $s1, 8($s3)
	sw $s0, 12($s3)
	li $s3, 1
	move $v0, $s3
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	lw $s3, -24($fp)
	addu $sp, $sp, 20
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Element_GetAge
Element_GetAge:
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
	.globl Element_GetSalary
Element_GetSalary:
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
	.globl Element_GetMarried
Element_GetMarried:
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
	.globl Element_Equal
Element_Equal:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 48
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
	li $s2, 1
	move $s3, $s0
	lw $s4, 0($s3)
	lw $s4, 4($s4)
	move $a0, $s3
	jalr $s4
	move $s4, $v0
	li $s3, 1
	move $s5, $s1
	lw $s6, 0($s5)
	lw $s6, 20($s6)
	lw $s7, 4($s1)
	move $a0, $s5
	move $a1, $s4
	move $a2, $s7
	jalr $s6
	move $s7, $v0
	sub $s7, $s3, $s7
	beqz $s7, L2
	li $s7, 0
	move $s2, $s7
	b L3
L2:
	move $s7, $s0
	lw $s3, 0($s7)
	lw $s3, 8($s3)
	move $a0, $s7
	jalr $s3
	move $s3, $v0
	li $s7, 1
	move $s6, $s1
	lw $s5, 0($s6)
	lw $s5, 20($s5)
	lw $s4, 8($s1)
	move $a0, $s6
	move $a1, $s3
	move $a2, $s4
	jalr $s5
	move $s4, $v0
	sub $s4, $s7, $s4
	beqz $s4, L4
	li $s4, 0
	move $s2, $s4
	b L5
L4:
	lw $s1, 12($s1)
	beqz $s1, L6
	li $s1, 1
	move $s4, $s0
	lw $s7, 0($s4)
	lw $s7, 12($s7)
	move $a0, $s4
	jalr $s7
	move $s7, $v0
	sub $s7, $s1, $s7
	beqz $s7, L8
	li $s7, 0
	move $s2, $s7
	b L9
L8:
	li $s7, 0
L9:
	nop
	b L7
L6:
	lw $s1, 0($s0)
	lw $s1, 12($s1)
	move $a0, $s0
	jalr $s1
	move $s1, $v0
	beqz $s1, L10
	li $s1, 0
	move $s2, $s1
	b L11
L10:
	li $s1, 0
	move $s7, $s1
L11:
	nop
L7:
	nop
L5:
	nop
L3:
	nop
	move $v0, $s2
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s5, -32($fp)
	lw $s6, -36($fp)
	lw $s7, -40($fp)
	addu $sp, $sp, 48
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl Element_Compare
Element_Compare:
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
	beqz $s4, L12
	li $s4, 0
	move $s2, $s4
	b L13
L12:
	li $s4, 1
	li $s0, 1
	sub $s0, $s3, $s0
	sle $s0, $s1, $s0
	sub $s0, $s4, $s0
	beqz $s0, L14
	li $s0, 0
	move $s2, $s0
	b L15
L14:
	li $s0, 1
	move $s2, $s0
L15:
	nop
L13:
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
	.globl List_Init
List_Init:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 12
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	move $s0, $a0
	li $s1, 1
	sw $s1, 12($s0)
	li $s1, 1
	move $v0, $s1
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	addu $sp, $sp, 12
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl List_InitNew
List_InitNew:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 20
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	sw $s3, -24($fp)
	move $s0, $a3
	move $s1, $a2
	move $s2, $a1
	move $s3, $a0
	sw $s0, 12($s3)
	sw $s2, 4($s3)
	sw $s1, 8($s3)
	li $s3, 1
	move $v0, $s3
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	lw $s3, -24($fp)
	addu $sp, $sp, 20
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl List_Insert
List_Insert:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 48
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	sw $s5, -32($fp)
	sw $s6, -36($fp)
	move $s0, $a1
	move $s1, $a0
	li $s2, 40
	move $a0, $s2
	jal _halloc
	move $s2, $v0
	li $s3, 16
	move $a0, $s3
	jal _halloc
	move $s3, $v0
	la $s4, List_Print
	sw $s4, 36($s2)
	la $s4, List_GetNext
	sw $s4, 32($s2)
	la $s4, List_GetElem
	sw $s4, 28($s2)
	la $s4, List_GetEnd
	sw $s4, 24($s2)
	la $s4, List_Search
	sw $s4, 20($s2)
	la $s4, List_Delete
	sw $s4, 16($s2)
	la $s4, List_SetNext
	sw $s4, 12($s2)
	la $s4, List_Insert
	sw $s4, 8($s2)
	la $s4, List_InitNew
	sw $s4, 4($s2)
	la $s4, List_Init
	sw $s4, 0($s2)
	li $s4, 4
L16:
	li $s5, 15
	sle $s5, $s4, $s5
	beqz $s5, L17
	add $s5, $s3, $s4
	li $s6, 0
	sw $s6, 0($s5)
	li $s6, 4
	add $s6, $s4, $s6
	move $s4, $s6
	b L16
L17:
	sw $s2, 0($s3)
	move $s2, $s3
	lw $s4, 0($s2)
	lw $s4, 4($s4)
	li $s6, 0
	move $a0, $s2
	move $a1, $s0
	move $a2, $s1
	move $a3, $s6
	jalr $s4
	move $s6, $v0
	move $v0, $s3
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s5, -32($fp)
	lw $s6, -36($fp)
	addu $sp, $sp, 48
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl List_SetNext
List_SetNext:
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
	.globl List_Delete
List_Delete:
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
	li $s3, 0
	li $s4, 0
	li $s5, 1
	sub $s5, $s4, $s5
	move $s4, $s1
	move $s6, $s1
	lw $s7, 12($s1)
	lw $s1, 4($s1)
L18:
	li $t0, 0
	li $t1, 1
	sub $t1, $t1, $s7
	beqz $t1, L20
	li $t1, 1
	sub $t1, $t1, $s3
	beqz $t1, L20
	li $t1, 1
	move $t0, $t1
L20:
	nop
	beqz $t0, L19
	move $t0, $s0
	lw $t1, 0($t0)
	lw $t1, 16($t1)
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	sw $t2, -52($fp)
	sw $t3, -56($fp)
	move $a0, $t0
	move $a1, $s1
	jalr $t1
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	lw $t2, -52($fp)
	lw $t3, -56($fp)
	move $t1, $v0
	beqz $t1, L21
	li $t1, 1
	move $s3, $t1
	li $t1, 0
	li $t0, 1
	sub $t0, $t1, $t0
	sle $t0, $s5, $t0
	beqz $t0, L23
	move $t0, $s4
	lw $t1, 0($t0)
	lw $t1, 32($t1)
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	sw $t2, -52($fp)
	sw $t3, -56($fp)
	move $a0, $t0
	jalr $t1
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	lw $t2, -52($fp)
	lw $t3, -56($fp)
	move $t1, $v0
	move $s2, $t1
	b L24
L23:
	li $t1, 0
	li $t0, 555
	sub $t0, $t1, $t0
	move $a0, $t0
	jal _print
	move $t0, $s6
	lw $t1, 0($t0)
	lw $t1, 12($t1)
	move $t2, $s4
	lw $t3, 0($t2)
	lw $t3, 32($t3)
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	sw $t2, -52($fp)
	sw $t3, -56($fp)
	move $a0, $t2
	jalr $t3
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	lw $t2, -52($fp)
	lw $t3, -56($fp)
	move $t3, $v0
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	sw $t2, -52($fp)
	sw $t3, -56($fp)
	move $a0, $t0
	move $a1, $t3
	jalr $t1
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	lw $t2, -52($fp)
	lw $t3, -56($fp)
	move $t3, $v0
	li $t3, 0
	li $t1, 555
	sub $t1, $t3, $t1
	move $a0, $t1
	jal _print
L24:
	nop
	b L22
L21:
	li $t1, 0
L22:
	nop
	li $t3, 1
	sub $t3, $t3, $s3
	beqz $t3, L25
	move $s6, $s4
	move $t3, $s4
	lw $t0, 0($t3)
	lw $t0, 32($t0)
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	sw $t2, -52($fp)
	sw $t3, -56($fp)
	move $a0, $t3
	jalr $t0
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	lw $t2, -52($fp)
	lw $t3, -56($fp)
	move $t0, $v0
	move $s4, $t0
	move $t0, $s4
	lw $t3, 0($t0)
	lw $t3, 24($t3)
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	sw $t2, -52($fp)
	sw $t3, -56($fp)
	move $a0, $t0
	jalr $t3
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	lw $t2, -52($fp)
	lw $t3, -56($fp)
	move $t3, $v0
	move $s7, $t3
	move $t3, $s4
	lw $t0, 0($t3)
	lw $t0, 28($t0)
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	sw $t2, -52($fp)
	sw $t3, -56($fp)
	move $a0, $t3
	jalr $t0
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	lw $t2, -52($fp)
	lw $t3, -56($fp)
	move $t0, $v0
	move $s1, $t0
	li $t0, 1
	move $s5, $t0
	b L26
L25:
	li $t0, 0
	move $t1, $t0
L26:
	nop
	b L18
L19:
	nop
	move $v0, $s2
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
	.globl List_Search
List_Search:
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
	li $s2, 0
	move $s3, $s1
	lw $s4, 12($s1)
	lw $s1, 4($s1)
L27:
	li $s5, 1
	sub $s5, $s5, $s4
	beqz $s5, L28
	move $s5, $s0
	lw $s6, 0($s5)
	lw $s6, 16($s6)
	move $a0, $s5
	move $a1, $s1
	jalr $s6
	move $s6, $v0
	beqz $s6, L29
	li $s6, 1
	move $s2, $s6
	b L30
L29:
	li $s6, 0
L30:
	nop
	move $s6, $s3
	lw $s5, 0($s6)
	lw $s5, 32($s5)
	move $a0, $s6
	jalr $s5
	move $s5, $v0
	move $s3, $s5
	move $s5, $s3
	lw $s6, 0($s5)
	lw $s6, 24($s6)
	move $a0, $s5
	jalr $s6
	move $s6, $v0
	move $s4, $s6
	move $s6, $s3
	lw $s5, 0($s6)
	lw $s5, 28($s5)
	move $a0, $s6
	jalr $s5
	move $s5, $v0
	move $s1, $s5
	b L27
L28:
	nop
	move $v0, $s2
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
	.globl List_GetEnd
List_GetEnd:
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
	.globl List_GetElem
List_GetElem:
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
	.globl List_GetNext
List_GetNext:
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
	.globl List_Print
List_Print:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($sp)
	subu $sp, $sp, 28
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	move $s0, $a0
	move $s1, $s0
	lw $s2, 12($s0)
	lw $s0, 4($s0)
L31:
	li $s3, 1
	sub $s3, $s3, $s2
	beqz $s3, L32
	move $s3, $s0
	lw $s4, 0($s3)
	lw $s4, 4($s4)
	move $a0, $s3
	jalr $s4
	move $s4, $v0
	move $a0, $s4
	jal _print
	move $s4, $s1
	lw $s3, 0($s4)
	lw $s3, 32($s3)
	move $a0, $s4
	jalr $s3
	move $s3, $v0
	move $s1, $s3
	move $s3, $s1
	lw $s4, 0($s3)
	lw $s4, 24($s4)
	move $a0, $s3
	jalr $s4
	move $s4, $v0
	move $s2, $s4
	move $s4, $s1
	lw $s3, 0($s4)
	lw $s3, 28($s3)
	move $a0, $s4
	jalr $s3
	move $s3, $v0
	move $s0, $s3
	b L31
L32:
	nop
	li $s0, 1
	move $v0, $s0
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	addu $sp, $sp, 28
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl LL_Start
LL_Start:
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
	li $s0, 40
	move $a0, $s0
	jal _halloc
	move $s0, $v0
	li $s1, 16
	move $a0, $s1
	jal _halloc
	move $s1, $v0
	la $s2, List_Print
	sw $s2, 36($s0)
	la $s2, List_GetNext
	sw $s2, 32($s0)
	la $s2, List_GetElem
	sw $s2, 28($s0)
	la $s2, List_GetEnd
	sw $s2, 24($s0)
	la $s2, List_Search
	sw $s2, 20($s0)
	la $s2, List_Delete
	sw $s2, 16($s0)
	la $s2, List_SetNext
	sw $s2, 12($s0)
	la $s2, List_Insert
	sw $s2, 8($s0)
	la $s2, List_InitNew
	sw $s2, 4($s0)
	la $s2, List_Init
	sw $s2, 0($s0)
	li $s2, 4
L33:
	li $s3, 15
	sle $s3, $s2, $s3
	beqz $s3, L34
	add $s3, $s1, $s2
	li $s4, 0
	sw $s4, 0($s3)
	li $s4, 4
	add $s4, $s2, $s4
	move $s2, $s4
	b L33
L34:
	sw $s0, 0($s1)
	move $s0, $s1
	lw $s2, 0($s0)
	lw $s2, 0($s2)
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	move $a0, $s0
	jalr $s2
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	move $s2, $v0
	move $s0, $s1
	lw $s4, 0($s0)
	lw $s4, 0($s4)
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	move $a0, $s0
	jalr $s4
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	move $s4, $v0
	move $s2, $s4
	move $s4, $s1
	lw $s0, 0($s4)
	lw $s0, 36($s0)
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	move $a0, $s4
	jalr $s0
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	move $s0, $v0
	move $s2, $s0
	li $s0, 24
	move $a0, $s0
	jal _halloc
	move $s0, $v0
	li $s4, 16
	move $a0, $s4
	jal _halloc
	move $s4, $v0
	la $s3, Element_Compare
	sw $s3, 20($s0)
	la $s3, Element_Equal
	sw $s3, 16($s0)
	la $s3, Element_GetMarried
	sw $s3, 12($s0)
	la $s3, Element_GetSalary
	sw $s3, 8($s0)
	la $s3, Element_GetAge
	sw $s3, 4($s0)
	la $s3, Element_Init
	sw $s3, 0($s0)
	li $s3, 4
L35:
	li $s5, 15
	sle $s5, $s3, $s5
	beqz $s5, L36
	add $s5, $s4, $s3
	li $s6, 0
	sw $s6, 0($s5)
	li $s6, 4
	add $s6, $s3, $s6
	move $s3, $s6
	b L35
L36:
	sw $s0, 0($s4)
	move $s0, $s4
	lw $s3, 0($s0)
	lw $s3, 0($s3)
	li $s6, 25
	li $s5, 37000
	li $s7, 0
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	move $a0, $s0
	move $a1, $s6
	move $a2, $s5
	move $a3, $s7
	jalr $s3
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	move $s7, $v0
	move $s2, $s7
	move $s7, $s1
	lw $s5, 0($s7)
	lw $s5, 8($s5)
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	move $a0, $s7
	move $a1, $s4
	jalr $s5
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	move $s5, $v0
	move $s1, $s5
	move $s5, $s1
	lw $s7, 0($s5)
	lw $s7, 36($s7)
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	move $a0, $s5
	jalr $s7
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	move $s7, $v0
	move $s2, $s7
	li $s7, 10000000
	move $a0, $s7
	jal _print
	li $s7, 24
	move $a0, $s7
	jal _halloc
	move $s7, $v0
	li $s5, 16
	move $a0, $s5
	jal _halloc
	move $s5, $v0
	la $s6, Element_Compare
	sw $s6, 20($s7)
	la $s6, Element_Equal
	sw $s6, 16($s7)
	la $s6, Element_GetMarried
	sw $s6, 12($s7)
	la $s6, Element_GetSalary
	sw $s6, 8($s7)
	la $s6, Element_GetAge
	sw $s6, 4($s7)
	la $s6, Element_Init
	sw $s6, 0($s7)
	li $s6, 4
L37:
	li $s3, 15
	sle $s3, $s6, $s3
	beqz $s3, L38
	add $s3, $s5, $s6
	li $s0, 0
	sw $s0, 0($s3)
	li $s0, 4
	add $s0, $s6, $s0
	move $s6, $s0
	b L37
L38:
	sw $s7, 0($s5)
	move $s4, $s5
	move $s5, $s4
	lw $s7, 0($s5)
	lw $s7, 0($s7)
	li $s6, 39
	li $s0, 42000
	li $s3, 1
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	move $a0, $s5
	move $a1, $s6
	move $a2, $s0
	move $a3, $s3
	jalr $s7
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	move $s3, $v0
	move $s2, $s3
	move $s3, $s4
	move $s0, $s1
	lw $s6, 0($s0)
	lw $s6, 8($s6)
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	move $a0, $s0
	move $a1, $s4
	jalr $s6
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	move $s6, $v0
	move $s1, $s6
	move $s6, $s1
	lw $s0, 0($s6)
	lw $s0, 36($s0)
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	move $a0, $s6
	jalr $s0
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	move $s0, $v0
	move $s2, $s0
	li $s0, 10000000
	move $a0, $s0
	jal _print
	li $s0, 24
	move $a0, $s0
	jal _halloc
	move $s0, $v0
	li $s6, 16
	move $a0, $s6
	jal _halloc
	move $s6, $v0
	la $s7, Element_Compare
	sw $s7, 20($s0)
	la $s7, Element_Equal
	sw $s7, 16($s0)
	la $s7, Element_GetMarried
	sw $s7, 12($s0)
	la $s7, Element_GetSalary
	sw $s7, 8($s0)
	la $s7, Element_GetAge
	sw $s7, 4($s0)
	la $s7, Element_Init
	sw $s7, 0($s0)
	li $s7, 4
L39:
	li $s5, 15
	sle $s5, $s7, $s5
	beqz $s5, L40
	add $s5, $s6, $s7
	li $t0, 0
	sw $t0, 0($s5)
	li $t0, 4
	add $t0, $s7, $t0
	move $s7, $t0
	b L39
L40:
	sw $s0, 0($s6)
	move $s4, $s6
	move $s6, $s4
	lw $s0, 0($s6)
	lw $s0, 0($s0)
	li $s7, 22
	li $t0, 34000
	li $s5, 0
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	move $a0, $s6
	move $a1, $s7
	move $a2, $t0
	move $a3, $s5
	jalr $s0
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	move $s5, $v0
	move $s2, $s5
	move $s5, $s1
	lw $t0, 0($s5)
	lw $t0, 8($t0)
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	move $a0, $s5
	move $a1, $s4
	jalr $t0
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	move $t0, $v0
	move $s1, $t0
	move $t0, $s1
	lw $s5, 0($t0)
	lw $s5, 36($s5)
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	move $a0, $t0
	jalr $s5
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	move $s5, $v0
	move $s2, $s5
	li $s5, 24
	move $a0, $s5
	jal _halloc
	move $s5, $v0
	li $t0, 16
	move $a0, $t0
	jal _halloc
	move $t0, $v0
	la $s7, Element_Compare
	sw $s7, 20($s5)
	la $s7, Element_Equal
	sw $s7, 16($s5)
	la $s7, Element_GetMarried
	sw $s7, 12($s5)
	la $s7, Element_GetSalary
	sw $s7, 8($s5)
	la $s7, Element_GetAge
	sw $s7, 4($s5)
	la $s7, Element_Init
	sw $s7, 0($s5)
	li $s7, 4
L41:
	li $s0, 15
	sle $s0, $s7, $s0
	beqz $s0, L42
	add $s0, $t0, $s7
	li $s6, 0
	sw $s6, 0($s0)
	li $s6, 4
	add $s6, $s7, $s6
	move $s7, $s6
	b L41
L42:
	sw $s5, 0($t0)
	move $s5, $t0
	lw $s7, 0($s5)
	lw $s7, 0($s7)
	li $s6, 27
	li $s0, 34000
	li $t1, 0
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	move $a0, $s5
	move $a1, $s6
	move $a2, $s0
	move $a3, $t1
	jalr $s7
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	move $t1, $v0
	move $s2, $t1
	move $t1, $s1
	lw $s0, 0($t1)
	lw $s0, 20($s0)
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	move $a0, $t1
	move $a1, $s3
	jalr $s0
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	move $s0, $v0
	move $a0, $s0
	jal _print
	move $s0, $s1
	lw $t1, 0($s0)
	lw $t1, 20($t1)
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	move $a0, $s0
	move $a1, $t0
	jalr $t1
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	move $t1, $v0
	move $a0, $t1
	jal _print
	li $t1, 10000000
	move $a0, $t1
	jal _print
	li $t1, 24
	move $a0, $t1
	jal _halloc
	move $t1, $v0
	li $s0, 16
	move $a0, $s0
	jal _halloc
	move $s0, $v0
	la $t0, Element_Compare
	sw $t0, 20($t1)
	la $t0, Element_Equal
	sw $t0, 16($t1)
	la $t0, Element_GetMarried
	sw $t0, 12($t1)
	la $t0, Element_GetSalary
	sw $t0, 8($t1)
	la $t0, Element_GetAge
	sw $t0, 4($t1)
	la $t0, Element_Init
	sw $t0, 0($t1)
	li $t0, 4
L43:
	li $s6, 15
	sle $s6, $t0, $s6
	beqz $s6, L44
	add $s6, $s0, $t0
	li $s7, 0
	sw $s7, 0($s6)
	li $s7, 4
	add $s7, $t0, $s7
	move $t0, $s7
	b L43
L44:
	sw $t1, 0($s0)
	move $s4, $s0
	move $s0, $s4
	lw $t1, 0($s0)
	lw $t1, 0($t1)
	li $t0, 28
	li $s7, 35000
	li $s6, 0
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	move $a0, $s0
	move $a1, $t0
	move $a2, $s7
	move $a3, $s6
	jalr $t1
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	move $s6, $v0
	move $s2, $s6
	move $s6, $s1
	lw $s7, 0($s6)
	lw $s7, 8($s7)
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	move $a0, $s6
	move $a1, $s4
	jalr $s7
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	move $s7, $v0
	move $s1, $s7
	move $s7, $s1
	lw $s6, 0($s7)
	lw $s6, 36($s6)
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	move $a0, $s7
	jalr $s6
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	move $s6, $v0
	move $s2, $s6
	li $s6, 2220000
	move $a0, $s6
	jal _print
	move $s6, $s1
	lw $s7, 0($s6)
	lw $s7, 16($s7)
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	move $a0, $s6
	move $a1, $s3
	jalr $s7
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	move $s7, $v0
	move $s1, $s7
	move $s7, $s1
	lw $s6, 0($s7)
	lw $s6, 36($s6)
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	move $a0, $s7
	jalr $s6
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	move $s6, $v0
	move $s2, $s6
	li $s6, 33300000
	move $a0, $s6
	jal _print
	move $s6, $s1
	lw $s7, 0($s6)
	lw $s7, 16($s7)
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	move $a0, $s6
	move $a1, $s4
	jalr $s7
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	move $s7, $v0
	move $s1, $s7
	lw $s7, 0($s1)
	lw $s7, 36($s7)
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	move $a0, $s1
	jalr $s7
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	move $s7, $v0
	move $s2, $s7
	li $s7, 44440000
	move $a0, $s7
	jal _print
	li $s7, 0
	move $v0, $s7
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
