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
	sw $s2, 12($s3)
	sw $s1, 4($s3)
	sw $s0, 8($s3)
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
	lw $s0, 12($s0)
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
	lw $s0, 4($s0)
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
	lw $s0, 8($s0)
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
	subu $sp, $sp, 44
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
	lw $s3, 0($s0)
	lw $s3, 4($s3)
	move $a0, $s0
	jalr $s3
	move $s3, $v0
	move $s4, $s1
	lw $s5, 0($s4)
	lw $s5, 12($s5)
	lw $s6, 12($s1)
	move $a0, $s4
	move $a1, $s3
	move $a2, $s6
	jalr $s5
	move $s6, $v0
	xori $s6, $s6, 1
	beqz $s6, L1
	li $s6, 0
	move $s2, $s6
	b L0
L1:
	nop
	lw $s6, 0($s0)
	lw $s6, 20($s6)
	move $a0, $s0
	jalr $s6
	move $s6, $v0
	move $s5, $s1
	lw $s4, 0($s5)
	lw $s4, 12($s4)
	lw $s3, 4($s1)
	move $a0, $s5
	move $a1, $s6
	move $a2, $s3
	jalr $s4
	move $s3, $v0
	xori $s3, $s3, 1
	beqz $s3, L3
	li $s3, 0
	move $s2, $s3
	b L2
L3:
	nop
	lw $s1, 8($s1)
	beqz $s1, L5
	lw $s1, 0($s0)
	lw $s1, 16($s1)
	move $a0, $s0
	jalr $s1
	move $s1, $v0
	xori $s1, $s1, 1
	beqz $s1, L7
	li $s1, 0
	move $s2, $s1
	b L6
L7:
	nop
	li $s1, 0
L6:
	nop
	b L4
L5:
	nop
	lw $s3, 0($s0)
	lw $s3, 16($s3)
	move $a0, $s0
	jalr $s3
	move $s3, $v0
	beqz $s3, L9
	li $s3, 0
	move $s2, $s3
	b L8
L9:
	nop
	li $s3, 0
	move $s1, $s3
L8:
	nop
L4:
	nop
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
	lw $s5, -32($fp)
	lw $s6, -36($fp)
	addu $sp, $sp, 44
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
	sle $s4, $s1, $s0
	beqz $s4, L11
	xor $s0, $s1, $s0
	beqz $s0, L11
	li $s0, 0
	move $s2, $s0
	b L10
L11:
	nop
	li $s0, 1
	sub $s0, $s3, $s0
	sle $s0, $s1, $s0
	xori $s0, $s0, 1
	beqz $s0, L13
	li $s0, 0
	move $s2, $s0
	b L12
L13:
	nop
	li $s0, 1
	move $s2, $s0
L12:
	nop
L10:
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
	subu $sp, $sp, 40
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	move $s0, $a1
	move $s1, $a0
	li $s2, 16
	move $a0, $s2
	jal _halloc
	move $s2, $v0
	li $s3, 40
	move $a0, $s3
	jal _halloc
	move $s3, $v0
	la $s4, List_Delete
	sw $s4, 24($s3)
	la $s4, List_Search
	sw $s4, 28($s3)
	la $s4, List_Insert
	sw $s4, 36($s3)
	la $s4, List_InitNew
	sw $s4, 16($s3)
	la $s4, List_SetNext
	sw $s4, 8($s3)
	la $s4, List_Init
	sw $s4, 0($s3)
	la $s4, List_GetNext
	sw $s4, 12($s3)
	la $s4, List_GetEnd
	sw $s4, 32($s3)
	la $s4, List_Print
	sw $s4, 20($s3)
	la $s4, List_GetElem
	sw $s4, 4($s3)
	sw $s3, 0($s2)
	lw $s3, 0($s2)
	lw $s3, 16($s3)
	li $s4, 0
	move $a0, $s2
	move $a1, $s0
	move $a2, $s1
	move $a3, $s4
	jalr $s3
	move $s4, $v0
	move $v0, $s2
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	addu $sp, $sp, 40
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
	subu $sp, $sp, 52
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
L14:
	nop
	xori $t0, $s7, 1
	beqz $t0, L15
	xori $t0, $s3, 1
	beqz $t0, L15
	lw $t0, 0($s0)
	lw $t0, 8($t0)
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	move $a0, $s0
	move $a1, $s1
	jalr $t0
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	move $t0, $v0
	beqz $t0, L17
	li $t0, 1
	move $s3, $t0
	li $t0, 0
	sle $t0, $s5, $t0
	beqz $t0, L19
	li $t0, 0
	xor $t0, $s5, $t0
	beqz $t0, L19
	lw $t0, 0($s4)
	lw $t0, 12($t0)
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	move $a0, $s4
	jalr $t0
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	move $t0, $v0
	move $s2, $t0
	b L18
L19:
	nop
	li $t0, 0
	li $t1, 555
	sub $t1, $t0, $t1
	move $a0, $t1
	jal _print
	lw $t1, 0($s6)
	lw $t1, 8($t1)
	lw $t0, 0($s4)
	lw $t0, 12($t0)
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	move $a0, $s4
	jalr $t0
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	move $t0, $v0
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	move $a0, $s6
	move $a1, $t0
	jalr $t1
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	move $t0, $v0
	li $t0, 0
	li $t1, 555
	sub $t1, $t0, $t1
	move $a0, $t1
	jal _print
L18:
	nop
	b L16
L17:
	nop
	li $t1, 0
L16:
	nop
	xori $t0, $s3, 1
	beqz $t0, L21
	move $s6, $s4
	lw $t0, 0($s4)
	lw $t0, 12($t0)
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	move $a0, $s4
	jalr $t0
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	move $t0, $v0
	move $s4, $t0
	lw $t0, 0($s4)
	lw $t0, 32($t0)
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	move $a0, $s4
	jalr $t0
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	move $t0, $v0
	move $s7, $t0
	lw $t0, 0($s4)
	lw $t0, 4($t0)
	sw $t0, -44($fp)
	sw $t1, -48($fp)
	move $a0, $s4
	jalr $t0
	lw $t0, -44($fp)
	lw $t1, -48($fp)
	move $t0, $v0
	move $s1, $t0
	li $t0, 1
	move $s5, $t0
	b L20
L21:
	nop
	li $t0, 0
	move $t1, $t0
L20:
	nop
	b L14
L15:
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
	addu $sp, $sp, 52
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl List_Search
List_Search:
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
	li $s2, 0
	move $s3, $s1
	lw $s4, 12($s1)
	lw $s1, 4($s1)
L22:
	nop
	xori $s5, $s4, 1
	beqz $s5, L23
	lw $s5, 0($s0)
	lw $s5, 8($s5)
	move $a0, $s0
	move $a1, $s1
	jalr $s5
	move $s5, $v0
	beqz $s5, L25
	li $s5, 1
	move $s2, $s5
	b L24
L25:
	nop
	li $s5, 0
L24:
	nop
	lw $s5, 0($s3)
	lw $s5, 12($s5)
	move $a0, $s3
	jalr $s5
	move $s5, $v0
	move $s3, $s5
	lw $s5, 0($s3)
	lw $s5, 32($s5)
	move $a0, $s3
	jalr $s5
	move $s5, $v0
	move $s4, $s5
	lw $s5, 0($s3)
	lw $s5, 4($s5)
	move $a0, $s3
	jalr $s5
	move $s5, $v0
	move $s1, $s5
	b L22
L23:
	nop
	move $v0, $s2
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
	subu $sp, $sp, 24
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	sw $s3, -24($fp)
	move $s0, $a0
	move $s1, $s0
	lw $s2, 12($s0)
	lw $s0, 4($s0)
L26:
	nop
	xori $s3, $s2, 1
	beqz $s3, L27
	lw $s3, 0($s0)
	lw $s3, 4($s3)
	move $a0, $s0
	jalr $s3
	move $s3, $v0
	move $a0, $s3
	jal _print
	lw $s3, 0($s1)
	lw $s3, 12($s3)
	move $a0, $s1
	jalr $s3
	move $s3, $v0
	move $s1, $s3
	lw $s3, 0($s1)
	lw $s3, 32($s3)
	move $a0, $s1
	jalr $s3
	move $s3, $v0
	move $s2, $s3
	lw $s3, 0($s1)
	lw $s3, 4($s3)
	move $a0, $s1
	jalr $s3
	move $s3, $v0
	move $s0, $s3
	b L26
L27:
	nop
	li $s0, 1
	move $v0, $s0
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	lw $s3, -24($fp)
	addu $sp, $sp, 24
	lw $ra, -4($sp)
	lw $fp, -8($sp)
	jr $ra
	.text
	.globl LL_Start
LL_Start:
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
	li $s0, 16
	move $a0, $s0
	jal _halloc
	move $s0, $v0
	li $s1, 40
	move $a0, $s1
	jal _halloc
	move $s1, $v0
	la $s2, List_Delete
	sw $s2, 24($s1)
	la $s2, List_Search
	sw $s2, 28($s1)
	la $s2, List_Insert
	sw $s2, 36($s1)
	la $s2, List_InitNew
	sw $s2, 16($s1)
	la $s2, List_SetNext
	sw $s2, 8($s1)
	la $s2, List_Init
	sw $s2, 0($s1)
	la $s2, List_GetNext
	sw $s2, 12($s1)
	la $s2, List_GetEnd
	sw $s2, 32($s1)
	la $s2, List_Print
	sw $s2, 20($s1)
	la $s2, List_GetElem
	sw $s2, 4($s1)
	sw $s1, 0($s0)
	lw $s1, 0($s0)
	lw $s1, 0($s1)
	sw $t0, -44($fp)
	move $a0, $s0
	jalr $s1
	lw $t0, -44($fp)
	move $s1, $v0
	lw $s2, 0($s0)
	lw $s2, 0($s2)
	sw $t0, -44($fp)
	move $a0, $s0
	jalr $s2
	lw $t0, -44($fp)
	move $s2, $v0
	move $s1, $s2
	lw $s2, 0($s0)
	lw $s2, 20($s2)
	sw $t0, -44($fp)
	move $a0, $s0
	jalr $s2
	lw $t0, -44($fp)
	move $s2, $v0
	move $s1, $s2
	li $s2, 16
	move $a0, $s2
	jal _halloc
	move $s2, $v0
	li $s3, 24
	move $a0, $s3
	jal _halloc
	move $s3, $v0
	la $s4, Element_GetAge
	sw $s4, 4($s3)
	la $s4, Element_Compare
	sw $s4, 12($s3)
	la $s4, Element_Init
	sw $s4, 0($s3)
	la $s4, Element_GetMarried
	sw $s4, 16($s3)
	la $s4, Element_GetSalary
	sw $s4, 20($s3)
	la $s4, Element_Equal
	sw $s4, 8($s3)
	sw $s3, 0($s2)
	lw $s3, 0($s2)
	lw $s3, 0($s3)
	li $s4, 25
	li $s5, 37000
	li $s6, 0
	sw $t0, -44($fp)
	move $a0, $s2
	move $a1, $s4
	move $a2, $s5
	move $a3, $s6
	jalr $s3
	lw $t0, -44($fp)
	move $s6, $v0
	move $s1, $s6
	lw $s6, 0($s0)
	lw $s6, 36($s6)
	sw $t0, -44($fp)
	move $a0, $s0
	move $a1, $s2
	jalr $s6
	lw $t0, -44($fp)
	move $s6, $v0
	move $s0, $s6
	lw $s6, 0($s0)
	lw $s6, 20($s6)
	sw $t0, -44($fp)
	move $a0, $s0
	jalr $s6
	lw $t0, -44($fp)
	move $s6, $v0
	move $s1, $s6
	li $s6, 10000000
	move $a0, $s6
	jal _print
	li $s6, 16
	move $a0, $s6
	jal _halloc
	move $s6, $v0
	li $s5, 24
	move $a0, $s5
	jal _halloc
	move $s5, $v0
	la $s4, Element_GetAge
	sw $s4, 4($s5)
	la $s4, Element_Compare
	sw $s4, 12($s5)
	la $s4, Element_Init
	sw $s4, 0($s5)
	la $s4, Element_GetMarried
	sw $s4, 16($s5)
	la $s4, Element_GetSalary
	sw $s4, 20($s5)
	la $s4, Element_Equal
	sw $s4, 8($s5)
	sw $s5, 0($s6)
	move $s2, $s6
	lw $s6, 0($s2)
	lw $s6, 0($s6)
	li $s5, 39
	li $s4, 42000
	li $s3, 1
	sw $t0, -44($fp)
	move $a0, $s2
	move $a1, $s5
	move $a2, $s4
	move $a3, $s3
	jalr $s6
	lw $t0, -44($fp)
	move $s3, $v0
	move $s1, $s3
	move $s3, $s2
	lw $s4, 0($s0)
	lw $s4, 36($s4)
	sw $t0, -44($fp)
	move $a0, $s0
	move $a1, $s2
	jalr $s4
	lw $t0, -44($fp)
	move $s4, $v0
	move $s0, $s4
	lw $s4, 0($s0)
	lw $s4, 20($s4)
	sw $t0, -44($fp)
	move $a0, $s0
	jalr $s4
	lw $t0, -44($fp)
	move $s4, $v0
	move $s1, $s4
	li $s4, 10000000
	move $a0, $s4
	jal _print
	li $s4, 16
	move $a0, $s4
	jal _halloc
	move $s4, $v0
	li $s5, 24
	move $a0, $s5
	jal _halloc
	move $s5, $v0
	la $s6, Element_GetAge
	sw $s6, 4($s5)
	la $s6, Element_Compare
	sw $s6, 12($s5)
	la $s6, Element_Init
	sw $s6, 0($s5)
	la $s6, Element_GetMarried
	sw $s6, 16($s5)
	la $s6, Element_GetSalary
	sw $s6, 20($s5)
	la $s6, Element_Equal
	sw $s6, 8($s5)
	sw $s5, 0($s4)
	move $s2, $s4
	lw $s4, 0($s2)
	lw $s4, 0($s4)
	li $s5, 22
	li $s6, 34000
	li $s7, 0
	sw $t0, -44($fp)
	move $a0, $s2
	move $a1, $s5
	move $a2, $s6
	move $a3, $s7
	jalr $s4
	lw $t0, -44($fp)
	move $s7, $v0
	move $s1, $s7
	lw $s7, 0($s0)
	lw $s7, 36($s7)
	sw $t0, -44($fp)
	move $a0, $s0
	move $a1, $s2
	jalr $s7
	lw $t0, -44($fp)
	move $s7, $v0
	move $s0, $s7
	lw $s7, 0($s0)
	lw $s7, 20($s7)
	sw $t0, -44($fp)
	move $a0, $s0
	jalr $s7
	lw $t0, -44($fp)
	move $s7, $v0
	move $s1, $s7
	li $s7, 16
	move $a0, $s7
	jal _halloc
	move $s7, $v0
	li $s6, 24
	move $a0, $s6
	jal _halloc
	move $s6, $v0
	la $s5, Element_GetAge
	sw $s5, 4($s6)
	la $s5, Element_Compare
	sw $s5, 12($s6)
	la $s5, Element_Init
	sw $s5, 0($s6)
	la $s5, Element_GetMarried
	sw $s5, 16($s6)
	la $s5, Element_GetSalary
	sw $s5, 20($s6)
	la $s5, Element_Equal
	sw $s5, 8($s6)
	sw $s6, 0($s7)
	lw $s6, 0($s7)
	lw $s6, 0($s6)
	li $s5, 27
	li $s4, 34000
	li $t0, 0
	sw $t0, -44($fp)
	move $a0, $s7
	move $a1, $s5
	move $a2, $s4
	move $a3, $t0
	jalr $s6
	lw $t0, -44($fp)
	move $t0, $v0
	move $s1, $t0
	lw $t0, 0($s0)
	lw $t0, 28($t0)
	sw $t0, -44($fp)
	move $a0, $s0
	move $a1, $s3
	jalr $t0
	lw $t0, -44($fp)
	move $t0, $v0
	move $a0, $t0
	jal _print
	lw $t0, 0($s0)
	lw $t0, 28($t0)
	sw $t0, -44($fp)
	move $a0, $s0
	move $a1, $s7
	jalr $t0
	lw $t0, -44($fp)
	move $t0, $v0
	move $a0, $t0
	jal _print
	li $t0, 10000000
	move $a0, $t0
	jal _print
	li $t0, 16
	move $a0, $t0
	jal _halloc
	move $t0, $v0
	li $s7, 24
	move $a0, $s7
	jal _halloc
	move $s7, $v0
	la $s4, Element_GetAge
	sw $s4, 4($s7)
	la $s4, Element_Compare
	sw $s4, 12($s7)
	la $s4, Element_Init
	sw $s4, 0($s7)
	la $s4, Element_GetMarried
	sw $s4, 16($s7)
	la $s4, Element_GetSalary
	sw $s4, 20($s7)
	la $s4, Element_Equal
	sw $s4, 8($s7)
	sw $s7, 0($t0)
	move $s2, $t0
	lw $t0, 0($s2)
	lw $t0, 0($t0)
	li $s7, 28
	li $s4, 35000
	li $s5, 0
	sw $t0, -44($fp)
	move $a0, $s2
	move $a1, $s7
	move $a2, $s4
	move $a3, $s5
	jalr $t0
	lw $t0, -44($fp)
	move $s5, $v0
	move $s1, $s5
	lw $s5, 0($s0)
	lw $s5, 36($s5)
	sw $t0, -44($fp)
	move $a0, $s0
	move $a1, $s2
	jalr $s5
	lw $t0, -44($fp)
	move $s5, $v0
	move $s0, $s5
	lw $s5, 0($s0)
	lw $s5, 20($s5)
	sw $t0, -44($fp)
	move $a0, $s0
	jalr $s5
	lw $t0, -44($fp)
	move $s5, $v0
	move $s1, $s5
	li $s5, 2220000
	move $a0, $s5
	jal _print
	lw $s5, 0($s0)
	lw $s5, 24($s5)
	sw $t0, -44($fp)
	move $a0, $s0
	move $a1, $s3
	jalr $s5
	lw $t0, -44($fp)
	move $s5, $v0
	move $s0, $s5
	lw $s5, 0($s0)
	lw $s5, 20($s5)
	sw $t0, -44($fp)
	move $a0, $s0
	jalr $s5
	lw $t0, -44($fp)
	move $s5, $v0
	move $s1, $s5
	li $s5, 33300000
	move $a0, $s5
	jal _print
	lw $s5, 0($s0)
	lw $s5, 24($s5)
	sw $t0, -44($fp)
	move $a0, $s0
	move $a1, $s2
	jalr $s5
	lw $t0, -44($fp)
	move $s5, $v0
	move $s0, $s5
	lw $s5, 0($s0)
	lw $s5, 20($s5)
	sw $t0, -44($fp)
	move $a0, $s0
	jalr $s5
	lw $t0, -44($fp)
	move $s5, $v0
	move $s1, $s5
	li $s5, 44440000
	move $a0, $s5
	jal _print
	li $s5, 0
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
