	.arch armv8-a
	.file	"bench.c"
	.text
	.align	2
	.type	diff_time, %function
diff_time:
.LFB7:
	.cfi_startproc
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x0, x1, [sp, 16]
	stp	x2, x3, [sp]
	ldr	x1, [sp, 8]
	ldr	x0, [sp, 24]
	cmp	x1, x0
	bge	.L2
	ldr	x0, [sp]
	sub	x1, x0, #1
	ldr	x0, [sp, 16]
	sub	x2, x1, x0
	ldr	x1, [sp, 8]
	mov	x0, 51712
	movk	x0, 0x3b9a, lsl 16
	add	x1, x1, x0
	ldr	x0, [sp, 24]
	sub	x0, x1, x0
	mov	x4, x2
	mov	x5, x0
	b	.L3
.L2:
	ldr	x1, [sp]
	ldr	x0, [sp, 16]
	sub	x2, x1, x0
	ldr	x1, [sp, 8]
	ldr	x0, [sp, 24]
	sub	x0, x1, x0
	mov	x4, x2
	mov	x5, x0
.L3:
	mov	x0, x4
	mov	x1, x5
	add	sp, sp, 32
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE7:
	.size	diff_time, .-diff_time
	.align	2
	.global	loop
	.type	loop, %function
loop:
.LFB8:
	.cfi_startproc
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	str	w0, [sp, 12]
	str	wzr, [sp, 28]
	str	wzr, [sp, 20]
	b	.L5
.L10:
	ldr	w0, [sp, 12]
	str	w0, [sp, 24]
	b	.L6
.L9:
	ldr	w1, [sp, 24]
	ldr	w0, [sp, 12]
	cmp	w1, w0
	bge	.L7
	ldr	w0, [sp, 28]
	add	w1, w0, 1
	mov	w0, w1
	add	w0, w0, w0
	add	w0, w0, w1
	ldr	w1, [sp, 28]
	add	w0, w1, w0
	str	w0, [sp, 28]
	b	.L8
.L7:
	ldr	w1, [sp, 28]
	mov	w0, -5
	mul	w0, w1, w0
	add	w0, w0, 1
	ldr	w1, [sp, 28]
	sub	w0, w1, w0
	str	w0, [sp, 28]
.L8:
	ldr	w0, [sp, 24]
	add	w0, w0, 1
	str	w0, [sp, 24]
.L6:
	ldr	w0, [sp, 24]
	cmp	w0, 255
	ble	.L9
	ldr	w0, [sp, 20]
	add	w0, w0, 1
	str	w0, [sp, 20]
.L5:
	ldr	w0, [sp, 20]
	cmp	w0, 31
	ble	.L10
	ldr	w0, [sp, 28]
	add	sp, sp, 32
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE8:
	.size	loop, .-loop
	.section	.rodata
	.align	3
.LC0:
	.string	"Loop Seconds: %8.9f\n"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB9:
	.cfi_startproc
	stp	x29, x30, [sp, -112]!
	.cfi_def_cfa_offset 112
	.cfi_offset 29, -112
	.cfi_offset 30, -104
	mov	x29, sp
	str	w0, [sp, 28]
	str	x1, [sp, 16]
	ldr	w1, [sp, 28]
	mov	w0, 10000
	and	w0, w1, w0
	str	w0, [sp, 28]
	add	x0, sp, 88
	mov	x1, x0
	mov	w0, 4
	bl	clock_gettime
	ldr	w0, [sp, 28]
	bl	loop
	str	w0, [sp, 108]
	add	x0, sp, 72
	mov	x1, x0
	mov	w0, 4
	bl	clock_gettime
	ldp	x2, x3, [sp, 72]
	ldp	x0, x1, [sp, 88]
	bl	diff_time
	stp	x0, x1, [sp, 56]
	ldp	x0, x1, [sp, 56]
	stp	x0, x1, [sp, 32]
	ldr	d0, [sp, 32]
	scvtf	d1, d0
	ldr	d0, [sp, 40]
	scvtf	d0, d0
	mov	x0, 225833675390976
	movk	x0, 0x41cd, lsl 48
	fmov	d2, x0
	fdiv	d0, d0, d2
	fadd	d0, d1, d0
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	bl	printf
	ldr	w0, [sp, 108]
	str	w0, [sp, 52]
	mov	w0, 0
	ldp	x29, x30, [sp], 112
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE9:
	.size	main, .-main
	.ident	"GCC: (GNU Toolchain for the A-profile Architecture 10.2-2020.11 (arm-10.16)) 10.2.1 20201103"
	.section	.note.GNU-stack,"",@progbits
