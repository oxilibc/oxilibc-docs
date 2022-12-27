	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 11, 0
	.globl	_rust_eh_personality
	.weak_definition	_rust_eh_personality
	.p2align	2
_rust_eh_personality:
Lfunc_begin0:
	.cfi_startproc
	ret
Lfunc_end0:
	.cfi_endproc

	.globl	_memchr
	.p2align	2
_memchr:
Lfunc_begin1:
	.cfi_startproc
	stp	x20, x19, [sp, #-32]!
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	cbz	x2, LBB1_3
	mov	x19, x0
	mov	x0, x1
	mov	x1, x19
	bl	__ZN6memchr6memchr8fallback6memchr17hff7b08741587b6ebE
	cbz	x0, LBB1_3
	add	x0, x19, x1
	ldp	x29, x30, [sp, #16]
	ldp	x20, x19, [sp], #32
	ret
LBB1_3:
	mov	x0, #0
	ldp	x29, x30, [sp, #16]
	ldp	x20, x19, [sp], #32
	ret
Lfunc_end1:
	.cfi_endproc

	.globl	_memrchr
	.p2align	2
_memrchr:
Lfunc_begin2:
	.cfi_startproc
	cbz	x2, LBB2_18
	and	w8, w1, #0xff
	mov	w9, #16
	cmp	x2, #16
	csel	x13, x2, x9, lo
	add	x9, x0, x2
	cmp	x2, #7
	b.hi	LBB2_4
LBB2_2:
	cmp	x9, x0
	b.ls	LBB2_17
	ldrb	w10, [x9, #-1]!
	cmp	w10, w8
	b.ne	LBB2_2
	b	LBB2_7
LBB2_4:
	mov	x10, #72340172838076673
	mul	x10, x8, x10
	mov	x11, #-72340172838076674
	movk	x11, #65279
	ldur	x12, [x9, #-8]
	eor	x12, x12, x10
	add	x14, x12, x11
	bic	x12, x14, x12
	tst	x12, #0x8080808080808080
	b.eq	LBB2_9
LBB2_5:
	cmp	x9, x0
	b.ls	LBB2_17
	ldrb	w10, [x9, #-1]!
	cmp	w10, w8
	b.ne	LBB2_5
LBB2_7:
	sub	x9, x9, x0
	mov	w8, #1
	cbz	x8, LBB2_18
LBB2_8:
	add	x0, x0, x9
	ret
LBB2_9:
	and	x9, x9, #0xfffffffffffffff8
	cmp	x2, #16
	b.lo	LBB2_16
	add	x12, x0, #16
	cmp	x12, x9
	b.hi	LBB2_16
	neg	x13, x13
LBB2_12:
	ldur	x14, [x9, #-16]
	eor	x14, x14, x10
	add	x15, x14, x11
	bic	x14, x15, x14
	tst	x14, #0x8080808080808080
	b.ne	LBB2_16
	ldur	x14, [x9, #-8]
	eor	x14, x14, x10
	add	x15, x14, x11
	bic	x14, x15, x14
	tst	x14, #0x8080808080808080
	b.ne	LBB2_16
	add	x9, x9, x13
	cmp	x9, x12
	b.hs	LBB2_12
	b	LBB2_16
LBB2_15:
	ldrb	w10, [x9, #-1]!
	cmp	w10, w8
	b.eq	LBB2_7
LBB2_16:
	cmp	x9, x0
	b.hi	LBB2_15
LBB2_17:
	mov	x8, #0
	cbnz	x8, LBB2_8
LBB2_18:
	mov	x0, #0
	ret
Lfunc_end2:
	.cfi_endproc

	.globl	_memset
	.p2align	2
_memset:
Lfunc_begin3:
	.cfi_startproc
	cmp	x2, #15
	b.ls	LBB3_17
	neg	w8, w0
	ands	x12, x8, #0x7
	add	x8, x0, x12
	b.eq	LBB3_9
	strb	w1, [x0]
	cmp	x12, #1
	b.eq	LBB3_9
	strb	w1, [x0, #1]
	cmp	x12, #2
	b.eq	LBB3_9
	strb	w1, [x0, #2]
	cmp	x12, #3
	b.eq	LBB3_9
	strb	w1, [x0, #3]
	cmp	x12, #4
	b.eq	LBB3_9
	strb	w1, [x0, #4]
	cmp	x12, #5
	b.eq	LBB3_9
	strb	w1, [x0, #5]
	cmp	x12, #6
	b.eq	LBB3_9
	strb	w1, [x0, #6]
LBB3_9:
	sub	x10, x2, x12
	and	x13, x10, #0xfffffffffffffff8
	add	x9, x8, x13
	cmp	x13, #1
	b.lt	LBB3_16
	and	w11, w1, #0xff
	bfi	x11, x11, #8, #8
	bfi	x11, x11, #16, #16
	bfi	x11, x11, #32, #32
	add	x13, x13, x0
	add	x13, x13, x12
	add	x15, x12, x0
	add	x14, x15, #8
	cmp	x13, x14
	csel	x13, x13, x14, hi
	mvn	x14, x0
	add	x13, x13, x14
	sub	x12, x13, x12
	cmp	x12, #24
	b.lo	LBB3_15
	lsr	x12, x12, #3
	add	x12, x12, #1
	and	x14, x12, #0x3ffffffffffffffc
	lsl	x13, x14, #3
	dup.2d	v0, x11
	add	x15, x15, #16
	mov	x16, x14
LBB3_12:
	stp	q0, q0, [x15, #-16]
	add	x15, x15, #32
	subs	x16, x16, #4
	b.ne	LBB3_12
	cmp	x12, x14
	b.eq	LBB3_16
	add	x8, x8, x13
LBB3_15:
	str	x11, [x8], #8
	cmp	x8, x9
	b.lo	LBB3_15
LBB3_16:
	and	x2, x10, #0x7
	cbnz	x2, LBB3_18
	b	LBB3_22
LBB3_17:
	mov	x9, x0
	cbz	x2, LBB3_22
LBB3_18:
	mov	x8, x9
	cmp	x2, #8
	b.lo	LBB3_20
	dup.8b	v0, w1
	mov	x8, x9
	str	d0, [x8], #8
	cmp	x2, #8
	b.eq	LBB3_22
LBB3_20:
	add	x9, x9, x2
LBB3_21:
	strb	w1, [x8], #1
	cmp	x8, x9
	b.ne	LBB3_21
LBB3_22:
	ret
Lfunc_end3:
	.cfi_endproc

	.globl	_memcpy
	.p2align	2
_memcpy:
Lfunc_begin4:
	.cfi_startproc
	cmp	x2, #15
	b.ls	LBB4_13
	neg	w8, w0
	ands	x13, x8, #0x7
	b.eq	LBB4_9
	ldrb	w8, [x1]
	strb	w8, [x0]
	cmp	x13, #1
	b.eq	LBB4_9
	ldrb	w8, [x1, #1]
	strb	w8, [x0, #1]
	cmp	x13, #2
	b.eq	LBB4_9
	ldrb	w8, [x1, #2]
	strb	w8, [x0, #2]
	cmp	x13, #3
	b.eq	LBB4_9
	ldrb	w8, [x1, #3]
	strb	w8, [x0, #3]
	cmp	x13, #4
	b.eq	LBB4_9
	ldrb	w8, [x1, #4]
	strb	w8, [x0, #4]
	cmp	x13, #5
	b.eq	LBB4_9
	ldrb	w8, [x1, #5]
	strb	w8, [x0, #5]
	cmp	x13, #6
	b.eq	LBB4_9
	ldrb	w8, [x1, #6]
	strb	w8, [x0, #6]
LBB4_9:
	add	x10, x1, x13
	sub	x9, x2, x13
	and	x11, x9, #0xfffffffffffffff8
	add	x12, x0, x13
	add	x8, x12, x11
	ands	x14, x10, #0x7
	b.eq	LBB4_14
	and	x1, x10, #0xfffffffffffffff8
	ldr	x16, [x1]
	cmp	x11, #1
	b.lt	LBB4_30
	lsl	x14, x14, #3
	neg	w15, w14
	and	x15, x15, #0x38
	add	x17, x11, x0
	add	x2, x17, x13
	add	x17, x13, x0
	add	x3, x17, #8
	cmp	x2, x3
	csel	x2, x2, x3, hi
	mvn	x3, x0
	add	x2, x2, x3
	sub	x2, x2, x13
	cmp	x2, #40
	b.hs	LBB4_21
	mov	x17, x1
	b	LBB4_26
LBB4_13:
	mov	x8, x0
	cbnz	x2, LBB4_31
	b	LBB4_37
LBB4_14:
	cmp	x11, #1
	b.lt	LBB4_30
	add	x14, x11, x0
	add	x15, x14, x13
	add	x14, x13, x0
	add	x16, x14, #8
	cmp	x15, x16
	csel	x15, x15, x16, hi
	mvn	x16, x0
	add	x15, x15, x16
	sub	x15, x15, x13
	cmp	x15, #40
	b.lo	LBB4_28
	sub	x16, x14, x10
	mov	x14, x10
	cmp	x16, #32
	b.lo	LBB4_29
	lsr	x14, x15, #3
	add	x15, x14, #1
	and	x17, x15, #0x3ffffffffffffffc
	lsl	x16, x17, #3
	add	x14, x10, x16
	orr	x2, x13, #0x10
	add	x13, x0, x2
	add	x1, x1, x2
	mov	x2, x17
LBB4_18:
	ldp	q0, q1, [x1, #-16]
	stp	q0, q1, [x13, #-16]
	add	x13, x13, #32
	add	x1, x1, #32
	subs	x2, x2, #4
	b.ne	LBB4_18
	cmp	x15, x17
	b.eq	LBB4_30
	add	x12, x12, x16
	b	LBB4_29
LBB4_21:
	sub	x17, x17, x1
	sub	x3, x17, #8
	mov	x17, x1
	cmp	x3, #32
	b.lo	LBB4_26
	lsr	x17, x2, #3
	add	x2, x17, #1
	and	x4, x2, #0x3ffffffffffffffc
	lsl	x3, x4, #3
	dup.2d	v0, x16
	dup.2d	v2, x14
	dup.2d	v1, x15
	add	x17, x1, x3
	add	x13, x13, x0
	add	x13, x13, #16
	add	x16, x1, #24
	neg.2d	v2, v2
	mov	x1, x4
LBB4_23:
	ldur	q3, [x16, #-16]
	ext.16b	v4, v0, v3, #8
	ldr	q0, [x16], #32
	ext.16b	v5, v3, v0, #8
	ushl.2d	v4, v4, v2
	ushl.2d	v5, v5, v2
	ushl.2d	v3, v3, v1
	ushl.2d	v6, v0, v1
	orr.16b	v3, v3, v4
	orr.16b	v4, v6, v5
	stp	q3, q4, [x13, #-16]
	add	x13, x13, #32
	subs	x1, x1, #4
	b.ne	LBB4_23
	cmp	x2, x4
	b.eq	LBB4_30
	add	x12, x12, x3
	mov.d	x16, v0[1]
LBB4_26:
	add	x13, x17, #8
LBB4_27:
	lsr	x16, x16, x14
	ldr	x17, [x13], #8
	lsl	x1, x17, x15
	orr	x16, x1, x16
	str	x16, [x12], #8
	mov	x16, x17
	cmp	x12, x8
	b.lo	LBB4_27
	b	LBB4_30
LBB4_28:
	mov	x14, x10
LBB4_29:
	ldr	x13, [x14], #8
	str	x13, [x12], #8
	cmp	x12, x8
	b.lo	LBB4_29
LBB4_30:
	add	x1, x10, x11
	and	x2, x9, #0x7
	cbz	x2, LBB4_37
LBB4_31:
	mov	x10, #0
	cmp	x2, #8
	b.lo	LBB4_35
	sub	x9, x8, x1
	cmp	x9, #32
	b.lo	LBB4_35
	ldr	d0, [x1]
	str	d0, [x8]
	cmp	x2, #8
	b.eq	LBB4_37
	mov	w10, #8
LBB4_35:
	add	x8, x8, x10
	add	x9, x1, x10
	sub	x10, x2, x10
LBB4_36:
	ldrb	w11, [x9], #1
	strb	w11, [x8], #1
	subs	x10, x10, #1
	b.ne	LBB4_36
LBB4_37:
	ret
Lfunc_end4:
	.cfi_endproc

	.globl	_memccpy
	.p2align	2
_memccpy:
Lfunc_begin5:
	.cfi_startproc
	stp	x22, x21, [sp, #-48]!
	.cfi_def_cfa_offset 48
	stp	x20, x19, [sp, #16]
	stp	x29, x30, [sp, #32]
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	cbz	x3, LBB5_77
	mov	x21, x3
	mov	x20, x1
	mov	x19, x0
	mov	x0, x2
	mov	x2, x3
	bl	__ZN6memchr6memchr8fallback6memchr17hff7b08741587b6ebE
	cbz	x0, LBB5_15
	add	x9, x1, #1
	cmp	x9, #15
	b.ls	LBB5_28
	neg	w8, w19
	ands	x13, x8, #0x7
	b.eq	LBB5_11
	ldrb	w8, [x20]
	strb	w8, [x19]
	cmp	x13, #1
	b.eq	LBB5_11
	ldrb	w8, [x20, #1]
	strb	w8, [x19, #1]
	cmp	x13, #2
	b.eq	LBB5_11
	ldrb	w8, [x20, #2]
	strb	w8, [x19, #2]
	cmp	x13, #3
	b.eq	LBB5_11
	ldrb	w8, [x20, #3]
	strb	w8, [x19, #3]
	cmp	x13, #4
	b.eq	LBB5_11
	ldrb	w8, [x20, #4]
	strb	w8, [x19, #4]
	cmp	x13, #5
	b.eq	LBB5_11
	ldrb	w8, [x20, #5]
	strb	w8, [x19, #5]
	cmp	x13, #6
	b.eq	LBB5_11
	ldrb	w8, [x20, #6]
	strb	w8, [x19, #6]
LBB5_11:
	add	x10, x20, x13
	sub	x9, x9, x13
	and	x11, x9, #0xfffffffffffffff8
	add	x12, x19, x13
	add	x8, x12, x11
	ands	x14, x10, #0x7
	b.eq	LBB5_33
	and	x0, x10, #0xfffffffffffffff8
	ldr	x16, [x0]
	cmp	x11, #1
	b.lt	LBB5_63
	lsl	x14, x14, #3
	neg	w15, w14
	and	x15, x15, #0x38
	add	x17, x11, x19
	add	x2, x17, x13
	add	x17, x13, x19
	add	x3, x17, #8
	cmp	x2, x3
	csel	x2, x2, x3, hi
	mvn	x3, x19
	add	x2, x2, x3
	sub	x2, x2, x13
	cmp	x2, #40
	b.hs	LBB5_47
	mov	x17, x0
	b	LBB5_52
LBB5_15:
	cmp	x21, #15
	b.ls	LBB5_29
	neg	w8, w19
	ands	x13, x8, #0x7
	b.eq	LBB5_24
	ldrb	w8, [x20]
	strb	w8, [x19]
	cmp	x13, #1
	b.eq	LBB5_24
	ldrb	w8, [x20, #1]
	strb	w8, [x19, #1]
	cmp	x13, #2
	b.eq	LBB5_24
	ldrb	w8, [x20, #2]
	strb	w8, [x19, #2]
	cmp	x13, #3
	b.eq	LBB5_24
	ldrb	w8, [x20, #3]
	strb	w8, [x19, #3]
	cmp	x13, #4
	b.eq	LBB5_24
	ldrb	w8, [x20, #4]
	strb	w8, [x19, #4]
	cmp	x13, #5
	b.eq	LBB5_24
	ldrb	w8, [x20, #5]
	strb	w8, [x19, #5]
	cmp	x13, #6
	b.eq	LBB5_24
	ldrb	w8, [x20, #6]
	strb	w8, [x19, #6]
LBB5_24:
	add	x9, x20, x13
	sub	x11, x21, x13
	and	x10, x11, #0xfffffffffffffff8
	add	x12, x19, x13
	add	x8, x12, x10
	ands	x14, x9, #0x7
	b.eq	LBB5_40
	and	x0, x9, #0xfffffffffffffff8
	ldr	x16, [x0]
	cmp	x10, #1
	b.lt	LBB5_73
	lsl	x14, x14, #3
	neg	w15, w14
	and	x15, x15, #0x38
	add	x17, x10, x19
	add	x1, x17, x13
	add	x17, x13, x19
	add	x2, x17, #8
	cmp	x1, x2
	csel	x1, x1, x2, hi
	mvn	x2, x19
	add	x1, x1, x2
	sub	x1, x1, x13
	cmp	x1, #40
	b.hs	LBB5_54
	mov	x17, x0
	b	LBB5_59
LBB5_28:
	mov	x8, x19
	cbnz	x9, LBB5_64
	b	LBB5_70
LBB5_29:
	mov	x11, #0
	cmp	x21, #8
	b.lo	LBB5_75
	sub	x8, x19, x20
	cmp	x8, #32
	b.lo	LBB5_75
	ldr	d0, [x20]
	str	d0, [x19]
	cmp	x21, #8
	b.eq	LBB5_77
	mov	w11, #8
	b	LBB5_75
LBB5_33:
	cmp	x11, #1
	b.lt	LBB5_63
	add	x14, x11, x19
	add	x15, x14, x13
	add	x14, x13, x19
	add	x16, x14, #8
	cmp	x15, x16
	csel	x15, x15, x16, hi
	mvn	x16, x19
	add	x15, x15, x16
	sub	x15, x15, x13
	cmp	x15, #40
	b.lo	LBB5_61
	sub	x16, x14, x10
	mov	x14, x10
	cmp	x16, #32
	b.lo	LBB5_62
	lsr	x14, x15, #3
	add	x14, x14, #1
	and	x16, x14, #0x3ffffffffffffffc
	lsl	x15, x16, #3
	add	x12, x12, x15
	orr	x17, x13, #0x10
	add	x13, x20, x17
	add	x17, x19, x17
	mov	x0, x16
LBB5_37:
	ldp	q0, q1, [x13, #-16]
	stp	q0, q1, [x17, #-16]
	add	x13, x13, #32
	add	x17, x17, #32
	subs	x0, x0, #4
	b.ne	LBB5_37
	cmp	x14, x16
	b.eq	LBB5_63
	add	x14, x10, x15
	b	LBB5_62
LBB5_40:
	cmp	x10, #1
	b.lt	LBB5_73
	add	x14, x10, x19
	add	x15, x14, x13
	add	x14, x13, x19
	add	x16, x14, #8
	cmp	x15, x16
	csel	x15, x15, x16, hi
	mvn	x16, x19
	add	x15, x15, x16
	sub	x15, x15, x13
	cmp	x15, #40
	b.lo	LBB5_71
	sub	x16, x14, x9
	mov	x14, x9
	cmp	x16, #32
	b.lo	LBB5_72
	lsr	x14, x15, #3
	add	x15, x14, #1
	and	x17, x15, #0x3ffffffffffffffc
	lsl	x16, x17, #3
	add	x14, x9, x16
	orr	x0, x13, #0x10
	add	x13, x19, x0
	add	x0, x20, x0
	mov	x1, x17
LBB5_44:
	ldp	q0, q1, [x0, #-16]
	stp	q0, q1, [x13, #-16]
	add	x13, x13, #32
	add	x0, x0, #32
	subs	x1, x1, #4
	b.ne	LBB5_44
	cmp	x15, x17
	b.eq	LBB5_73
	add	x12, x12, x16
	b	LBB5_72
LBB5_47:
	sub	x17, x17, x0
	sub	x3, x17, #8
	mov	x17, x0
	cmp	x3, #32
	b.lo	LBB5_52
	lsr	x17, x2, #3
	add	x2, x17, #1
	and	x4, x2, #0x3ffffffffffffffc
	lsl	x3, x4, #3
	dup.2d	v0, x16
	dup.2d	v2, x14
	dup.2d	v1, x15
	add	x17, x0, x3
	add	x13, x13, x19
	add	x13, x13, #16
	add	x16, x0, #24
	neg.2d	v2, v2
	mov	x0, x4
LBB5_49:
	ldur	q3, [x16, #-16]
	ext.16b	v4, v0, v3, #8
	ldr	q0, [x16], #32
	ext.16b	v5, v3, v0, #8
	ushl.2d	v4, v4, v2
	ushl.2d	v5, v5, v2
	ushl.2d	v3, v3, v1
	ushl.2d	v6, v0, v1
	orr.16b	v3, v3, v4
	orr.16b	v4, v6, v5
	stp	q3, q4, [x13, #-16]
	add	x13, x13, #32
	subs	x0, x0, #4
	b.ne	LBB5_49
	cmp	x2, x4
	b.eq	LBB5_63
	add	x12, x12, x3
	mov.d	x16, v0[1]
LBB5_52:
	add	x13, x17, #8
LBB5_53:
	lsr	x16, x16, x14
	ldr	x17, [x13], #8
	lsl	x0, x17, x15
	orr	x16, x0, x16
	str	x16, [x12], #8
	mov	x16, x17
	cmp	x12, x8
	b.lo	LBB5_53
	b	LBB5_63
LBB5_54:
	sub	x17, x17, x0
	sub	x2, x17, #8
	mov	x17, x0
	cmp	x2, #32
	b.lo	LBB5_59
	lsr	x17, x1, #3
	add	x1, x17, #1
	and	x3, x1, #0x3ffffffffffffffc
	lsl	x2, x3, #3
	dup.2d	v0, x16
	dup.2d	v2, x14
	dup.2d	v1, x15
	add	x17, x0, x2
	add	x13, x13, x19
	add	x13, x13, #16
	add	x16, x0, #24
	neg.2d	v2, v2
	mov	x0, x3
LBB5_56:
	ldur	q3, [x16, #-16]
	ext.16b	v4, v0, v3, #8
	ldr	q0, [x16], #32
	ext.16b	v5, v3, v0, #8
	ushl.2d	v4, v4, v2
	ushl.2d	v5, v5, v2
	ushl.2d	v3, v3, v1
	ushl.2d	v6, v0, v1
	orr.16b	v3, v3, v4
	orr.16b	v4, v6, v5
	stp	q3, q4, [x13, #-16]
	add	x13, x13, #32
	subs	x0, x0, #4
	b.ne	LBB5_56
	cmp	x1, x3
	b.eq	LBB5_73
	add	x12, x12, x2
	mov.d	x16, v0[1]
LBB5_59:
	add	x13, x17, #8
LBB5_60:
	lsr	x16, x16, x14
	ldr	x17, [x13], #8
	lsl	x0, x17, x15
	orr	x16, x0, x16
	str	x16, [x12], #8
	mov	x16, x17
	cmp	x12, x8
	b.lo	LBB5_60
	b	LBB5_73
LBB5_61:
	mov	x14, x10
LBB5_62:
	ldr	x13, [x14], #8
	str	x13, [x12], #8
	cmp	x12, x8
	b.lo	LBB5_62
LBB5_63:
	add	x20, x10, x11
	and	x9, x9, #0x7
	cbz	x9, LBB5_70
LBB5_64:
	mov	x11, #0
	cmp	x9, #8
	b.lo	LBB5_68
	sub	x10, x8, x20
	cmp	x10, #32
	b.lo	LBB5_68
	ldr	d0, [x20]
	str	d0, [x8]
	cmp	x9, #8
	b.eq	LBB5_70
	mov	w11, #8
LBB5_68:
	add	x8, x8, x11
	add	x10, x20, x11
	sub	x9, x9, x11
LBB5_69:
	ldrb	w11, [x10], #1
	strb	w11, [x8], #1
	subs	x9, x9, #1
	b.ne	LBB5_69
LBB5_70:
	add	x8, x19, x1
	add	x0, x8, #1
	ldp	x29, x30, [sp, #32]
	ldp	x20, x19, [sp, #16]
	ldp	x22, x21, [sp], #48
	ret
LBB5_71:
	mov	x14, x9
LBB5_72:
	ldr	x13, [x14], #8
	str	x13, [x12], #8
	cmp	x12, x8
	b.lo	LBB5_72
LBB5_73:
	ands	x21, x11, #0x7
	b.eq	LBB5_77
	mov	x11, #0
	add	x20, x9, x10
	mov	x19, x8
LBB5_75:
	add	x8, x19, x11
	add	x9, x20, x11
	sub	x10, x21, x11
LBB5_76:
	ldrb	w11, [x9], #1
	strb	w11, [x8], #1
	subs	x10, x10, #1
	b.ne	LBB5_76
LBB5_77:
	mov	x0, #0
	ldp	x29, x30, [sp, #32]
	ldp	x20, x19, [sp, #16]
	ldp	x22, x21, [sp], #48
	ret
Lfunc_end5:
	.cfi_endproc

	.globl	_memmove
	.p2align	2
_memmove:
Lfunc_begin6:
	.cfi_startproc
	sub	x8, x1, x0
	cmp	x8, x2
	b.hs	LBB6_5
	add	x8, x0, x2
	add	x9, x1, x2
	cmp	x2, #15
	b.ls	LBB6_18
	and	x10, x8, #0xfffffffffffffff8
	and	x11, x8, #0x7
	neg	x12, x11
	cbz	x11, LBB6_57
	add	x14, x0, x2
	sub	x13, x14, x11
	sub	x15, x14, #1
	cmp	x13, x15
	csel	x13, x13, x15, lo
	sub	x13, x14, x13
	cmp	x13, #8
	b.hs	LBB6_27
	mov	x15, x9
	b	LBB6_55
LBB6_5:
	cmp	x2, #15
	b.ls	LBB6_19
	neg	w8, w0
	ands	x13, x8, #0x7
	b.eq	LBB6_14
	ldrb	w8, [x1]
	strb	w8, [x0]
	cmp	x13, #1
	b.eq	LBB6_14
	ldrb	w8, [x1, #1]
	strb	w8, [x0, #1]
	cmp	x13, #2
	b.eq	LBB6_14
	ldrb	w8, [x1, #2]
	strb	w8, [x0, #2]
	cmp	x13, #3
	b.eq	LBB6_14
	ldrb	w8, [x1, #3]
	strb	w8, [x0, #3]
	cmp	x13, #4
	b.eq	LBB6_14
	ldrb	w8, [x1, #4]
	strb	w8, [x0, #4]
	cmp	x13, #5
	b.eq	LBB6_14
	ldrb	w8, [x1, #5]
	strb	w8, [x0, #5]
	cmp	x13, #6
	b.eq	LBB6_14
	ldrb	w8, [x1, #6]
	strb	w8, [x0, #6]
LBB6_14:
	add	x10, x1, x13
	sub	x9, x2, x13
	and	x11, x9, #0xfffffffffffffff8
	add	x12, x0, x13
	add	x8, x12, x11
	ands	x14, x10, #0x7
	b.eq	LBB6_20
	and	x1, x10, #0xfffffffffffffff8
	ldr	x16, [x1]
	cmp	x11, #1
	b.lt	LBB6_47
	lsl	x14, x14, #3
	neg	w15, w14
	and	x15, x15, #0x38
	add	x17, x11, x0
	add	x2, x17, x13
	add	x17, x13, x0
	add	x3, x17, #8
	cmp	x2, x3
	csel	x2, x2, x3, hi
	mvn	x3, x0
	add	x2, x2, x3
	sub	x2, x2, x13
	cmp	x2, #40
	b.hs	LBB6_30
	mov	x17, x1
	b	LBB6_35
LBB6_18:
	mov	x10, x0
	sub	x11, x8, #1
	cmp	x0, x11
	csel	x11, x0, x11, lo
	sub	x11, x8, x11
	cmp	x11, #8
	b.hs	LBB6_66
	b	LBB6_69
LBB6_19:
	mov	x8, x0
	cbnz	x2, LBB6_48
	b	LBB6_81
LBB6_20:
	cmp	x11, #1
	b.lt	LBB6_47
	add	x14, x11, x0
	add	x15, x14, x13
	add	x14, x13, x0
	add	x16, x14, #8
	cmp	x15, x16
	csel	x15, x15, x16, hi
	mvn	x16, x0
	add	x15, x15, x16
	sub	x15, x15, x13
	cmp	x15, #40
	b.lo	LBB6_45
	sub	x16, x14, x10
	mov	x14, x10
	cmp	x16, #32
	b.lo	LBB6_46
	lsr	x14, x15, #3
	add	x15, x14, #1
	and	x17, x15, #0x3ffffffffffffffc
	lsl	x16, x17, #3
	add	x14, x10, x16
	orr	x2, x13, #0x10
	add	x13, x0, x2
	add	x1, x1, x2
	mov	x2, x17
LBB6_24:
	ldp	q0, q1, [x1, #-16]
	stp	q0, q1, [x13, #-16]
	add	x13, x13, #32
	add	x1, x1, #32
	subs	x2, x2, #4
	b.ne	LBB6_24
	cmp	x15, x17
	b.eq	LBB6_47
	add	x12, x12, x16
	b	LBB6_46
LBB6_27:
	add	x15, x1, x2
	sub	x14, x15, x14
	mov	x15, x9
	cmp	x14, #32
	b.lo	LBB6_55
	cmp	x13, #32
	b.hs	LBB6_37
	mov	x14, #0
	b	LBB6_41
LBB6_30:
	sub	x17, x17, x1
	sub	x3, x17, #8
	mov	x17, x1
	cmp	x3, #32
	b.lo	LBB6_35
	lsr	x17, x2, #3
	add	x2, x17, #1
	and	x4, x2, #0x3ffffffffffffffc
	lsl	x3, x4, #3
	dup.2d	v0, x16
	dup.2d	v2, x14
	dup.2d	v1, x15
	add	x17, x1, x3
	add	x13, x13, x0
	add	x13, x13, #16
	add	x16, x1, #24
	neg.2d	v2, v2
	mov	x1, x4
LBB6_32:
	ldur	q3, [x16, #-16]
	ext.16b	v4, v0, v3, #8
	ldr	q0, [x16], #32
	ext.16b	v5, v3, v0, #8
	ushl.2d	v4, v4, v2
	ushl.2d	v5, v5, v2
	ushl.2d	v3, v3, v1
	ushl.2d	v6, v0, v1
	orr.16b	v3, v3, v4
	orr.16b	v4, v6, v5
	stp	q3, q4, [x13, #-16]
	add	x13, x13, #32
	subs	x1, x1, #4
	b.ne	LBB6_32
	cmp	x2, x4
	b.eq	LBB6_47
	add	x12, x12, x3
	mov.d	x16, v0[1]
LBB6_35:
	add	x13, x17, #8
LBB6_36:
	lsr	x16, x16, x14
	ldr	x17, [x13], #8
	lsl	x1, x17, x15
	orr	x16, x1, x16
	str	x16, [x12], #8
	mov	x16, x17
	cmp	x12, x8
	b.lo	LBB6_36
	b	LBB6_47
LBB6_37:
	and	x14, x13, #0xffffffffffffffe0
	sub	x16, x2, #16
	add	x15, x0, x16
	add	x16, x1, x16
	mov	x17, x14
LBB6_38:
	ldp	q1, q0, [x16, #-16]
	stp	q1, q0, [x15, #-16]
	sub	x15, x15, #32
	sub	x16, x16, #32
	sub	x17, x17, #32
	cbnz	x17, LBB6_38
	cmp	x13, x14
	b.eq	LBB6_57
	tst	x13, #0x18
	b.eq	LBB6_54
LBB6_41:
	and	x16, x13, #0xfffffffffffffff8
	neg	x15, x16
	sub	x8, x8, x16
	sub	x17, x14, x16
	sub	x14, x2, x14
	sub	x3, x14, #8
	add	x14, x0, x3
	add	x3, x1, x3
LBB6_42:
	ldr	d0, [x3], #-8
	str	d0, [x14], #-8
	adds	x17, x17, #8
	b.ne	LBB6_42
	cmp	x13, x16
	b.eq	LBB6_57
	add	x15, x9, x15
	b	LBB6_55
LBB6_45:
	mov	x14, x10
LBB6_46:
	ldr	x13, [x14], #8
	str	x13, [x12], #8
	cmp	x12, x8
	b.lo	LBB6_46
LBB6_47:
	add	x1, x10, x11
	and	x2, x9, #0x7
	cbz	x2, LBB6_81
LBB6_48:
	mov	x10, #0
	cmp	x2, #8
	b.lo	LBB6_52
	sub	x9, x8, x1
	cmp	x9, #32
	b.lo	LBB6_52
	ldr	d0, [x1]
	str	d0, [x8]
	cmp	x2, #8
	b.eq	LBB6_81
	mov	w10, #8
LBB6_52:
	add	x8, x8, x10
	add	x9, x1, x10
	sub	x10, x2, x10
LBB6_53:
	ldrb	w11, [x9], #1
	strb	w11, [x8], #1
	subs	x10, x10, #1
	b.ne	LBB6_53
	b	LBB6_81
LBB6_54:
	sub	x15, x9, x14
	sub	x8, x8, x14
LBB6_55:
	sub	x13, x15, #1
LBB6_56:
	ldrb	w14, [x13], #-1
	strb	w14, [x8, #-1]!
	cmp	x10, x8
	b.lo	LBB6_56
LBB6_57:
	add	x9, x9, x12
	sub	x12, x2, x11
	and	x8, x12, #0xfffffffffffffff8
	neg	x11, x8
	sub	x8, x10, x8
	and	x13, x9, #0x7
	cbz	x13, LBB6_61
	and	x16, x9, #0xfffffffffffffff8
	ldr	x14, [x16]
	tbz	x11, #63, LBB6_64
	lsl	x13, x13, #3
	neg	w15, w13
	and	x15, x15, #0x38
	sub	x16, x16, #8
LBB6_60:
	lsl	x14, x14, x15
	ldr	x17, [x16], #-8
	lsr	x1, x17, x13
	orr	x14, x1, x14
	str	x14, [x10, #-8]!
	mov	x14, x17
	cmp	x8, x10
	b.lo	LBB6_60
	b	LBB6_64
LBB6_61:
	tbz	x11, #63, LBB6_64
	add	x13, x12, x1
	sub	x13, x13, #8
LBB6_63:
	ldr	x14, [x13], #-8
	str	x14, [x10, #-8]!
	cmp	x8, x10
	b.lo	LBB6_63
LBB6_64:
	ands	x10, x12, #0x7
	b.eq	LBB6_81
	sub	x10, x8, x10
	add	x9, x9, x11
	sub	x11, x8, #1
	cmp	x10, x11
	csel	x11, x10, x11, lo
	sub	x11, x8, x11
	cmp	x11, #8
	b.lo	LBB6_69
LBB6_66:
	sub	x12, x9, x8
	cmp	x12, #32
	b.lo	LBB6_69
	cmp	x11, #32
	b.hs	LBB6_70
	mov	x13, #0
	b	LBB6_74
LBB6_69:
	mov	x12, x8
	b	LBB6_79
LBB6_70:
	and	x13, x11, #0xffffffffffffffe0
	sub	x12, x9, #16
	sub	x14, x8, #16
	mov	x15, x13
LBB6_71:
	ldp	q1, q0, [x12, #-16]
	stp	q1, q0, [x14, #-16]
	sub	x12, x12, #32
	sub	x14, x14, #32
	sub	x15, x15, #32
	cbnz	x15, LBB6_71
	cmp	x11, x13
	b.eq	LBB6_81
	tst	x11, #0x18
	b.eq	LBB6_78
LBB6_74:
	and	x15, x11, #0xfffffffffffffff8
	neg	x14, x15
	sub	x12, x8, x15
	sub	x16, x13, x15
	mov	x17, #-8
	sub	x13, x17, x13
	add	x8, x8, x13
	add	x13, x9, x13
LBB6_75:
	ldr	d0, [x13], #-8
	str	d0, [x8], #-8
	adds	x16, x16, #8
	b.ne	LBB6_75
	cmp	x11, x15
	b.eq	LBB6_81
	add	x9, x9, x14
	b	LBB6_79
LBB6_78:
	sub	x9, x9, x13
	sub	x12, x8, x13
LBB6_79:
	sub	x8, x9, #1
LBB6_80:
	ldrb	w9, [x8], #-1
	strb	w9, [x12, #-1]!
	cmp	x10, x12
	b.lo	LBB6_80
LBB6_81:
	ret
Lfunc_end6:
	.cfi_endproc

	.globl	_memmem
	.p2align	2
_memmem:
Lfunc_begin7:
	.cfi_startproc
	sub	sp, sp, #160
	.cfi_def_cfa_offset 160
	stp	x26, x25, [sp, #80]
	stp	x24, x23, [sp, #96]
	stp	x22, x21, [sp, #112]
	stp	x20, x19, [sp, #128]
	stp	x29, x30, [sp, #144]
	add	x29, sp, #144
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w25, -72
	.cfi_offset w26, -80
	mov	x21, x3
	mov	x22, x2
	mov	x20, x1
	mov	x19, x0
	cmp	x1, #64
	b.hs	LBB7_8
	cbz	x21, LBB7_15
	mov	w11, #0
	ldrb	w23, [x22]
	add	x8, x22, x21
	mov	w10, #1
	mov	x9, x22
	mov	w24, #1
	b	LBB7_5
LBB7_3:
	cmp	x9, x8
	b.eq	LBB7_12
LBB7_4:
	mov	x10, #0
	ldrb	w11, [x9], #1
	add	w23, w11, w23, lsl #1
	lsl	w24, w24, #1
	mov	w11, #1
LBB7_5:
	tbnz	w11, #0, LBB7_3
	sub	x11, x8, x9
	cmp	x11, x10
	b.ls	LBB7_12
	add	x9, x9, x10
	b	LBB7_4
LBB7_8:
	mov	x23, sp
	mov	x0, sp
	mov	x1, x22
	mov	x2, x21
	bl	__ZN6memchr6memmem8Searcher3new17hc47f917c31dc34b3E
	ldp	x6, x8, [sp, #8]
	cmp	x8, #0
	cset	w8, ne
	stp	w8, wzr, [sp, #72]
	cmp	x6, x20
	b.hi	LBB7_22
	ldr	x8, [sp, #40]
	sub	x8, x8, #2
	mov	w9, #2
	cmp	x8, #2
	csel	x8, x8, x9, lo
	cmp	x8, #2
	b.eq	LBB7_20
	cmp	x8, #1
	b.ne	LBB7_23
	ldrb	w0, [sp, #24]
	mov	x1, x19
	mov	x2, x20
	bl	__ZN6memchr6memchr8fallback6memchr17hff7b08741587b6ebE
	cbnz	x0, LBB7_21
	b	LBB7_22
LBB7_12:
	cmp	x20, x21
	b.lo	LBB7_22
	mov	w25, #0
	mov	x8, x21
	mov	x9, x19
LBB7_14:
	ldrb	w10, [x9], #1
	add	w25, w10, w25, lsl #1
	subs	x8, x8, #1
	b.ne	LBB7_14
	b	LBB7_16
LBB7_15:
	mov	w23, #0
	mov	w25, #0
	mov	w24, #1
LBB7_16:
	cmp	w25, w23
	b.eq	LBB7_19
LBB7_17:
	cmp	x20, x21
	b.ls	LBB7_22
	ldrb	w8, [x19]
	ldrb	w9, [x19, x21]
	msub	w8, w24, w8, w25
	add	w25, w9, w8, lsl #1
	add	x19, x19, #1
	sub	x20, x20, #1
	cmp	w25, w23
	b.ne	LBB7_17
LBB7_19:
	mov	x0, x19
	mov	x1, x20
	mov	x2, x22
	mov	x3, x21
	bl	__ZN6memchr6memmem9rabinkarp9is_prefix17h4443d732999a128dE
	tbz	w0, #0, LBB7_17
	b	LBB7_23
LBB7_20:
	ldr	x5, [sp]
	add	x1, x23, #24
	mov	x0, sp
	add	x2, sp, #72
	mov	x3, x19
	mov	x4, x20
	bl	__ZN6memchr6memmem8Searcher7find_tw17hb3196727918d7456E
	cbz	x0, LBB7_22
LBB7_21:
	add	x19, x19, x1
	b	LBB7_23
LBB7_22:
	mov	x19, #0
LBB7_23:
	mov	x0, x19
	ldp	x29, x30, [sp, #144]
	ldp	x20, x19, [sp, #128]
	ldp	x22, x21, [sp, #112]
	ldp	x24, x23, [sp, #96]
	ldp	x26, x25, [sp, #80]
	add	sp, sp, #160
	ret
Lfunc_end7:
	.cfi_endproc

	.globl	_memrmem
	.p2align	2
_memrmem:
Lfunc_begin8:
	.cfi_startproc
	stp	x28, x27, [sp, #-96]!
	.cfi_def_cfa_offset 96
	stp	x26, x25, [sp, #16]
	stp	x24, x23, [sp, #32]
	stp	x22, x21, [sp, #48]
	stp	x20, x19, [sp, #64]
	stp	x29, x30, [sp, #80]
	add	x29, sp, #80
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w25, -72
	.cfi_offset w26, -80
	.cfi_offset w27, -88
	.cfi_offset w28, -96
	mov	x20, x3
	mov	x21, x2
	mov	x19, x0
	cmp	x1, #64
	b.hs	LBB8_8
	cbz	x20, LBB8_15
	mov	w10, #0
	add	x8, x21, x20
	ldurb	w23, [x8, #-1]
	mov	w9, #1
	mov	w24, #1
	b	LBB8_5
LBB8_3:
	cmp	x8, x21
	b.eq	LBB8_11
LBB8_4:
	mov	x9, #0
	ldrb	w10, [x8, #-1]!
	add	w23, w10, w23, lsl #1
	lsl	w24, w24, #1
	mov	w10, #1
LBB8_5:
	tbnz	w10, #0, LBB8_3
	sub	x10, x8, x21
	cmp	x10, x9
	b.ls	LBB8_11
	sub	x8, x8, x9
	b	LBB8_4
LBB8_8:
	cbz	x20, LBB8_20
	cmp	x20, #1
	b.ne	LBB8_29
	mov	x12, #0
	ldrb	w9, [x21]
	mov	w10, #3
	b	LBB8_69
LBB8_11:
	cmp	x1, x20
	b.lo	LBB8_22
	mov	w25, #0
	add	x8, x1, x19
	sub	x8, x8, #1
	mov	x9, x20
LBB8_13:
	ldrb	w10, [x8], #-1
	add	w25, w10, w25, lsl #1
	subs	x9, x9, #1
	b.ne	LBB8_13
	sub	x26, x1, #1
	neg	x27, x20
	sub	x28, x19, x20
	add	x22, x26, #1
	cmp	w23, w25
	b.ne	LBB8_19
	b	LBB8_18
LBB8_15:
	mov	w23, #0
	mov	w25, #0
	mov	w24, #1
	sub	x26, x1, #1
	neg	x27, x20
	sub	x28, x19, x20
	add	x22, x26, #1
	cmp	w23, w25
	b.ne	LBB8_19
	b	LBB8_18
LBB8_16:
	add	x0, x27, x26
	cmp	x0, x22
	b.hs	LBB8_153
	ldrb	w8, [x19, x26]
	msub	w8, w24, w8, w25
	ldrb	w9, [x28, x26]
	add	w25, w9, w8, lsl #1
	sub	x26, x26, #1
	add	x22, x26, #1
	cmp	w23, w25
	b.ne	LBB8_19
LBB8_18:
	mov	x0, x19
	mov	x1, x22
	mov	x2, x21
	mov	x3, x20
	bl	__ZN6memchr6memmem9rabinkarp9is_suffix17h4525791d980a9bb7E
	tbnz	w0, #0, LBB8_142
LBB8_19:
	cmp	x22, x20
	b.hi	LBB8_16
	b	LBB8_22
LBB8_20:
	mov	w10, #2
	mov	x12, x20
LBB8_21:
	cmp	x20, x1
	b.ls	LBB8_24
LBB8_22:
	mov	x10, #0
LBB8_23:
	mov	x0, x10
	ldp	x29, x30, [sp, #80]
	ldp	x20, x19, [sp, #64]
	ldp	x22, x21, [sp, #48]
	ldp	x24, x23, [sp, #32]
	ldp	x26, x25, [sp, #16]
	ldp	x28, x27, [sp], #96
	ret
LBB8_24:
	sub	x13, x10, #2
	mov	w14, #2
	cmp	x13, #2
	csel	x13, x13, x14, lo
	cbz	x13, LBB8_36
	and	x14, x9, #0xff
	orr	x12, x12, x14
	cmp	x13, #1
	b.ne	LBB8_37
	and	w8, w12, #0xff
	mov	w9, #16
	cmp	x1, #16
	csel	x13, x1, x9, lo
	add	x9, x19, x1
	cmp	x1, #7
	b.hi	LBB8_75
LBB8_27:
	cmp	x9, x19
	b.ls	LBB8_22
	ldrb	w10, [x9, #-1]!
	cmp	w10, w8
	b.ne	LBB8_27
	b	LBB8_78
LBB8_29:
	cmp	x20, #8
	b.hs	LBB8_31
	mov	x9, #0
	mov	x10, x21
	b	LBB8_46
LBB8_31:
	cmp	x20, #16
	b.hs	LBB8_41
	mov	x9, #0
	mov	x8, #0
LBB8_33:
	and	x11, x20, #0xfffffffffffffff8
	add	x10, x21, x11
	movi.2d	v0, #0000000000000000
	movi.2d	v1, #0000000000000000
	mov.d	v1[0], x9
	sub	x9, x8, x11
	add	x8, x21, x8
	movi.8b	v2, #63
	mov	w12, #1
	dup.2d	v3, x12
	movi.2d	v4, #0000000000000000
	movi.2d	v5, #0000000000000000
LBB8_34:
	ldr	d6, [x8], #8
	and.8b	v6, v6, v2
	ushll.8h	v6, v6, #0
	ushll2.4s	v7, v6, #0
	ushll2.2d	v16, v7, #0
	ushll.2d	v7, v7, #0
	ushll.4s	v6, v6, #0
	ushll2.2d	v17, v6, #0
	ushll.2d	v6, v6, #0
	ushl.2d	v6, v3, v6
	ushl.2d	v17, v3, v17
	ushl.2d	v7, v3, v7
	ushl.2d	v16, v3, v16
	orr.16b	v5, v16, v5
	orr.16b	v4, v7, v4
	orr.16b	v0, v17, v0
	orr.16b	v1, v6, v1
	adds	x9, x9, #8
	b.ne	LBB8_34
	orr.16b	v1, v1, v4
	orr.16b	v0, v0, v5
	orr.16b	v0, v1, v0
	ext.16b	v1, v0, v0, #8
	orr.8b	v0, v0, v1
	fmov	x9, d0
	cmp	x11, x20
	b.ne	LBB8_46
	b	LBB8_48
LBB8_36:
	mov	x0, x1
	add	x10, x19, x1
	b	LBB8_23
LBB8_37:
	add	x13, x8, #1
	cbz	x10, LBB8_101
	mov	x0, x1
	cbz	x20, LBB8_161
	sub	x9, x8, #1
	cmp	x8, x20
	b.hs	LBB8_122
	sub	x14, x19, x20
	mov	x15, x1
	b	LBB8_88
LBB8_41:
	movi.2d	v0, #0000000000000000
	movi.16b	v1, #63
	mov	w8, #1
	dup.2d	v3, x8
	and	x8, x20, #0xfffffffffffffff0
	movi.2d	v2, #0000000000000000
	mov	x9, x21
	mov	x10, x8
	movi.2d	v5, #0000000000000000
	movi.2d	v4, #0000000000000000
	movi.2d	v16, #0000000000000000
	movi.2d	v6, #0000000000000000
	movi.2d	v17, #0000000000000000
	movi.2d	v7, #0000000000000000
LBB8_42:
	ldr	q18, [x9], #16
	and.16b	v18, v18, v1
	ushll2.8h	v19, v18, #0
	ushll2.4s	v20, v19, #0
	ushll2.2d	v21, v20, #0
	ushll.2d	v20, v20, #0
	ushll.4s	v19, v19, #0
	ushll2.2d	v22, v19, #0
	ushll.8h	v18, v18, #0
	ushll2.4s	v23, v18, #0
	ushll2.2d	v24, v23, #0
	ushll.2d	v19, v19, #0
	ushll.2d	v23, v23, #0
	ushll.4s	v18, v18, #0
	ushll2.2d	v25, v18, #0
	ushll.2d	v18, v18, #0
	ushl.2d	v18, v3, v18
	ushl.2d	v25, v3, v25
	ushl.2d	v23, v3, v23
	ushl.2d	v19, v3, v19
	ushl.2d	v24, v3, v24
	ushl.2d	v22, v3, v22
	ushl.2d	v20, v3, v20
	ushl.2d	v21, v3, v21
	orr.16b	v7, v21, v7
	orr.16b	v17, v20, v17
	orr.16b	v6, v22, v6
	orr.16b	v4, v24, v4
	orr.16b	v16, v19, v16
	orr.16b	v5, v23, v5
	orr.16b	v2, v25, v2
	orr.16b	v0, v18, v0
	subs	x10, x10, #16
	b.ne	LBB8_42
	orr.16b	v0, v0, v16
	orr.16b	v1, v5, v17
	orr.16b	v0, v0, v1
	orr.16b	v1, v2, v6
	orr.16b	v2, v4, v7
	orr.16b	v1, v1, v2
	orr.16b	v0, v0, v1
	ext.16b	v1, v0, v0, #8
	orr.8b	v0, v0, v1
	fmov	x9, d0
	cmp	x8, x20
	b.eq	LBB8_48
	tbnz	w20, #3, LBB8_33
	add	x10, x21, x8
LBB8_46:
	add	x8, x21, x20
	mov	w11, #1
LBB8_47:
	ldrb	w12, [x10], #1
	lsl	x12, x11, x12
	orr	x9, x12, x9
	cmp	x10, x8
	b.ne	LBB8_47
LBB8_48:
	subs	x12, x20, #1
	b.ne	LBB8_50
	mov	w10, #1
	mov	w11, #1
	mov	w13, #1
	mov	w14, #1
	b	LBB8_62
LBB8_50:
	mov	x13, #0
	mov	w10, #1
	mov	x11, x20
	mov	x14, x12
	b	LBB8_52
LBB8_51:
	mov	x13, #0
	sub	x8, x14, #1
	mov	w10, #1
	mov	x11, x14
	mov	x14, x8
	cmp	x8, x13
	b.ls	LBB8_56
LBB8_52:
	mvn	x15, x13
	add	x8, x11, x15
	cmp	x8, x20
	b.hs	LBB8_154
	add	x0, x14, x15
	cmp	x0, x20
	b.hs	LBB8_155
	ldrb	w8, [x21, x8]
	ldrb	w15, [x21, x0]
	cmp	w15, w8
	b.lo	LBB8_51
	sub	x16, x11, x0
	add	x17, x13, #1
	cmp	x17, x10
	csel	x17, x10, xzr, eq
	csinc	x13, xzr, x13, eq
	sub	x14, x14, x17
	cmp	w15, w8
	csel	x13, xzr, x13, hi
	csel	x8, x0, x14, hi
	csel	x10, x16, x10, hi
	mov	x14, x8
	cmp	x8, x13
	b.hi	LBB8_52
LBB8_56:
	mov	x15, #0
	mov	w13, #1
	mov	x14, x20
	b	LBB8_58
LBB8_57:
	mov	x15, #0
	sub	x8, x12, #1
	mov	w13, #1
	mov	x14, x12
	mov	x12, x8
	cmp	x8, x15
	b.ls	LBB8_62
LBB8_58:
	mvn	x16, x15
	add	x8, x14, x16
	cmp	x8, x20
	b.hs	LBB8_154
	add	x0, x12, x16
	cmp	x0, x20
	b.hs	LBB8_155
	ldrb	w8, [x21, x8]
	ldrb	w16, [x21, x0]
	cmp	w16, w8
	b.hi	LBB8_57
	add	x17, x15, #1
	cmp	x17, x13
	csel	x17, x13, xzr, eq
	csinc	x15, xzr, x15, eq
	sub	x12, x12, x17
	sub	x17, x14, x0
	cmp	w16, w8
	csel	x15, x15, xzr, hs
	csel	x8, x12, x0, hs
	csel	x13, x13, x17, hs
	mov	x12, x8
	cmp	x8, x15
	b.hi	LBB8_58
LBB8_62:
	cmp	x11, x14
	csel	x12, x10, x13, lo
	csel	x8, x11, x14, lo
	sub	x10, x20, x8
	cmp	x8, x10
	csel	x11, x8, x10, hi
	cmp	x20, x10, lsl #1
	b.ls	LBB8_68
	cmp	x8, x20
	b.hi	LBB8_163
	subs	x0, x8, x12
	b.lo	LBB8_164
	cmp	x10, x12
	b.ls	LBB8_80
LBB8_66:
	mov	w10, #1
LBB8_67:
	and	x12, x9, #0xffffffffffffff00
	b	LBB8_69
LBB8_68:
	and	x12, x9, #0xffffffffffffff00
	mov	w10, #1
LBB8_69:
	mov	w15, #0
	add	x13, x21, x20
	mov	w14, #1
	b	LBB8_72
LBB8_70:
	cmp	x13, x21
	b.eq	LBB8_21
LBB8_71:
	mov	x14, #0
	sub	x13, x13, #1
	mov	w15, #1
LBB8_72:
	tbnz	w15, #0, LBB8_70
	sub	x15, x13, x21
	cmp	x15, x14
	b.ls	LBB8_21
	sub	x13, x13, x14
	b	LBB8_71
LBB8_75:
	mov	x10, #72340172838076673
	mul	x10, x14, x10
	mov	x11, #-72340172838076674
	movk	x11, #65279
	ldur	x12, [x9, #-8]
	eor	x12, x12, x10
	add	x14, x12, x11
	bic	x12, x14, x12
	tst	x12, #0x8080808080808080
	b.eq	LBB8_143
LBB8_76:
	cmp	x9, x19
	b.ls	LBB8_22
	ldrb	w10, [x9, #-1]!
	cmp	w10, w8
	b.ne	LBB8_76
LBB8_78:
	sub	x0, x9, x19
LBB8_79:
	add	x10, x19, x0
	b	LBB8_23
LBB8_80:
	add	x13, x21, x8
	cmp	x10, #3
	b.hi	LBB8_136
	neg	x14, x12
LBB8_82:
	cbz	x10, LBB8_151
	ldrb	w15, [x13, x14]
	ldrb	w16, [x13], #1
	sub	x10, x10, #1
	cmp	w15, w16
	b.eq	LBB8_82
	b	LBB8_66
LBB8_84:
	mov	x2, #0
LBB8_85:
	sub	x10, x13, x2
LBB8_86:
	sub	x0, x15, x10
LBB8_87:
	mov	x10, #0
	mov	x15, x0
	cmp	x0, x20
	b.lo	LBB8_23
LBB8_88:
	sub	x0, x15, x20
	cmp	x0, x1
	b.hs	LBB8_161
	ldrb	w16, [x19, x0]
	lsr	x10, x12, x16
	tbz	w10, #0, LBB8_87
	cmp	x9, x20
	b.hs	LBB8_95
	add	x17, x14, x15
	mov	x3, x13
LBB8_92:
	subs	x2, x3, #1
	b.eq	LBB8_96
	add	x10, x0, x3
	sub	x10, x10, #2
	cmp	x10, x1
	b.hs	LBB8_152
	add	x10, x21, x3
	ldurb	w10, [x10, #-2]
	add	x3, x17, x3
	ldurb	w4, [x3, #-2]
	mov	x3, x2
	cmp	w10, w4
	b.eq	LBB8_92
	b	LBB8_85
LBB8_95:
	cbnz	x8, LBB8_162
LBB8_96:
	ldrb	w10, [x21]
	mov	x17, x8
	cmp	w10, w16
	b.ne	LBB8_84
LBB8_97:
	add	x10, x17, x0
	cmp	x10, x1
	b.hs	LBB8_152
	ldrb	w16, [x21, x17]
	ldrb	w10, [x19, x10]
	cmp	w16, w10
	b.ne	LBB8_100
	add	x17, x17, #1
	cmp	x17, x20
	b.ne	LBB8_97
	b	LBB8_79
LBB8_100:
	mov	x10, x11
	cmp	x17, x20
	b.ne	LBB8_86
	b	LBB8_79
LBB8_101:
	cmp	x20, x8
	csel	x9, x20, x8, hi
	sub	x14, x19, x20
	neg	x15, x8
	add	x16, x21, x8
	sub	x17, x8, x20
	sub	x2, x9, x8
	mov	x3, x1
	mov	x4, x20
	b	LBB8_103
LBB8_102:
	mov	x4, x20
	mov	x10, #0
	mov	x3, x0
	cmp	x0, x20
	b.lo	LBB8_23
LBB8_103:
	sub	x0, x3, x20
	cmp	x0, x1
	b.hs	LBB8_161
	ldrb	w5, [x19, x0]
	lsr	x10, x12, x5
	tbz	w10, #0, LBB8_102
	cmp	x8, x4
	csel	x6, x8, x4, lo
	sub	x10, x6, #1
	cmp	x10, x20
	b.hs	LBB8_110
	add	x22, x6, #1
	add	x6, x14, x3
LBB8_107:
	subs	x7, x22, #1
	b.eq	LBB8_111
	add	x10, x0, x22
	sub	x10, x10, #2
	cmp	x10, x1
	b.hs	LBB8_152
	add	x10, x21, x22
	ldurb	w10, [x10, #-2]
	add	x22, x6, x22
	ldurb	w23, [x22, #-2]
	mov	x22, x7
	cmp	w10, w23
	b.eq	LBB8_107
	b	LBB8_120
LBB8_110:
	cbnz	x6, LBB8_165
LBB8_111:
	cbz	x20, LBB8_156
	ldrb	w10, [x21]
	cmp	w10, w5
	b.ne	LBB8_119
	cmp	x8, x4
	b.hs	LBB8_79
	add	x4, x15, x4
	add	x10, x17, x3
	mov	x5, x2
	mov	x6, x16
LBB8_115:
	cbz	x5, LBB8_162
	cmp	x10, x1
	b.hs	LBB8_152
	ldrb	w7, [x6]
	ldrb	w22, [x19, x10]
	cmp	w7, w22
	b.ne	LBB8_121
	add	x6, x6, #1
	add	x10, x10, #1
	sub	x5, x5, #1
	sub	x4, x4, #1
	cbnz	x4, LBB8_115
	b	LBB8_79
LBB8_119:
	mov	x7, #0
LBB8_120:
	sub	x10, x13, x7
	mov	x4, x20
	sub	x0, x3, x10
	mov	x10, #0
	mov	x3, x0
	cmp	x0, x20
	b.hs	LBB8_103
	b	LBB8_23
LBB8_121:
	mov	x4, x11
	mov	x10, x11
	sub	x0, x3, x11
	mov	x10, #0
	mov	x3, x0
	cmp	x0, x20
	b.hs	LBB8_103
	b	LBB8_23
LBB8_122:
	cmp	x9, x20
	b.hs	LBB8_157
	sub	x9, x19, x20
	mov	x14, x1
	b	LBB8_127
LBB8_124:
	mov	x17, #0
	sub	x10, x13, xzr
LBB8_125:
	sub	x0, x14, x10
LBB8_126:
	mov	x10, #0
	mov	x14, x0
	cmp	x0, x20
	b.lo	LBB8_23
LBB8_127:
	sub	x0, x14, x20
	cmp	x0, x1
	b.hs	LBB8_161
	ldrb	w15, [x19, x0]
	lsr	x10, x12, x15
	tbz	w10, #0, LBB8_126
	add	x16, x9, x14
	mov	x2, x13
LBB8_130:
	subs	x17, x2, #1
	b.eq	LBB8_134
	add	x10, x0, x2
	sub	x10, x10, #2
	cmp	x10, x1
	b.hs	LBB8_152
	add	x10, x21, x2
	ldurb	w10, [x10, #-2]
	add	x2, x16, x2
	ldurb	w3, [x2, #-2]
	mov	x2, x17
	cmp	w10, w3
	b.eq	LBB8_130
	sub	x10, x13, x17
	b	LBB8_125
LBB8_134:
	ldrb	w10, [x21]
	cmp	w10, w15
	b.ne	LBB8_124
	mov	x10, x11
	cmp	x8, x20
	b.ne	LBB8_125
	b	LBB8_79
LBB8_136:
	sub	x15, x10, #4
	add	x14, x21, x0
	add	x14, x15, x14
	cmp	x15, #1
	b.lt	LBB8_140
	neg	x15, x12
	mov	x16, x13
LBB8_138:
	ldr	w17, [x16, x15]
	ldr	w0, [x16]
	cmp	w17, w0
	b.ne	LBB8_66
	add	x16, x16, #4
	add	x17, x16, x15
	cmp	x17, x14
	b.lo	LBB8_138
LBB8_140:
	add	x10, x13, x10
	ldr	w13, [x14]
	ldur	w10, [x10, #-4]
	cmp	w13, w10
	b.ne	LBB8_66
	mov	x10, #0
	mov	x11, x12
	b	LBB8_67
LBB8_142:
	sub	x8, x22, x20
	add	x10, x19, x8
	b	LBB8_23
LBB8_143:
	and	x9, x9, #0xfffffffffffffff8
	cmp	x1, #16
	b.lo	LBB8_150
	add	x12, x19, #16
	cmp	x12, x9
	b.hi	LBB8_150
	neg	x13, x13
LBB8_146:
	ldur	x14, [x9, #-16]
	eor	x14, x14, x10
	add	x15, x14, x11
	bic	x14, x15, x14
	tst	x14, #0x8080808080808080
	b.ne	LBB8_150
	ldur	x14, [x9, #-8]
	eor	x14, x14, x10
	add	x15, x14, x11
	bic	x14, x15, x14
	tst	x14, #0x8080808080808080
	b.ne	LBB8_150
	add	x9, x9, x13
	cmp	x9, x12
	b.hs	LBB8_146
	b	LBB8_150
LBB8_149:
	ldrb	w10, [x9, #-1]!
	cmp	w10, w8
	b.eq	LBB8_78
LBB8_150:
	cmp	x9, x19
	b.hi	LBB8_149
	b	LBB8_22
LBB8_151:
	mov	x11, x12
	b	LBB8_67
LBB8_152:
	mov	x0, x10
	bl	__ZN4core9panicking18panic_bounds_check17hc99fca025e30adc5E
LBB8_153:
	mov	x1, x22
	bl	__ZN4core9panicking18panic_bounds_check17hc99fca025e30adc5E
LBB8_154:
	mov	x0, x8
LBB8_155:
	mov	x1, x20
	bl	__ZN4core9panicking18panic_bounds_check17hc99fca025e30adc5E
LBB8_156:
	mov	x0, #0
	mov	x1, #0
	bl	__ZN4core9panicking18panic_bounds_check17hc99fca025e30adc5E
LBB8_157:
	neg	x8, x20
	sub	x11, x19, x20
	mov	x13, x1
LBB8_158:
	add	x0, x8, x13
	cmp	x0, x1
	b.hs	LBB8_161
	ldrb	w10, [x11, x13]
	lsr	x10, x12, x10
	tbnz	w10, #0, LBB8_162
	mov	x10, #0
	sub	x13, x13, x20
	cmp	x13, x20
	b.hs	LBB8_158
	b	LBB8_23
LBB8_161:
	bl	__ZN4core9panicking18panic_bounds_check17hc99fca025e30adc5E
LBB8_162:
	mov	x0, x9
	mov	x1, x20
	bl	__ZN4core9panicking18panic_bounds_check17hc99fca025e30adc5E
LBB8_163:
	bl	__ZN4core9panicking5panic17h025c1aaacfe68954E
LBB8_164:
	mov	x1, x8
	bl	__ZN4core5slice5index24slice_end_index_len_fail17h1f02670a3f073468E
LBB8_165:
	mov	x0, x10
	mov	x1, x20
	bl	__ZN4core9panicking18panic_bounds_check17hc99fca025e30adc5E
Lfunc_end8:
	.cfi_endproc

	.globl	_strchr
	.p2align	2
_strchr:
Lfunc_begin9:
	.cfi_startproc
	ldrb	w9, [x0]
	cbz	w9, LBB9_4
	and	w8, w1, #0xff
LBB9_2:
	cmp	w9, w8
	b.eq	LBB9_5
	ldrb	w9, [x0, #1]!
	cbnz	w9, LBB9_2
LBB9_4:
	mov	x0, #0
LBB9_5:
	ret
Lfunc_end9:
	.cfi_endproc

	.globl	_strlen
	.p2align	2
_strlen:
Lfunc_begin10:
	.cfi_startproc
	mov	x9, #0
LBB10_1:
	mov	x8, x9
	ldrb	w10, [x0, x9]
	add	x9, x9, #1
	cbnz	w10, LBB10_1
	mov	x0, x8
	ret
Lfunc_end10:
	.cfi_endproc

	.globl	_strnlen
	.p2align	2
_strnlen:
Lfunc_begin11:
	.cfi_startproc
	cbz	x1, LBB11_6
	mov	x8, x0
	mov	x0, #0
LBB11_2:
	ldrb	w9, [x8, x0]
	cbz	w9, LBB11_5
	add	x0, x0, #1
	cmp	x1, x0
	b.ne	LBB11_2
	mov	x0, x1
LBB11_5:
	ret
LBB11_6:
	mov	x0, #0
	ret
Lfunc_end11:
	.cfi_endproc

	.globl	_strnlen_s
	.p2align	2
_strnlen_s:
Lfunc_begin12:
	.cfi_startproc
	mov	x8, x0
	mov	x0, #0
	cbz	x8, LBB12_6
	cbz	x1, LBB12_6
	mov	x0, #0
LBB12_3:
	ldrb	w9, [x8, x0]
	cbz	w9, LBB12_6
	add	x0, x0, #1
	cmp	x1, x0
	b.ne	LBB12_3
	mov	x0, x1
LBB12_6:
	ret
Lfunc_end12:
	.cfi_endproc

	.globl	_strcmp
	.p2align	2
_strcmp:
Lfunc_begin13:
	.cfi_startproc
	ldrb	w9, [x0]
	cbz	w9, LBB13_5
	add	x8, x0, #1
LBB13_2:
	ldrb	w10, [x1]
	cbz	w10, LBB13_5
	subs	w0, w9, w10
	b.ne	LBB13_6
	add	x1, x1, #1
	ldrb	w9, [x8], #1
	cbnz	w9, LBB13_2
LBB13_5:
	mov	w0, #0
LBB13_6:
	ret
Lfunc_end13:
	.cfi_endproc

	.globl	_strncmp
	.p2align	2
_strncmp:
Lfunc_begin14:
	.cfi_startproc
LBB14_1:
	cbz	x2, LBB14_4
	ldrb	w9, [x0], #1
	ldrb	w10, [x1], #1
	sub	w8, w9, w10
	sub	x2, x2, #1
	cmp	w8, #0
	ccmp	w9, #0, #4, eq
	ccmp	w10, #0, #4, ne
	b.ne	LBB14_1
	mov	x0, x8
	ret
LBB14_4:
	mov	w0, #0
	ret
Lfunc_end14:
	.cfi_endproc

	.globl	_strspn
	.p2align	2
_strspn:
Lfunc_begin15:
	.cfi_startproc
	movi.2d	v0, #0000000000000000
	stp	q0, q0, [sp, #-32]!
	.cfi_def_cfa_offset 32
	ldrb	w10, [x1]
	cbz	w10, LBB15_3
	add	x8, x1, #1
	mov	w9, #1
	mov	x11, sp
LBB15_2:
	sxtb	x10, w10
	lsr	x12, x10, #3
	and	x12, x12, #0x1ffffffffffffff8
	ldr	x13, [x11, x12]
	lsl	x10, x9, x10
	orr	x10, x13, x10
	str	x10, [x11, x12]
	ldrb	w10, [x8], #1
	cbnz	w10, LBB15_2
LBB15_3:
	ldrsb	w9, [x0]
	mov	x8, x0
	cmp	w9, #1
	b.lt	LBB15_7
	mov	x10, sp
	mov	x8, x0
LBB15_5:
	lsr	w11, w9, #3
	and	x11, x11, #0x18
	ldr	x11, [x10, x11]
	lsr	x9, x11, x9
	tbz	w9, #0, LBB15_7
	ldrsb	w9, [x8, #1]!
	cmp	w9, #0
	b.gt	LBB15_5
LBB15_7:
	sub	x0, x8, x0
	add	sp, sp, #32
	ret
Lfunc_end15:
	.cfi_endproc

	.globl	_strcspn
	.p2align	2
_strcspn:
Lfunc_begin16:
	.cfi_startproc
	movi.2d	v0, #0000000000000000
	stp	q0, q0, [sp, #-32]!
	.cfi_def_cfa_offset 32
	ldrb	w10, [x1]
	cbz	w10, LBB16_3
	add	x8, x1, #1
	mov	w9, #1
	mov	x11, sp
LBB16_2:
	sxtb	x10, w10
	lsr	x12, x10, #3
	and	x12, x12, #0x1ffffffffffffff8
	ldr	x13, [x11, x12]
	lsl	x10, x9, x10
	orr	x10, x13, x10
	str	x10, [x11, x12]
	ldrb	w10, [x8], #1
	cbnz	w10, LBB16_2
LBB16_3:
	ldrb	w10, [x0]
	mov	x8, x0
	cbz	w10, LBB16_8
	mov	x9, sp
	mov	x8, x0
	b	LBB16_6
LBB16_5:
	ldrb	w10, [x8, #1]!
	cbz	w10, LBB16_8
LBB16_6:
	tbnz	w10, #7, LBB16_5
	mov	w10, w10
	lsr	x11, x10, #3
	and	x11, x11, #0x1ffffff8
	ldr	x11, [x9, x11]
	lsr	x10, x11, x10
	tbz	w10, #0, LBB16_5
LBB16_8:
	sub	x0, x8, x0
	add	sp, sp, #32
	ret
Lfunc_end16:
	.cfi_endproc

	.globl	_strpbrk
	.p2align	2
_strpbrk:
Lfunc_begin17:
	.cfi_startproc
	movi.2d	v0, #0000000000000000
	stp	q0, q0, [sp, #-32]!
	.cfi_def_cfa_offset 32
	ldrb	w10, [x1]
	cbz	w10, LBB17_3
	add	x8, x1, #1
	mov	w9, #1
	mov	x11, sp
LBB17_2:
	sxtb	x10, w10
	lsr	x12, x10, #3
	and	x12, x12, #0x1ffffffffffffff8
	ldr	x13, [x11, x12]
	lsl	x10, x9, x10
	orr	x10, x10, x13
	str	x10, [x11, x12]
	ldrb	w10, [x8], #1
	cbnz	w10, LBB17_2
LBB17_3:
	ldrb	w9, [x0]
	cbz	w9, LBB17_8
	mov	x8, sp
	b	LBB17_6
LBB17_5:
	ldrb	w9, [x0, #1]!
	cbz	w9, LBB17_8
LBB17_6:
	tbnz	w9, #7, LBB17_5
	mov	w9, w9
	lsr	x10, x9, #3
	and	x10, x10, #0x1ffffff8
	ldr	x10, [x8, x10]
	lsr	x9, x10, x9
	tbz	w9, #0, LBB17_5
LBB17_8:
	ldrb	w8, [x0]
	cmp	w8, #0
	csel	x0, xzr, x0, eq
	add	sp, sp, #32
	ret
Lfunc_end17:
	.cfi_endproc

	.globl	_strcpy
	.p2align	2
_strcpy:
Lfunc_begin18:
	.cfi_startproc
	mov	x8, #0
LBB18_1:
	ldrb	w9, [x1, x8]
	strb	w9, [x0, x8]
	add	x8, x8, #1
	cbnz	w9, LBB18_1
	ret
Lfunc_end18:
	.cfi_endproc

	.globl	_strncpy
	.p2align	2
_strncpy:
Lfunc_begin19:
	.cfi_startproc
	ldrb	w8, [x1]
	cmp	w8, #0
	ccmp	x2, #0, #4, ne
	b.ne	LBB19_2
	mov	x10, #0
	b	LBB19_4
LBB19_2:
	mov	x11, #0
	add	x9, x1, #1
LBB19_3:
	strb	w8, [x0, x11]
	add	x10, x11, #1
	ldrb	w8, [x9, x11]
	cmp	w8, #0
	ccmp	x10, x2, #2, ne
	mov	x11, x10
	b.lo	LBB19_3
LBB19_4:
	add	x8, x0, x10
	sub	x11, x2, x10
	cmp	x11, #15
	b.ls	LBB19_21
	neg	w9, w8
	ands	x12, x9, #0x7
	add	x9, x8, x12
	b.eq	LBB19_13
	strb	wzr, [x8]
	cmp	x12, #1
	b.eq	LBB19_13
	strb	wzr, [x8, #1]
	cmp	x12, #2
	b.eq	LBB19_13
	strb	wzr, [x8, #2]
	cmp	x12, #3
	b.eq	LBB19_13
	strb	wzr, [x8, #3]
	cmp	x12, #4
	b.eq	LBB19_13
	strb	wzr, [x8, #4]
	cmp	x12, #5
	b.eq	LBB19_13
	strb	wzr, [x8, #5]
	cmp	x12, #6
	b.eq	LBB19_13
	strb	wzr, [x8, #6]
LBB19_13:
	sub	x11, x11, x12
	and	x13, x11, #0xfffffffffffffff8
	add	x8, x9, x13
	cmp	x13, #1
	b.lt	LBB19_20
	add	x14, x10, x0
	add	x14, x14, x12
	add	x15, x14, #8
	add	x13, x14, x13
	cmp	x13, x15
	csel	x13, x13, x15, hi
	mvn	x14, x10
	add	x13, x13, x14
	add	x14, x12, x0
	sub	x13, x13, x14
	cmp	x13, #24
	b.lo	LBB19_19
	lsr	x13, x13, #3
	add	x13, x13, #1
	and	x15, x13, #0x3ffffffffffffffc
	lsl	x14, x15, #3
	add	x10, x10, x12
	add	x10, x10, x0
	add	x10, x10, #16
	movi.2d	v0, #0000000000000000
	mov	x12, x15
LBB19_16:
	stp	q0, q0, [x10, #-16]
	add	x10, x10, #32
	subs	x12, x12, #4
	b.ne	LBB19_16
	cmp	x13, x15
	b.eq	LBB19_20
	add	x9, x9, x14
LBB19_19:
	str	xzr, [x9], #8
	cmp	x9, x8
	b.lo	LBB19_19
LBB19_20:
	and	x11, x11, #0x7
LBB19_21:
	cbz	x11, LBB19_26
	mov	x9, x8
	cmp	x11, #8
	b.lo	LBB19_24
	movi.2d	v0, #0000000000000000
	mov	x9, x8
	str	d0, [x9], #8
	cmp	x11, #8
	b.eq	LBB19_26
LBB19_24:
	add	x8, x8, x11
LBB19_25:
	strb	wzr, [x9], #1
	cmp	x9, x8
	b.ne	LBB19_25
LBB19_26:
	ret
Lfunc_end19:
	.cfi_endproc

	.globl	_stpcpy
	.p2align	2
_stpcpy:
Lfunc_begin20:
	.cfi_startproc
	mov	x9, #0
LBB20_1:
	mov	x8, x9
	ldrb	w10, [x1, x9]
	strb	w10, [x0, x9]
	add	x9, x9, #1
	cbnz	w10, LBB20_1
	add	x0, x0, x8
	ret
Lfunc_end20:
	.cfi_endproc

	.globl	_strstr
	.p2align	2
_strstr:
Lfunc_begin21:
	.cfi_startproc
	sub	sp, sp, #160
	.cfi_def_cfa_offset 160
	stp	x26, x25, [sp, #80]
	stp	x24, x23, [sp, #96]
	stp	x22, x21, [sp, #112]
	stp	x20, x19, [sp, #128]
	stp	x29, x30, [sp, #144]
	add	x29, sp, #144
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w25, -72
	.cfi_offset w26, -80
	mov	x19, x0
	ldrb	w23, [x1]
	cbz	w23, LBB21_28
	mov	x21, x1
	mov	x8, #0
LBB21_2:
	mov	x20, x8
	ldrb	w9, [x19, x8]
	add	x8, x8, #1
	cbnz	w9, LBB21_2
	mov	x24, #0
LBB21_4:
	mov	x22, x24
	ldrb	w8, [x21, x24]
	add	x24, x24, #1
	cbnz	w8, LBB21_4
	cmp	x20, #64
	b.hs	LBB21_13
	cbz	x22, LBB21_20
	mov	w11, #0
	add	x8, x21, x22
	mov	w10, #1
	mov	x9, x21
	mov	w25, #1
	b	LBB21_10
LBB21_8:
	cmp	x9, x8
	b.eq	LBB21_17
LBB21_9:
	mov	x10, #0
	ldrb	w11, [x9], #1
	add	w23, w11, w23, lsl #1
	lsl	w25, w25, #1
	mov	w11, #1
LBB21_10:
	tbnz	w11, #0, LBB21_8
	sub	x11, x8, x9
	cmp	x11, x10
	b.ls	LBB21_17
	add	x9, x9, x10
	b	LBB21_9
LBB21_13:
	mov	x23, sp
	mov	x0, sp
	mov	x1, x21
	mov	x2, x22
	bl	__ZN6memchr6memmem8Searcher3new17hc47f917c31dc34b3E
	ldp	x6, x8, [sp, #8]
	cmp	x8, #0
	cset	w8, ne
	stp	w8, wzr, [sp, #72]
	cmp	x6, x20
	b.hi	LBB21_27
	ldr	x8, [sp, #40]
	sub	x8, x8, #2
	mov	w9, #2
	cmp	x8, #2
	csel	x8, x8, x9, lo
	cmp	x8, #2
	b.eq	LBB21_25
	cmp	x8, #1
	b.ne	LBB21_28
	ldrb	w0, [sp, #24]
	mov	x1, x19
	mov	x2, x20
	bl	__ZN6memchr6memchr8fallback6memchr17hff7b08741587b6ebE
	cbnz	x0, LBB21_26
	b	LBB21_27
LBB21_17:
	cmp	x20, x22
	b.lo	LBB21_27
	mov	x8, #0
	mov	w26, #0
LBB21_19:
	ldrb	w9, [x19, x8]
	add	w26, w9, w26, lsl #1
	add	x8, x8, #1
	cmp	x22, x8
	b.ne	LBB21_19
	b	LBB21_21
LBB21_20:
	mov	w23, #0
	mov	w26, #0
	mov	w25, #1
LBB21_21:
	cmp	w26, w23
	b.eq	LBB21_24
LBB21_22:
	cmp	x20, x22
	b.ls	LBB21_27
	add	x8, x19, x24
	ldrb	w9, [x19], #1
	ldurb	w8, [x8, #-1]
	msub	w9, w25, w9, w26
	add	w26, w8, w9, lsl #1
	sub	x20, x20, #1
	cmp	w26, w23
	b.ne	LBB21_22
LBB21_24:
	mov	x0, x19
	mov	x1, x20
	mov	x2, x21
	mov	x3, x22
	bl	__ZN6memchr6memmem9rabinkarp9is_prefix17h4443d732999a128dE
	tbz	w0, #0, LBB21_22
	b	LBB21_28
LBB21_25:
	ldr	x5, [sp]
	add	x1, x23, #24
	mov	x0, sp
	add	x2, sp, #72
	mov	x3, x19
	mov	x4, x20
	bl	__ZN6memchr6memmem8Searcher7find_tw17hb3196727918d7456E
	cbz	x0, LBB21_27
LBB21_26:
	add	x19, x19, x1
	b	LBB21_28
LBB21_27:
	mov	x19, #0
LBB21_28:
	mov	x0, x19
	ldp	x29, x30, [sp, #144]
	ldp	x20, x19, [sp, #128]
	ldp	x22, x21, [sp, #112]
	ldp	x24, x23, [sp, #96]
	ldp	x26, x25, [sp, #80]
	add	sp, sp, #160
	ret
Lfunc_end21:
	.cfi_endproc

	.globl	_bcmp
	.p2align	2
_bcmp:
Lfunc_begin22:
	.cfi_startproc
	cmp	x2, #8
	b.lo	LBB22_4
	orr	w8, w1, w0
	and	x8, x8, #0x7
	cbz	x8, LBB22_4
LBB22_2:
	ldr	x8, [x0]
	ldr	x9, [x1]
	cmp	x8, x9
	b.ne	LBB22_5
	add	x0, x0, #8
	add	x1, x1, #8
	sub	x2, x2, #8
	cmp	x2, #7
	b.hi	LBB22_2
LBB22_4:
	cbz	x2, LBB22_7
LBB22_5:
	ldrb	w8, [x0]
	ldrb	w9, [x1]
	subs	w8, w8, w9
	b.ne	LBB22_8
	add	x0, x0, #1
	add	x1, x1, #1
	subs	x2, x2, #1
	b.ne	LBB22_5
LBB22_7:
	mov	w8, #0
LBB22_8:
	mov	x0, x8
	ret
Lfunc_end22:
	.cfi_endproc

	.globl	_bcopy
	.p2align	2
_bcopy:
Lfunc_begin23:
	.cfi_startproc
	mov	x8, x0
	mov	x0, x1
	mov	x1, x8
	b	_memmove
Lfunc_end23:
	.cfi_endproc

	.globl	_bzero
	.p2align	2
_bzero:
Lfunc_begin24:
	.cfi_startproc
	cmp	x1, #15
	b.ls	LBB24_17
	neg	w8, w0
	ands	x11, x8, #0x7
	add	x8, x0, x11
	b.eq	LBB24_9
	strb	wzr, [x0]
	cmp	x11, #1
	b.eq	LBB24_9
	strb	wzr, [x0, #1]
	cmp	x11, #2
	b.eq	LBB24_9
	strb	wzr, [x0, #2]
	cmp	x11, #3
	b.eq	LBB24_9
	strb	wzr, [x0, #3]
	cmp	x11, #4
	b.eq	LBB24_9
	strb	wzr, [x0, #4]
	cmp	x11, #5
	b.eq	LBB24_9
	strb	wzr, [x0, #5]
	cmp	x11, #6
	b.eq	LBB24_9
	strb	wzr, [x0, #6]
LBB24_9:
	sub	x10, x1, x11
	and	x12, x10, #0xfffffffffffffff8
	add	x9, x8, x12
	cmp	x12, #1
	b.lt	LBB24_16
	add	x12, x12, x0
	add	x12, x12, x11
	add	x14, x11, x0
	add	x13, x14, #8
	cmp	x12, x13
	csel	x12, x12, x13, hi
	mvn	x13, x0
	add	x12, x12, x13
	sub	x11, x12, x11
	cmp	x11, #24
	b.lo	LBB24_15
	lsr	x11, x11, #3
	add	x11, x11, #1
	and	x13, x11, #0x3ffffffffffffffc
	lsl	x12, x13, #3
	add	x14, x14, #16
	movi.2d	v0, #0000000000000000
	mov	x15, x13
LBB24_12:
	stp	q0, q0, [x14, #-16]
	add	x14, x14, #32
	subs	x15, x15, #4
	b.ne	LBB24_12
	cmp	x11, x13
	b.eq	LBB24_16
	add	x8, x8, x12
LBB24_15:
	str	xzr, [x8], #8
	cmp	x8, x9
	b.lo	LBB24_15
LBB24_16:
	and	x1, x10, #0x7
	mov	x0, x9
LBB24_17:
	cbz	x1, LBB24_22
	mov	x8, x0
	cmp	x1, #8
	b.lo	LBB24_20
	movi.2d	v0, #0000000000000000
	mov	x8, x0
	str	d0, [x8], #8
	cmp	x1, #8
	b.eq	LBB24_22
LBB24_20:
	add	x9, x0, x1
LBB24_21:
	strb	wzr, [x8], #1
	cmp	x8, x9
	b.ne	LBB24_21
LBB24_22:
	ret
Lfunc_end24:
	.cfi_endproc

	.globl	_index
	.p2align	2
_index:
Lfunc_begin25:
	.cfi_startproc
	ldrb	w9, [x0]
	cbz	w9, LBB25_4
	and	w8, w1, #0xff
LBB25_2:
	cmp	w9, w8
	b.eq	LBB25_5
	ldrb	w9, [x0, #1]!
	cbnz	w9, LBB25_2
LBB25_4:
	mov	x0, #0
LBB25_5:
	ret
Lfunc_end25:
	.cfi_endproc

	.globl	_rindex
	.p2align	2
_rindex:
Lfunc_begin26:
	.cfi_startproc
	ldrb	w10, [x0]
	cbz	w10, LBB26_4
	mov	x8, x0
	mov	x0, #0
	and	w9, w1, #0xff
LBB26_2:
	cmp	w10, w9
	csel	x0, x8, x0, eq
	ldrb	w10, [x8, #1]!
	cbnz	w10, LBB26_2
	ret
LBB26_4:
	mov	x0, #0
	ret
Lfunc_end26:
	.cfi_endproc

	.globl	_ffs
	.p2align	2
_ffs:
Lfunc_begin27:
	.cfi_startproc
	rbit	w8, w0
	clz	w8, w8
	cmp	w0, #0
	csinc	w0, wzr, w8, eq
	ret
Lfunc_end27:
	.cfi_endproc

	.globl	_ffsl
	.p2align	2
_ffsl:
Lfunc_begin28:
	.cfi_startproc
	rbit	x8, x0
	clz	x8, x8
	cmp	x0, #0
	csinc	w0, wzr, w8, eq
	ret
Lfunc_end28:
	.cfi_endproc

	.globl	_strcasecmp
	.p2align	2
_strcasecmp:
Lfunc_begin29:
	.cfi_startproc
	ldrb	w8, [x0]
	sub	w9, w8, #65
	cmp	w9, #26
	cset	w9, lo
	orr	w8, w8, w9, lsl #5
	ldrb	w9, [x1]
	sub	w10, w9, #65
	cmp	w10, #26
	cset	w10, lo
	orr	w9, w9, w10, lsl #5
	and	w10, w9, #0xff
	cmp	w10, #0
	and	w10, w8, #0xff
	ccmp	w10, #0, #4, ne
	b.eq	LBB29_5
	cmp	w10, w9, uxtb
	b.ne	LBB29_5
	add	x10, x0, #1
	add	x11, x1, #1
LBB29_3:
	ldrb	w8, [x10], #1
	sub	w9, w8, #65
	cmp	w9, #26
	cset	w9, lo
	orr	w8, w8, w9, lsl #5
	ldrb	w9, [x11], #1
	sub	w12, w9, #65
	cmp	w12, #26
	cset	w12, lo
	orr	w9, w9, w12, lsl #5
	and	w12, w9, #0xff
	cmp	w12, #0
	and	w12, w8, #0xff
	ccmp	w12, #0, #4, ne
	b.eq	LBB29_5
	cmp	w12, w9, uxtb
	b.eq	LBB29_3
LBB29_5:
	sub	w8, w8, w9
	sxtb	w0, w8
	ret
Lfunc_end29:
	.cfi_endproc

	.globl	_strncasecmp
	.p2align	2
_strncasecmp:
Lfunc_begin30:
	.cfi_startproc
	cbz	x2, LBB30_4
LBB30_1:
	ldrb	w8, [x0]
	sub	w9, w8, #65
	cmp	w9, #26
	cset	w9, lo
	orr	w8, w8, w9, lsl #5
	ldrb	w9, [x1]
	sub	w10, w9, #65
	cmp	w10, #26
	cset	w10, lo
	orr	w9, w9, w10, lsl #5
	and	w10, w9, #0xff
	cmp	w10, #0
	and	w10, w8, #0xff
	ccmp	w10, #0, #4, ne
	b.eq	LBB30_5
	cmp	w10, w9, uxtb
	b.ne	LBB30_5
	add	x0, x0, #1
	add	x1, x1, #1
	subs	x2, x2, #1
	b.ne	LBB30_1
LBB30_4:
	mov	w0, #0
	ret
LBB30_5:
	sub	w8, w8, w9
	sxtb	w0, w8
	ret
Lfunc_end30:
	.cfi_endproc

	.p2align	2
__ZN4core9panicking9panic_fmt17h3c467ff2c53a52bdE:
Lfunc_begin31:
	.file	1 "/rustc/bed4ad65bf7a1cef39e3d66b3670189581b3b073" "library/core/src/panicking.rs"
	.loc	1 50 0
	.cfi_startproc
LBB31_1:
	.loc	1 65 14 prologue_end
	b	LBB31_1
Ltmp3:
Lfunc_end31:
	.cfi_endproc

	.p2align	2
__ZN4core9panicking18panic_bounds_check17hc99fca025e30adc5E:
Lfunc_begin32:
	.loc	1 146 0
	.cfi_startproc
	stp	x29, x30, [sp, #-16]!
	.cfi_def_cfa_offset 16
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp4:
	.loc	1 151 5 prologue_end
	bl	__ZN4core9panicking9panic_fmt17h3c467ff2c53a52bdE
Ltmp5:
Lfunc_end32:
	.cfi_endproc

	.p2align	2
__ZN4core5slice5index24slice_end_index_len_fail17h1f02670a3f073468E:
Lfunc_begin33:
	.file	2 "/rustc/bed4ad65bf7a1cef39e3d66b3670189581b3b073" "library/core/src/slice/index.rs"
	.loc	2 66 0
	.cfi_startproc
	stp	x29, x30, [sp, #-16]!
	.cfi_def_cfa_offset 16
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp6:
	.loc	2 69 9 prologue_end
	bl	__ZN4core5slice5index27slice_end_index_len_fail_rt17h25958c5858dead63E
Ltmp7:
Lfunc_end33:
	.cfi_endproc

	.p2align	2
__ZN4core5slice5index27slice_end_index_len_fail_rt17h25958c5858dead63E:
Lfunc_begin34:
	.loc	2 75 0
	.cfi_startproc
	stp	x29, x30, [sp, #-16]!
	.cfi_def_cfa_offset 16
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp8:
	.loc	2 76 5 prologue_end
	bl	__ZN4core9panicking9panic_fmt17h3c467ff2c53a52bdE
Ltmp9:
Lfunc_end34:
	.cfi_endproc

	.p2align	2
__ZN4core9panicking5panic17h025c1aaacfe68954E:
Lfunc_begin35:
	.loc	1 108 0
	.cfi_startproc
	stp	x29, x30, [sp, #-16]!
	.cfi_def_cfa_offset 16
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp10:
	.loc	1 115 5 prologue_end
	bl	__ZN4core9panicking9panic_fmt17h3c467ff2c53a52bdE
Ltmp11:
Lfunc_end35:
	.cfi_endproc

	.p2align	2
__ZN4core9panicking19assert_failed_inner17h5eda57dcaa051190E:
Lfunc_begin36:
	.loc	1 227 0
	.cfi_startproc
	stp	x29, x30, [sp, #-16]!
	.cfi_def_cfa_offset 16
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp12:
	.loc	1 0 0 prologue_end
	bl	__ZN4core9panicking9panic_fmt17h3c467ff2c53a52bdE
Ltmp13:
Lfunc_end36:
	.cfi_endproc

	.p2align	2
__ZN6memchr6memchr8fallback6memchr17hff7b08741587b6ebE:
Lfunc_begin37:
	.cfi_startproc
	and	w8, w0, #0xff
	add	x9, x1, x2
	cmp	x2, #7
	b.hi	LBB37_5
	cbz	x2, LBB37_19
	mov	x10, x1
LBB37_3:
	ldrb	w11, [x10]
	cmp	w11, w8
	b.eq	LBB37_20
	add	x10, x10, #1
	cmp	x10, x9
	b.lo	LBB37_3
	b	LBB37_19
LBB37_5:
	and	x10, x0, #0xff
	mov	x11, #72340172838076673
	mul	x11, x10, x11
	mov	x12, #-72340172838076674
	movk	x12, #65279
	ldr	x10, [x1]
	eor	x10, x10, x11
	add	x13, x10, x12
	bic	x10, x13, x10
	tst	x10, #0x8080808080808080
	b.eq	LBB37_10
	cmp	x2, #1
	b.lt	LBB37_19
	mov	x10, x1
LBB37_8:
	ldrb	w11, [x10]
	cmp	w11, w8
	b.eq	LBB37_20
	add	x10, x10, #1
	cmp	x10, x9
	b.lo	LBB37_8
	b	LBB37_19
LBB37_10:
	and	x10, x1, #0xfffffffffffffff8
	add	x10, x10, #8
	cmp	x2, #16
	b.lo	LBB37_15
	sub	x13, x9, #16
	cmp	x10, x13
	b.hi	LBB37_15
LBB37_12:
	ldr	x14, [x10]
	eor	x14, x14, x11
	add	x15, x14, x12
	bic	x14, x15, x14
	tst	x14, #0x8080808080808080
	b.ne	LBB37_15
	ldr	x14, [x10, #8]
	eor	x14, x14, x11
	add	x15, x14, x12
	bic	x14, x15, x14
	tst	x14, #0x8080808080808080
	b.ne	LBB37_15
	add	x10, x10, #16
	cmp	x10, x13
	b.ls	LBB37_12
LBB37_15:
	cmp	x10, x9
	b.hs	LBB37_19
	add	x9, x2, x1
	sub	x9, x9, x10
LBB37_17:
	ldrb	w11, [x10]
	cmp	w11, w8
	b.eq	LBB37_20
	add	x10, x10, #1
	subs	x9, x9, #1
	b.ne	LBB37_17
LBB37_19:
	mov	x0, #0
	ret
LBB37_20:
	sub	x1, x10, x1
	mov	w0, #1
	ret
Lfunc_end37:
	.cfi_endproc

	.p2align	2
__ZN6memchr6memmem9rabinkarp9is_prefix17h4443d732999a128dE:
Lfunc_begin38:
	.cfi_startproc
	cmp	x3, x1
	b.ls	LBB38_2
LBB38_1:
	mov	w0, #0
	ret
LBB38_2:
	subs	x9, x3, #4
	b.hs	LBB38_7
	cbz	x3, LBB38_6
	ldrb	w8, [x0]
	ldrb	w9, [x2]
	cmp	w8, w9
	b.ne	LBB38_1
	cmp	x3, #1
	b.ne	LBB38_12
LBB38_6:
	mov	w0, #1
	ret
LBB38_7:
	add	x8, x9, x0
	cmp	x9, #1
	b.lt	LBB38_11
	mov	x9, x2
LBB38_9:
	ldr	w10, [x0]
	ldr	w11, [x9]
	cmp	w10, w11
	b.ne	LBB38_1
	add	x0, x0, #4
	add	x9, x9, #4
	cmp	x0, x8
	b.lo	LBB38_9
LBB38_11:
	add	x9, x2, x3
	ldr	w8, [x8]
	ldur	w9, [x9, #-4]
	cmp	w8, w9
	cset	w0, eq
	ret
LBB38_12:
	ldrb	w8, [x0, #1]
	ldrb	w9, [x2, #1]
	cmp	w8, w9
	b.ne	LBB38_1
	cmp	x3, #2
	b.eq	LBB38_6
	ldrb	w8, [x0, #2]
	ldrb	w9, [x2, #2]
	cmp	w8, w9
	ccmp	x3, #3, #0, eq
	cset	w0, eq
	ret
Lfunc_end38:
	.cfi_endproc

	.p2align	2
__ZN6memchr6memmem9rabinkarp9is_suffix17h4525791d980a9bb7E:
Lfunc_begin39:
	.cfi_startproc
	subs	x8, x1, x3
	b.hs	LBB39_2
LBB39_1:
	mov	w0, #0
	ret
LBB39_2:
	add	x8, x0, x8
	subs	x10, x3, #4
	b.hs	LBB39_7
	cbz	x3, LBB39_6
	ldrb	w9, [x8]
	ldrb	w10, [x2]
	cmp	w9, w10
	b.ne	LBB39_1
	add	x9, x0, x1
	sub	x9, x9, x8
	cmp	x9, #1
	b.ne	LBB39_12
LBB39_6:
	mov	w0, #1
	ret
LBB39_7:
	add	x9, x10, x8
	cmp	x10, #1
	b.lt	LBB39_11
	mov	x10, x2
LBB39_9:
	ldr	w11, [x8]
	ldr	w12, [x10]
	cmp	w11, w12
	b.ne	LBB39_1
	add	x8, x8, #4
	add	x10, x10, #4
	cmp	x8, x9
	b.lo	LBB39_9
LBB39_11:
	add	x8, x2, x3
	ldr	w9, [x9]
	ldur	w8, [x8, #-4]
	cmp	w9, w8
	cset	w0, eq
	ret
LBB39_12:
	ldrb	w10, [x8, #1]
	ldrb	w11, [x2, #1]
	cmp	w10, w11
	b.ne	LBB39_1
	cmp	x9, #2
	b.eq	LBB39_6
	ldrb	w8, [x8, #2]
	ldrb	w10, [x2, #2]
	cmp	w8, w10
	ccmp	x9, #3, #0, eq
	cset	w0, eq
	ret
Lfunc_end39:
	.cfi_endproc

	.p2align	2
__ZN6memchr6memmem8Searcher7find_tw17hb3196727918d7456E:
Lfunc_begin40:
	.cfi_startproc
	sub	sp, sp, #144
	.cfi_def_cfa_offset 144
	stp	x28, x27, [sp, #48]
	stp	x26, x25, [sp, #64]
	stp	x24, x23, [sp, #80]
	stp	x22, x21, [sp, #96]
	stp	x20, x19, [sp, #112]
	stp	x29, x30, [sp, #128]
	add	x29, sp, #128
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w25, -72
	.cfi_offset w26, -80
	.cfi_offset w27, -88
	.cfi_offset w28, -96
	mov	x20, x6
	mov	x21, x5
	mov	x19, x4
	mov	x22, x3
	ldr	x26, [x0, #16]
	cbz	x26, LBB40_5
	mov	x24, x2
	ldr	w8, [x2]
	cbz	w8, LBB40_5
	sub	w8, w8, #1
	cmp	w8, #50
	b.lo	LBB40_23
	ldr	w9, [x24, #4]
	cmp	w9, w8, lsl #3
	b.hs	LBB40_23
	str	wzr, [x24]
LBB40_5:
	ldp	x8, x11, [x1, #16]
	sub	x12, x20, #1
	cmp	x20, x19
	cbz	x8, LBB40_26
	b.hi	LBB40_72
	mov	x23, #0
	ldp	x10, x9, [x1]
	sub	x13, x9, #1
	b	LBB40_9
LBB40_8:
	add	x23, x8, x23
	mov	x0, #0
	add	x8, x23, x20
	cmp	x8, x19
	b.hi	LBB40_104
LBB40_9:
	add	x0, x12, x23
	cmp	x0, x19
	b.hs	LBB40_112
	add	x8, x20, x23
	add	x8, x22, x8
	ldurb	w8, [x8, #-1]
	lsr	x14, x10, x8
	mov	x8, x20
	tbz	w14, #0, LBB40_8
	cmp	x9, x20
	b.hs	LBB40_16
	add	x14, x22, x23
	mov	x8, x9
LBB40_13:
	add	x15, x23, x8
	cmp	x15, x19
	b.hs	LBB40_110
	ldrb	w15, [x21, x8]
	ldrb	w16, [x14, x8]
	cmp	w15, w16
	b.ne	LBB40_22
	add	x8, x8, #1
	cmp	x20, x8
	b.ne	LBB40_13
LBB40_16:
	add	x14, x22, x23
	mov	x0, x13
LBB40_17:
	cmn	x0, #1
	b.eq	LBB40_103
	cmp	x13, x20
	b.hs	LBB40_106
	add	x8, x23, x0
	cmp	x8, x19
	b.hs	LBB40_109
	ldrb	w8, [x21, x0]
	ldrb	w15, [x14, x0]
	sub	x0, x0, #1
	cmp	w8, w15
	b.eq	LBB40_17
	mov	x8, x11
	b	LBB40_8
LBB40_22:
	sub	x14, x23, x9
	add	x8, x14, x8
	add	x23, x8, #1
	mov	x0, #0
	add	x8, x23, x20
	cmp	x8, x19
	b.ls	LBB40_9
	b	LBB40_104
LBB40_23:
	add	x10, x0, #56
	ldp	x8, x9, [x1, #16]
	stp	x9, x10, [sp, #32]
	sub	x28, x20, #1
	cmp	x20, x19
	cbz	x8, LBB40_71
	b.hi	LBB40_72
	mov	x23, #0
	ldp	x25, x13, [x1]
	sub	x27, x13, #1
	str	x28, [sp, #16]
	b	LBB40_50
LBB40_26:
	b.hi	LBB40_72
	mov	x8, #0
	mov	x9, #0
	ldp	x14, x13, [x1]
	mov	w0, #1
	sub	x15, x0, x13
	sub	x16, x20, x11
	b	LBB40_30
LBB40_28:
	mov	x8, #0
LBB40_29:
	add	x10, x9, x20
	cmp	x10, x19
	b.hi	LBB40_74
LBB40_30:
	mov	x23, x9
	cmp	x13, x8
	csel	x10, x13, x8, hi
	add	x9, x12, x9
	cmp	x9, x19
	b.hs	LBB40_111
	add	x9, x20, x23
	add	x17, x22, x9
	ldurb	w17, [x17, #-1]
	lsr	x17, x14, x17
	tbz	w17, #0, LBB40_28
	cmp	x10, x20
	b.hs	LBB40_37
	add	x9, x22, x23
	mov	x17, x10
LBB40_34:
	add	x1, x23, x17
	cmp	x1, x19
	b.hs	LBB40_105
	ldrb	w1, [x21, x17]
	ldrb	w2, [x9, x17]
	cmp	w1, w2
	b.ne	LBB40_46
	add	x17, x17, #1
	cmp	x20, x17
	b.ne	LBB40_34
LBB40_37:
	cmp	x13, x8
	b.ls	LBB40_43
	add	x17, x22, x23
	mov	x9, x13
LBB40_39:
	cmp	x9, x20
	b.hs	LBB40_107
	add	x10, x23, x9
	cmp	x10, x19
	b.hs	LBB40_108
	ldrb	w10, [x21, x9]
	ldrb	w1, [x17, x9]
	cmp	w10, w1
	b.ne	LBB40_48
	sub	x9, x9, #1
	cmp	x9, x8
	b.hi	LBB40_39
LBB40_43:
	cmp	x8, x20
	b.hs	LBB40_114
	add	x9, x8, x23
	cmp	x9, x19
	b.hs	LBB40_111
	ldrb	w10, [x21, x8]
	ldrb	w17, [x22, x9]
	mov	x9, x11
	mov	x8, x16
	cmp	w10, w17
	b.ne	LBB40_47
	b	LBB40_104
LBB40_46:
	mov	x8, #0
	add	x9, x15, x17
LBB40_47:
	add	x9, x9, x23
	b	LBB40_29
LBB40_48:
	mov	x9, x11
	mov	x8, x16
	add	x9, x11, x23
	b	LBB40_29
LBB40_49:
	add	x23, x8, x23
	mov	x0, #0
	add	x8, x23, x20
	cmp	x8, x19
	b.hi	LBB40_104
LBB40_50:
	ldr	w8, [x24]
	cbz	w8, LBB40_57
	sub	w8, w8, #1
	cmp	w8, #50
	b.lo	LBB40_54
	ldr	w9, [x24, #4]
	cmp	w9, w8, lsl #3
	b.hs	LBB40_54
	str	wzr, [x24]
	b	LBB40_57
LBB40_54:
	cmp	x23, x19
	b.hi	LBB40_115
	mov	x28, x13
	add	x2, x22, x23
	sub	x3, x19, x23
	mov	x0, x24
	ldr	x1, [sp, #40]
	mov	x4, x21
	mov	x5, x20
	blr	x26
	cbz	x0, LBB40_73
	add	x23, x1, x23
	add	x8, x23, x20
	cmp	x8, x19
	mov	x13, x28
	ldr	x28, [sp, #16]
	b.hi	LBB40_72
LBB40_57:
	add	x0, x28, x23
	cmp	x0, x19
	b.hs	LBB40_112
	add	x8, x20, x23
	add	x8, x22, x8
	ldurb	w8, [x8, #-1]
	lsr	x9, x25, x8
	mov	x8, x20
	tbz	w9, #0, LBB40_49
	cmp	x13, x20
	b.hs	LBB40_64
	add	x9, x22, x23
	mov	x8, x13
LBB40_61:
	add	x10, x23, x8
	cmp	x10, x19
	b.hs	LBB40_113
	ldrb	w10, [x21, x8]
	ldrb	w11, [x9, x8]
	cmp	w10, w11
	b.ne	LBB40_70
	add	x8, x8, #1
	cmp	x20, x8
	b.ne	LBB40_61
LBB40_64:
	add	x9, x22, x23
	mov	x0, x27
LBB40_65:
	cmn	x0, #1
	b.eq	LBB40_103
	cmp	x27, x20
	b.hs	LBB40_106
	add	x8, x23, x0
	cmp	x8, x19
	b.hs	LBB40_109
	ldrb	w8, [x21, x0]
	ldrb	w10, [x9, x0]
	sub	x0, x0, #1
	cmp	w8, w10
	b.eq	LBB40_65
	ldr	x8, [sp, #32]
	b	LBB40_49
LBB40_70:
	sub	x9, x23, x13
	add	x8, x9, x8
	add	x23, x8, #1
	mov	x0, #0
	add	x8, x23, x20
	cmp	x8, x19
	b.ls	LBB40_50
	b	LBB40_104
LBB40_71:
	b.ls	LBB40_75
LBB40_72:
	mov	x0, #0
LBB40_73:
	b	LBB40_104
LBB40_74:
	mov	x0, #0
	b	LBB40_104
LBB40_75:
	mov	x23, #0
	mov	x8, #0
	ldp	x25, x27, [x1]
	mov	w9, #1
	sub	x9, x9, x27
	str	x9, [sp, #8]
	ldr	x9, [sp, #32]
	sub	x9, x20, x9
	str	x9, [sp, #24]
	b	LBB40_77
LBB40_76:
	mov	x8, #0
	mov	x23, x10
	mov	x0, #0
	add	x9, x10, x20
	cmp	x9, x19
	b.hi	LBB40_104
LBB40_77:
	cmp	x27, x8
	csel	x9, x27, x8, hi
	ldr	w10, [x24]
	cbz	w10, LBB40_84
	sub	w10, w10, #1
	cmp	w10, #50
	b.lo	LBB40_81
	ldr	w11, [x24, #4]
	cmp	w11, w10, lsl #3
	b.hs	LBB40_81
	str	wzr, [x24]
	b	LBB40_84
LBB40_81:
	cmp	x23, x19
	b.hi	LBB40_115
	add	x2, x22, x23
	sub	x3, x19, x23
	mov	x0, x24
	ldr	x1, [sp, #40]
	mov	x4, x21
	mov	x5, x20
	blr	x26
	cbz	x0, LBB40_73
	mov	x8, #0
	mov	x0, #0
	add	x23, x1, x23
	add	x10, x23, x20
	mov	x9, x27
	cmp	x10, x19
	b.hi	LBB40_104
LBB40_84:
	add	x0, x28, x23
	cmp	x0, x19
	b.hs	LBB40_112
	add	x10, x20, x23
	add	x11, x22, x10
	ldurb	w11, [x11, #-1]
	lsr	x11, x25, x11
	tbz	w11, #0, LBB40_76
	cmp	x9, x20
	b.hs	LBB40_91
	add	x10, x22, x23
	mov	x11, x9
LBB40_88:
	add	x12, x23, x11
	cmp	x12, x19
	b.hs	LBB40_110
	ldrb	w12, [x21, x11]
	ldrb	w13, [x10, x11]
	cmp	w12, w13
	b.ne	LBB40_101
	add	x11, x11, #1
	cmp	x20, x11
	b.ne	LBB40_88
LBB40_91:
	cmp	x27, x8
	b.ls	LBB40_97
	add	x10, x22, x23
	mov	x0, x27
LBB40_93:
	cmp	x0, x20
	b.hs	LBB40_106
	add	x9, x23, x0
	cmp	x9, x19
	b.hs	LBB40_111
	ldrb	w9, [x21, x0]
	ldrb	w11, [x10, x0]
	cmp	w9, w11
	b.ne	LBB40_102
	sub	x0, x0, #1
	cmp	x0, x8
	b.hi	LBB40_93
LBB40_97:
	cmp	x8, x20
	b.hs	LBB40_114
	add	x0, x23, x8
	cmp	x0, x19
	b.hs	LBB40_112
	ldrb	w10, [x21, x8]
	ldrb	w11, [x22, x0]
	ldp	x8, x9, [sp, #24]
	cmp	w10, w11
	b.eq	LBB40_103
	add	x23, x9, x23
	mov	x0, #0
	add	x9, x23, x20
	cmp	x9, x19
	b.ls	LBB40_77
	b	LBB40_104
LBB40_101:
	mov	x8, #0
	ldr	x9, [sp, #8]
	add	x9, x9, x11
	add	x23, x9, x23
	mov	x0, #0
	add	x9, x23, x20
	cmp	x9, x19
	b.ls	LBB40_77
	b	LBB40_104
LBB40_102:
	ldp	x8, x9, [sp, #24]
	add	x23, x9, x23
	mov	x0, #0
	add	x9, x23, x20
	cmp	x9, x19
	b.ls	LBB40_77
	b	LBB40_104
LBB40_103:
	mov	w0, #1
LBB40_104:
	mov	x1, x23
	ldp	x29, x30, [sp, #128]
	ldp	x20, x19, [sp, #112]
	ldp	x22, x21, [sp, #96]
	ldp	x24, x23, [sp, #80]
	ldp	x26, x25, [sp, #64]
	ldp	x28, x27, [sp, #48]
	add	sp, sp, #144
	ret
LBB40_105:
	add	x8, x10, x23
	cmp	x19, x8
	csel	x0, x19, x8, hi
	mov	x1, x19
	bl	__ZN4core9panicking18panic_bounds_check17hc99fca025e30adc5E
LBB40_106:
	mov	x1, x20
	bl	__ZN4core9panicking18panic_bounds_check17hc99fca025e30adc5E
LBB40_107:
	mov	x0, x9
	mov	x1, x20
	bl	__ZN4core9panicking18panic_bounds_check17hc99fca025e30adc5E
LBB40_108:
	mov	x0, x10
	mov	x1, x19
	bl	__ZN4core9panicking18panic_bounds_check17hc99fca025e30adc5E
LBB40_109:
	mov	x0, x8
	mov	x1, x19
	bl	__ZN4core9panicking18panic_bounds_check17hc99fca025e30adc5E
LBB40_110:
	add	x8, x9, x23
	cmp	x19, x8
	csel	x0, x19, x8, hi
	mov	x1, x19
	bl	__ZN4core9panicking18panic_bounds_check17hc99fca025e30adc5E
LBB40_111:
	mov	x0, x9
LBB40_112:
	mov	x1, x19
	bl	__ZN4core9panicking18panic_bounds_check17hc99fca025e30adc5E
LBB40_113:
	add	x8, x13, x23
	cmp	x19, x8
	csel	x0, x19, x8, hi
	mov	x1, x19
	bl	__ZN4core9panicking18panic_bounds_check17hc99fca025e30adc5E
LBB40_114:
	mov	x0, x8
	mov	x1, x20
	bl	__ZN4core9panicking18panic_bounds_check17hc99fca025e30adc5E
LBB40_115:
	mov	x0, x23
	mov	x1, x19
	bl	__ZN4core5slice5index24slice_end_index_len_fail17h1f02670a3f073468E
Lfunc_end40:
	.cfi_endproc

	.section	__TEXT,__literal8,8byte_literals
	.p2align	3
lCPI41_0:
	.long	0
	.long	1
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	2
__ZN6memchr6memmem8Searcher3new17hc47f917c31dc34b3E:
Lfunc_begin41:
	.cfi_startproc
	sub	sp, sp, #96
	.cfi_def_cfa_offset 96
	stp	x20, x19, [sp, #64]
	stp	x29, x30, [sp, #80]
	add	x29, sp, #80
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	sub	x8, x2, #256
	cmn	x8, #254
	b.hs	LBB41_2
	mov	w10, #0
	mov	w11, #0
	b	LBB41_14
LBB41_2:
	mov	x14, #0
	mov	w17, #0
	ldrb	w11, [x1]
	ldrb	w12, [x1, #1]
Lloh0:
	adrp	x8, l_anon.c4844762a8b45121015785f26c622596.15@PAGE
Lloh1:
	add	x8, x8, l_anon.c4844762a8b45121015785f26c622596.15@PAGEOFF
	ldrb	w9, [x8, w12, uxtw]
	ldrb	w10, [x8, w11, uxtw]
	mov	w13, #1
	mov	w15, #1
	cmp	w9, w10
	csel	w10, wzr, w13, lo
	csel	w9, w15, wzr, lo
	csel	w5, w11, w12, lo
	csel	w12, w12, w11, lo
	add	x13, x1, x2
	mov	w16, #2
	mov	x15, x1
LBB41_3:
	mov	x11, x9
	mov	w3, w12
	mov	x4, x5
	mov	w5, w5
LBB41_4:
	tbz	w17, #0, LBB41_7
	mov	x6, x14
	cmp	x15, x13
	b.eq	LBB41_13
	ldrb	w4, [x15], #1
	add	x14, x6, #1
	ldrb	w7, [x8, w4, uxtw]
	ldrb	w16, [x8, x3]
	cmp	w7, w16
	b.hs	LBB41_9
	b	LBB41_12
LBB41_7:
	sub	x17, x13, x15
	cmp	x17, x16
	b.ls	LBB41_13
	add	x15, x15, x16
	add	x6, x16, x14
	ldrb	w4, [x15], #1
	add	x14, x6, #1
	ldrb	w7, [x8, w4, uxtw]
	ldrb	w16, [x8, x3]
	cmp	w7, w16
	b.lo	LBB41_12
LBB41_9:
	mov	x16, #0
	mov	w17, #1
	cmp	w4, w3
	b.eq	LBB41_4
	mov	x16, #0
	ldrb	w19, [x8, x5]
	mov	w17, #1
	cmp	w7, w19
	b.hs	LBB41_4
	mov	x16, #0
	and	w10, w6, #0xff
	mov	w17, #1
	mov	w5, w4
	b	LBB41_4
LBB41_12:
	mov	x16, #0
	and	w9, w6, #0xff
	mov	w17, #1
	mov	x10, x11
	mov	x5, x12
	mov	x12, x4
	b	LBB41_3
LBB41_13:
	strb	w10, [sp, #15]
	strb	w9, [sp, #14]
	cmp	w11, w10
	b.eq	LBB41_69
LBB41_14:
	cbz	x2, LBB41_23
	mov	w16, #0
	add	x8, x1, x2
	ldrb	w9, [x1]
	mov	w15, #1
	mov	x14, x1
	mov	w12, #1
	mov	x13, x9
	b	LBB41_18
LBB41_16:
	cmp	x14, x8
	b.eq	LBB41_21
LBB41_17:
	mov	x15, #0
	ldrb	w16, [x14], #1
	add	w13, w16, w13, lsl #1
	lsl	w12, w12, #1
	mov	w16, #1
LBB41_18:
	tbnz	w16, #0, LBB41_16
	sub	x16, x8, x14
	cmp	x16, x15
	b.ls	LBB41_21
	add	x14, x14, x15
	b	LBB41_17
LBB41_21:
	cmp	x2, #1
	b.ne	LBB41_25
	mov	x8, #0
	stp	w13, w12, [x0, #56]
	strb	w11, [x0, #64]
	strb	w10, [x0, #65]
	strb	w9, [x0, #24]
	mov	w9, #3
	b	LBB41_24
LBB41_23:
	mov	x8, #0
Lloh2:
	adrp	x9, lCPI41_0@PAGE
Lloh3:
	ldr	d0, [x9, lCPI41_0@PAGEOFF]
	str	d0, [x0, #56]
	strb	w11, [x0, #64]
	strb	w10, [x0, #65]
	mov	w9, #2
LBB41_24:
	str	x9, [x0, #40]
	stp	x1, x2, [x0]
	str	x8, [x0, #16]
	ldp	x29, x30, [sp, #80]
	ldp	x20, x19, [sp, #64]
	add	sp, sp, #96
	ret
LBB41_25:
	cmp	x2, #8
	b.hs	LBB41_27
	mov	x14, #0
	mov	x15, x1
	b	LBB41_37
LBB41_27:
	cmp	x2, #16
	b.hs	LBB41_32
	mov	x14, #0
	mov	x9, #0
LBB41_29:
	and	x16, x2, #0xfffffffffffffff8
	add	x15, x1, x16
	movi.2d	v0, #0000000000000000
	movi.2d	v1, #0000000000000000
	mov.d	v1[0], x14
	sub	x14, x9, x16
	add	x9, x1, x9
	movi.8b	v2, #63
	mov	w17, #1
	dup.2d	v3, x17
	movi.2d	v4, #0000000000000000
	movi.2d	v5, #0000000000000000
LBB41_30:
	ldr	d6, [x9], #8
	and.8b	v6, v6, v2
	ushll.8h	v6, v6, #0
	ushll2.4s	v7, v6, #0
	ushll2.2d	v16, v7, #0
	ushll.2d	v7, v7, #0
	ushll.4s	v6, v6, #0
	ushll2.2d	v17, v6, #0
	ushll.2d	v6, v6, #0
	ushl.2d	v6, v3, v6
	ushl.2d	v17, v3, v17
	ushl.2d	v7, v3, v7
	ushl.2d	v16, v3, v16
	orr.16b	v5, v16, v5
	orr.16b	v4, v7, v4
	orr.16b	v0, v17, v0
	orr.16b	v1, v6, v1
	adds	x14, x14, #8
	b.ne	LBB41_30
	orr.16b	v1, v1, v4
	orr.16b	v0, v0, v5
	orr.16b	v0, v1, v0
	ext.16b	v1, v0, v0, #8
	orr.8b	v0, v0, v1
	fmov	x14, d0
	cmp	x16, x2
	b.ne	LBB41_37
	b	LBB41_39
LBB41_32:
	movi.2d	v0, #0000000000000000
	movi.16b	v1, #63
	mov	w9, #1
	dup.2d	v3, x9
	and	x9, x2, #0xfffffffffffffff0
	movi.2d	v2, #0000000000000000
	mov	x14, x1
	mov	x15, x9
	movi.2d	v5, #0000000000000000
	movi.2d	v4, #0000000000000000
	movi.2d	v16, #0000000000000000
	movi.2d	v6, #0000000000000000
	movi.2d	v17, #0000000000000000
	movi.2d	v7, #0000000000000000
LBB41_33:
	ldr	q18, [x14], #16
	and.16b	v18, v18, v1
	ushll2.8h	v19, v18, #0
	ushll2.4s	v20, v19, #0
	ushll2.2d	v21, v20, #0
	ushll.2d	v20, v20, #0
	ushll.4s	v19, v19, #0
	ushll2.2d	v22, v19, #0
	ushll.8h	v18, v18, #0
	ushll2.4s	v23, v18, #0
	ushll2.2d	v24, v23, #0
	ushll.2d	v19, v19, #0
	ushll.2d	v23, v23, #0
	ushll.4s	v18, v18, #0
	ushll2.2d	v25, v18, #0
	ushll.2d	v18, v18, #0
	ushl.2d	v18, v3, v18
	ushl.2d	v25, v3, v25
	ushl.2d	v23, v3, v23
	ushl.2d	v19, v3, v19
	ushl.2d	v24, v3, v24
	ushl.2d	v22, v3, v22
	ushl.2d	v20, v3, v20
	ushl.2d	v21, v3, v21
	orr.16b	v7, v21, v7
	orr.16b	v17, v20, v17
	orr.16b	v6, v22, v6
	orr.16b	v4, v24, v4
	orr.16b	v16, v19, v16
	orr.16b	v5, v23, v5
	orr.16b	v2, v25, v2
	orr.16b	v0, v18, v0
	subs	x15, x15, #16
	b.ne	LBB41_33
	orr.16b	v0, v0, v16
	orr.16b	v1, v5, v17
	orr.16b	v0, v0, v1
	orr.16b	v1, v2, v6
	orr.16b	v2, v4, v7
	orr.16b	v1, v1, v2
	orr.16b	v0, v0, v1
	ext.16b	v1, v0, v0, #8
	orr.8b	v0, v0, v1
	fmov	x14, d0
	cmp	x9, x2
	b.eq	LBB41_39
	tbnz	w2, #3, LBB41_29
	add	x15, x1, x9
LBB41_37:
	mov	w9, #1
LBB41_38:
	ldrb	w16, [x15], #1
	lsl	x16, x9, x16
	orr	x14, x16, x14
	cmp	x15, x8
	b.ne	LBB41_38
LBB41_39:
	cmp	x2, #2
	b.lo	LBB41_46
	mov	x9, #0
	mov	x17, #0
	mov	w16, #1
	mov	w4, #1
	mov	w15, #1
	mov	w3, #1
LBB41_41:
	add	x8, x17, x9
	cmp	x8, x2
	b.hs	LBB41_67
	ldrb	w8, [x1, x8]
	ldrb	w4, [x1, x4]
	add	x17, x17, #1
	add	x5, x17, x3
	sub	x6, x5, x9
	cmp	x17, x15
	csel	x17, xzr, x17, eq
	csel	x7, x15, xzr, eq
	add	x7, x7, x3
	cmp	w4, w8
	csel	x8, xzr, x17, hi
	csel	x4, x5, x7, hi
	csel	x15, x6, x15, hi
	csel	x17, xzr, x8, lo
	csel	x9, x3, x9, lo
	csinc	x3, x4, x3, hs
	csel	x15, x16, x15, lo
	add	x4, x3, x17
	cmp	x4, x2
	b.lo	LBB41_41
	mov	x16, #0
	mov	x4, #0
	mov	w3, #1
	mov	w6, #1
	mov	w17, #1
	mov	w5, #1
LBB41_44:
	add	x8, x4, x16
	cmp	x8, x2
	b.hs	LBB41_67
	ldrb	w8, [x1, x8]
	ldrb	w6, [x1, x6]
	add	x4, x4, #1
	cmp	x4, x17
	csel	x7, xzr, x4, eq
	csel	x19, x17, xzr, eq
	add	x19, x19, x5
	add	x4, x4, x5
	sub	x20, x4, x16
	cmp	w6, w8
	csel	x8, x7, xzr, hs
	csel	x6, x19, x4, hs
	csel	x17, x17, x20, hs
	csel	x4, xzr, x8, hi
	csel	x16, x5, x16, hi
	csinc	x5, x6, x5, ls
	csel	x17, x3, x17, hi
	add	x6, x5, x4
	cmp	x6, x2
	b.lo	LBB41_44
	b	LBB41_47
LBB41_46:
	mov	x9, #0
	mov	x16, #0
	mov	w15, #1
	mov	w17, #1
LBB41_47:
	cmp	x9, x16
	csel	x8, x15, x17, hi
	csel	x15, x9, x16, hi
	sub	x9, x2, x15
	cmp	x15, x9
	csel	x16, x15, x9, hi
	cmp	x2, x15, lsl #1
	b.ls	LBB41_51
	cmp	x15, x2
	b.hi	LBB41_70
	cmp	x9, x8
	b.lo	LBB41_71
	cmp	x8, x15
	b.hs	LBB41_53
LBB41_51:
	mov	w17, #1
	cmp	x2, #2
	b.hs	LBB41_63
LBB41_52:
	mov	x8, #0
	b	LBB41_66
LBB41_53:
	cmp	x15, #3
	b.hi	LBB41_57
	mov	x9, x15
	mov	x17, x1
LBB41_55:
	cbz	x9, LBB41_62
	ldrb	w3, [x17, x8]
	ldrb	w4, [x17], #1
	sub	x9, x9, #1
	cmp	w3, w4
	b.eq	LBB41_55
	b	LBB41_51
LBB41_57:
	sub	x17, x15, #4
	add	x9, x1, x8
	add	x9, x17, x9
	cmp	x17, #1
	b.lt	LBB41_61
	mov	x17, x1
LBB41_59:
	ldr	w3, [x17, x8]
	ldr	w4, [x17]
	cmp	w3, w4
	b.ne	LBB41_51
	add	x17, x17, #4
	add	x3, x17, x8
	cmp	x3, x9
	b.lo	LBB41_59
LBB41_61:
	add	x17, x1, x15
	ldr	w9, [x9]
	ldur	w17, [x17, #-4]
	cmp	w9, w17
	b.ne	LBB41_51
LBB41_62:
	mov	x17, #0
	mov	x16, x8
	cmp	x2, #2
	b.lo	LBB41_52
LBB41_63:
	mov	w8, w11
	cmp	x8, x2
	b.hs	LBB41_67
	mov	w9, w10
	cmp	x9, x2
	b.hs	LBB41_68
	ldrb	w8, [x1, x8]
Lloh4:
	adrp	x9, l_anon.c4844762a8b45121015785f26c622596.15@PAGE
Lloh5:
	add	x9, x9, l_anon.c4844762a8b45121015785f26c622596.15@PAGEOFF
	ldrb	w8, [x9, x8]
Lloh6:
	adrp	x9, __ZN6memchr6memmem9prefilter8fallback4find17ha99763d1b80e9dc7E@PAGE
Lloh7:
	add	x9, x9, __ZN6memchr6memmem9prefilter8fallback4find17ha99763d1b80e9dc7E@PAGEOFF
	cmp	w8, #251
	csel	x8, x9, xzr, lo
LBB41_66:
	stp	w13, w12, [x0, #56]
	strb	w11, [x0, #64]
	strb	w10, [x0, #65]
	stp	x14, x15, [x0, #24]
	stp	x17, x16, [x0, #40]
	stp	x1, x2, [x0]
	str	x8, [x0, #16]
	ldp	x29, x30, [sp, #80]
	ldp	x20, x19, [sp, #64]
	add	sp, sp, #96
	ret
LBB41_67:
	mov	x0, x8
	mov	x1, x2
	bl	__ZN4core9panicking18panic_bounds_check17hc99fca025e30adc5E
LBB41_68:
	mov	x0, x9
	mov	x1, x2
	bl	__ZN4core9panicking18panic_bounds_check17hc99fca025e30adc5E
LBB41_69:
	str	xzr, [sp, #16]
	add	x0, sp, #14
	add	x1, sp, #15
	add	x2, sp, #16
	bl	__ZN4core9panicking13assert_failed17h98e2779db10c9bceE
LBB41_70:
	bl	__ZN4core9panicking5panic17h025c1aaacfe68954E
LBB41_71:
	mov	x0, x8
	mov	x1, x9
	bl	__ZN4core5slice5index24slice_end_index_len_fail17h1f02670a3f073468E
	.loh AdrpAdd	Lloh0, Lloh1
	.loh AdrpLdr	Lloh2, Lloh3
	.loh AdrpAdd	Lloh6, Lloh7
	.loh AdrpAdd	Lloh4, Lloh5
Lfunc_end41:
	.cfi_endproc

	.p2align	2
__ZN4core9panicking13assert_failed17h98e2779db10c9bceE:
Lfunc_begin42:
	.cfi_startproc
	sub	sp, sp, #80
	.cfi_def_cfa_offset 80
	stp	x29, x30, [sp, #64]
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stp	x0, x1, [sp]
	ldp	q0, q1, [x2]
	stp	q0, q1, [sp, #16]
	ldr	q0, [x2, #32]
	str	q0, [sp, #48]
	mov	x0, sp
	add	x1, sp, #8
	add	x2, sp, #16
	bl	__ZN4core9panicking19assert_failed_inner17h5eda57dcaa051190E
Lfunc_end42:
	.cfi_endproc

	.p2align	2
__ZN6memchr6memmem9prefilter8fallback4find17ha99763d1b80e9dc7E:
Lfunc_begin43:
	.cfi_startproc
	stp	x28, x27, [sp, #-96]!
	.cfi_def_cfa_offset 96
	stp	x26, x25, [sp, #16]
	stp	x24, x23, [sp, #32]
	stp	x22, x21, [sp, #48]
	stp	x20, x19, [sp, #64]
	stp	x29, x30, [sp, #80]
	add	x29, sp, #80
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w25, -72
	.cfi_offset w26, -80
	.cfi_offset w27, -88
	.cfi_offset w28, -96
	ldrb	w19, [x1, #8]
	cmp	x19, x5
	b.hs	LBB43_18
	ldrb	w24, [x1, #9]
	cmp	x24, x5
	b.hs	LBB43_19
	mov	x22, x0
	ldr	w27, [x0]
	cbz	w27, LBB43_14
	mov	x20, x3
	mov	x23, x2
	mov	x26, #0
	ldrb	w25, [x4, x19]
	ldrb	w28, [x4, x24]
	mov	w21, #1
	b	LBB43_5
LBB43_4:
	add	x26, x8, #1
LBB43_5:
	sub	w8, w27, #1
	cmp	w8, #50
	b.lo	LBB43_7
	ldr	w9, [x22, #4]
	cmp	w9, w8, lsl #3
	b.lo	LBB43_15
LBB43_7:
	cmp	x26, x20
	b.hi	LBB43_20
	b.eq	LBB43_13
	sub	x2, x20, x26
	add	x1, x23, x26
	mov	x0, x25
	bl	__ZN6memchr6memchr8fallback6memchr17hff7b08741587b6ebE
	cbz	x0, LBB43_13
	adds	w8, w27, #1
	csinv	w27, w8, wzr, lo
	ldr	w8, [x22, #4]
	adds	w8, w8, w1
	csinv	w8, w8, wzr, lo
	lsr	x9, x1, #32
	cmp	x9, #0
	csinv	w8, w8, wzr, eq
	stp	w27, w8, [x22]
	add	x8, x1, x26
	subs	x1, x8, x19
	b.lo	LBB43_4
	add	x9, x1, x24
	cmp	x9, x20
	b.hs	LBB43_4
	ldrb	w9, [x23, x9]
	cmp	w9, w28
	b.ne	LBB43_4
	b	LBB43_17
LBB43_13:
	mov	x21, #0
	b	LBB43_17
LBB43_14:
	mov	x26, #0
	b	LBB43_16
LBB43_15:
	str	wzr, [x22]
LBB43_16:
	subs	x8, x26, x19
	csel	x1, xzr, x8, lo
	mov	w21, #1
LBB43_17:
	mov	x0, x21
	ldp	x29, x30, [sp, #80]
	ldp	x20, x19, [sp, #64]
	ldp	x22, x21, [sp, #48]
	ldp	x24, x23, [sp, #32]
	ldp	x26, x25, [sp, #16]
	ldp	x28, x27, [sp], #96
	ret
LBB43_18:
	mov	x0, x19
	mov	x1, x5
	bl	__ZN4core9panicking18panic_bounds_check17hc99fca025e30adc5E
LBB43_19:
	mov	x0, x24
	mov	x1, x5
	bl	__ZN4core9panicking18panic_bounds_check17hc99fca025e30adc5E
LBB43_20:
	mov	x0, x26
	mov	x1, x20
	bl	__ZN4core5slice5index24slice_end_index_len_fail17h1f02670a3f073468E
Lfunc_end43:
	.cfi_endproc

	.section	__TEXT,__const
l_anon.c4844762a8b45121015785f26c622596.15:
	.ascii	"743210/.-g\362BC\345,+*)('&%$#\"!8 \037\036\035\034\377\224\244\225\210\240\233\255\335\336\206z\350\312\327\340\320\334\314\273\267\263\261\250\262\310\342\303\232\270\256~x\277\235\302\252\275\242\241\226\301\216\211\253\260\271\247\272p\257\300\274\234\214\217{\205\200\223\212\222r\337\227\371\330\356\354\375\343\332\346\367\207\264\361\351\366\364\347\213\365\363\373\353\311\304\360\326\230\266\315\265\177\033\324\323\322\325\344\305\251\237\203\254iPb`aQ\317\221ts\220\202\231yk\204mn|oRlv\215q\201w}\245u\\jSHc]AO\246\355\243\307\276\341\321\313\306\331\333\316\352\370\236\357\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377"

	.section	__DWARF,__debug_abbrev,regular,debug
Lsection_abbrev:
	.byte	1
	.byte	17
	.byte	1
	.byte	37
	.byte	14
	.byte	19
	.byte	5
	.byte	3
	.byte	14
	.byte	16
	.byte	6
	.byte	27
	.byte	14
	.ascii	"\341\177"
	.byte	12
	.byte	17
	.byte	1
	.byte	18
	.byte	1
	.byte	0
	.byte	0
	.byte	2
	.byte	57
	.byte	1
	.byte	3
	.byte	14
	.byte	0
	.byte	0
	.byte	3
	.byte	46
	.byte	0
	.byte	17
	.byte	1
	.byte	18
	.byte	1
	.ascii	"\347\177"
	.byte	12
	.byte	64
	.byte	10
	.ascii	"\207@"
	.byte	14
	.byte	3
	.byte	14
	.byte	58
	.byte	11
	.byte	59
	.byte	11
	.byte	63
	.byte	12
	.ascii	"\341\177"
	.byte	12
	.ascii	"\207\001"
	.byte	12
	.byte	0
	.byte	0
	.byte	4
	.byte	46
	.byte	0
	.byte	17
	.byte	1
	.byte	18
	.byte	1
	.byte	64
	.byte	10
	.ascii	"\207@"
	.byte	14
	.byte	3
	.byte	14
	.byte	58
	.byte	11
	.byte	59
	.byte	11
	.byte	63
	.byte	12
	.ascii	"\341\177"
	.byte	12
	.ascii	"\207\001"
	.byte	12
	.byte	0
	.byte	0
	.byte	5
	.byte	46
	.byte	0
	.byte	17
	.byte	1
	.byte	18
	.byte	1
	.byte	64
	.byte	10
	.ascii	"\207@"
	.byte	14
	.byte	3
	.byte	14
	.byte	58
	.byte	11
	.byte	59
	.byte	11
	.byte	54
	.byte	11
	.byte	63
	.byte	12
	.ascii	"\341\177"
	.byte	12
	.ascii	"\207\001"
	.byte	12
	.byte	0
	.byte	0
	.byte	0
	.section	__DWARF,__debug_info,regular,debug
Lsection_info:
Lcu_begin0:
.set Lset0, Ldebug_info_end0-Ldebug_info_start0
	.long	Lset0
Ldebug_info_start0:
	.short	2
.set Lset1, Lsection_abbrev-Lsection_abbrev
	.long	Lset1
	.byte	8
	.byte	1
	.long	0
	.short	28
	.long	65
.set Lset2, Lline_table_start0-Lsection_line
	.long	Lset2
	.long	111
	.byte	1
	.quad	Lfunc_begin31
	.quad	Lfunc_end36
	.byte	2
	.long	159
	.byte	2
	.long	164
	.byte	3
	.quad	Lfunc_begin31
	.quad	Lfunc_end31
	.byte	1
	.byte	1
	.byte	111
	.long	184
	.long	174
	.byte	1
	.byte	50
	.byte	1
	.byte	1
	.byte	1
	.byte	4
	.quad	Lfunc_begin32
	.quad	Lfunc_end32
	.byte	1
	.byte	109
	.long	252
	.long	233
	.byte	1
	.byte	146
	.byte	1
	.byte	1
	.byte	1
	.byte	5
	.quad	Lfunc_begin35
	.quad	Lfunc_end35
	.byte	1
	.byte	109
	.long	519
	.long	513
	.byte	1
	.byte	108
	.byte	3
	.byte	1
	.byte	1
	.byte	1
	.byte	5
	.quad	Lfunc_begin36
	.quad	Lfunc_end36
	.byte	1
	.byte	109
	.long	584
	.long	564
	.byte	1
	.byte	227
	.byte	3
	.byte	1
	.byte	1
	.byte	1
	.byte	0
	.byte	2
	.long	311
	.byte	2
	.long	317
	.byte	5
	.quad	Lfunc_begin33
	.quad	Lfunc_end33
	.byte	1
	.byte	109
	.long	348
	.long	323
	.byte	2
	.byte	66
	.byte	3
	.byte	1
	.byte	1
	.byte	1
	.byte	5
	.quad	Lfunc_begin34
	.quad	Lfunc_end34
	.byte	1
	.byte	109
	.long	443
	.long	415
	.byte	2
	.byte	75
	.byte	3
	.byte	1
	.byte	1
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
Ldebug_info_end0:
	.section	__TEXT,__text,regular,pure_instructions
Lsec_end0:
	.section	__DWARF,__debug_aranges,regular,debug
	.long	44
	.short	2
.set Lset3, Lcu_begin0-Lsection_info
	.long	Lset3
	.byte	8
	.byte	0
	.space	4,255
	.quad	Lfunc_begin31
.set Lset4, Lsec_end0-Lfunc_begin31
	.quad	Lset4
	.quad	0
	.quad	0
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"clang LLVM (rustc version 1.66.0-nightly (bed4ad65b 2022-10-25))"
	.asciz	"library/core/src/lib.rs/@/core.dbc0a12c-cgu.0"
	.asciz	"/rustc/bed4ad65bf7a1cef39e3d66b3670189581b3b073"
	.asciz	"core"
	.asciz	"panicking"
	.asciz	"panic_fmt"
	.asciz	"_ZN4core9panicking9panic_fmt17h3c467ff2c53a52bdE"
	.asciz	"panic_bounds_check"
	.asciz	"_ZN4core9panicking18panic_bounds_check17hc99fca025e30adc5E"
	.asciz	"slice"
	.asciz	"index"
	.asciz	"slice_end_index_len_fail"
	.asciz	"_ZN4core5slice5index24slice_end_index_len_fail17h1f02670a3f073468E"
	.asciz	"slice_end_index_len_fail_rt"
	.asciz	"_ZN4core5slice5index27slice_end_index_len_fail_rt17h25958c5858dead63E"
	.asciz	"panic"
	.asciz	"_ZN4core9panicking5panic17h025c1aaacfe68954E"
	.asciz	"assert_failed_inner"
	.asciz	"_ZN4core9panicking19assert_failed_inner17h5eda57dcaa051190E"
	.section	__DWARF,__apple_names,regular,debug
Lnames_begin:
	.long	1212240712
	.short	1
	.short	0
	.long	12
	.long	12
	.long	12
	.long	0
	.long	1
	.short	1
	.short	6
	.long	0
	.long	1
	.long	-1
	.long	3
	.long	4
	.long	-1
	.long	5
	.long	6
	.long	7
	.long	-1
	.long	8
	.long	10
	.long	308895672
	.long	1119397153
	.long	-418582923
	.long	-71304361
	.long	1861953376
	.long	-114029194
	.long	-1542549129
	.long	270584624
	.long	2099821462
	.long	-868969782
	.long	210993659
	.long	-1344833981
.set Lset5, LNames3-Lnames_begin
	.long	Lset5
.set Lset6, LNames9-Lnames_begin
	.long	Lset6
.set Lset7, LNames0-Lnames_begin
	.long	Lset7
.set Lset8, LNames2-Lnames_begin
	.long	Lset8
.set Lset9, LNames8-Lnames_begin
	.long	Lset9
.set Lset10, LNames4-Lnames_begin
	.long	Lset10
.set Lset11, LNames7-Lnames_begin
	.long	Lset11
.set Lset12, LNames5-Lnames_begin
	.long	Lset12
.set Lset13, LNames1-Lnames_begin
	.long	Lset13
.set Lset14, LNames11-Lnames_begin
	.long	Lset14
.set Lset15, LNames6-Lnames_begin
	.long	Lset15
.set Lset16, LNames10-Lnames_begin
	.long	Lset16
LNames3:
	.long	348
	.long	1
	.long	199
	.long	0
LNames9:
	.long	252
	.long	1
	.long	90
	.long	0
LNames0:
	.long	443
	.long	1
	.long	232
	.long	0
LNames2:
	.long	233
	.long	1
	.long	90
	.long	0
LNames8:
	.long	415
	.long	1
	.long	232
	.long	0
LNames4:
	.long	564
	.long	1
	.long	155
	.long	0
LNames7:
	.long	519
	.long	1
	.long	122
	.long	0
LNames5:
	.long	513
	.long	1
	.long	122
	.long	0
LNames1:
	.long	174
	.long	1
	.long	57
	.long	0
LNames11:
	.long	584
	.long	1
	.long	155
	.long	0
LNames6:
	.long	323
	.long	1
	.long	199
	.long	0
LNames10:
	.long	184
	.long	1
	.long	57
	.long	0
	.section	__DWARF,__apple_objc,regular,debug
Lobjc_begin:
	.long	1212240712
	.short	1
	.short	0
	.long	1
	.long	0
	.long	12
	.long	0
	.long	1
	.short	1
	.short	6
	.long	-1
	.section	__DWARF,__apple_namespac,regular,debug
Lnamespac_begin:
	.long	1212240712
	.short	1
	.short	0
	.long	4
	.long	4
	.long	12
	.long	0
	.long	1
	.short	1
	.short	6
	.long	-1
	.long	0
	.long	3
	.long	-1
	.long	262739357
	.long	274532053
	.long	2100255993
	.long	2090156110
.set Lset17, Lnamespac2-Lnamespac_begin
	.long	Lset17
.set Lset18, Lnamespac0-Lnamespac_begin
	.long	Lset18
.set Lset19, Lnamespac1-Lnamespac_begin
	.long	Lset19
.set Lset20, Lnamespac3-Lnamespac_begin
	.long	Lset20
Lnamespac2:
	.long	317
	.long	1
	.long	194
	.long	0
Lnamespac0:
	.long	311
	.long	1
	.long	189
	.long	0
Lnamespac1:
	.long	164
	.long	1
	.long	52
	.long	0
Lnamespac3:
	.long	159
	.long	1
	.long	47
	.long	0
	.section	__DWARF,__apple_types,regular,debug
Ltypes_begin:
	.long	1212240712
	.short	1
	.short	0
	.long	1
	.long	0
	.long	20
	.long	0
	.long	3
	.short	1
	.short	6
	.short	3
	.short	5
	.short	4
	.short	11
	.long	-1
	.globl	_ffsll
.set _ffsll, _ffsl
	.globl	_strrchr
.set _strrchr, _rindex
	.globl	_memcmp
.set _memcmp, _bcmp
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
