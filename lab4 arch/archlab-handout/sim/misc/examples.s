	.file	"examples.c"
	.intel_syntax noprefix
	.text
	.globl	sum_list
	.type	sum_list, @function
sum_list:
.LFB0:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	QWORD PTR [rbp-24], rdi
	mov	QWORD PTR [rbp-8], 0
	jmp	.L2
.L3:
	mov	rax, QWORD PTR [rbp-24]
	mov	rax, QWORD PTR [rax]
	add	QWORD PTR [rbp-8], rax
	mov	rax, QWORD PTR [rbp-24]
	mov	rax, QWORD PTR [rax+8]
	mov	QWORD PTR [rbp-24], rax
.L2:
	cmp	QWORD PTR [rbp-24], 0
	jne	.L3
	mov	rax, QWORD PTR [rbp-8]
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	sum_list, .-sum_list
	.globl	rsum_list
	.type	rsum_list, @function
rsum_list:
.LFB1:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	QWORD PTR [rbp-24], rdi
	cmp	QWORD PTR [rbp-24], 0
	jne	.L6
	mov	eax, 0
	jmp	.L7
.L6:
	mov	rax, QWORD PTR [rbp-24]
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR [rbp-16], rax
	mov	rax, QWORD PTR [rbp-24]
	mov	rax, QWORD PTR [rax+8]
	mov	rdi, rax
	call	rsum_list
	mov	QWORD PTR [rbp-8], rax
	mov	rdx, QWORD PTR [rbp-16]
	mov	rax, QWORD PTR [rbp-8]
	add	rax, rdx
.L7:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	rsum_list, .-rsum_list
	.globl	copy_block
	.type	copy_block, @function
copy_block:
.LFB2:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	QWORD PTR [rbp-24], rdi
	mov	QWORD PTR [rbp-32], rsi
	mov	QWORD PTR [rbp-40], rdx
	mov	QWORD PTR [rbp-16], 0
	jmp	.L9
.L10:
	mov	rax, QWORD PTR [rbp-24]
	lea	rdx, [rax+8]
	mov	QWORD PTR [rbp-24], rdx
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR [rbp-8], rax
	mov	rax, QWORD PTR [rbp-32]
	lea	rdx, [rax+8]
	mov	QWORD PTR [rbp-32], rdx
	mov	rdx, QWORD PTR [rbp-8]
	mov	QWORD PTR [rax], rdx
	mov	rax, QWORD PTR [rbp-8]
	xor	QWORD PTR [rbp-16], rax
	sub	QWORD PTR [rbp-40], 1
.L9:
	cmp	QWORD PTR [rbp-40], 0
	jg	.L10
	mov	rax, QWORD PTR [rbp-16]
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	copy_block, .-copy_block
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.12) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
