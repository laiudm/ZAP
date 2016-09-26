	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"prog.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.global	factorial
	.type	factorial, %function
factorial:
.LFB0:
	.file 1 "../sw/c/prog.c"
	.loc 1 2 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	.cfi_def_cfa_offset 12
	.cfi_offset 4, -12
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #8
	.cfi_def_cfa 11, 4
	sub	sp, sp, #12
	.loc 1 3 0
	mov	r3, #500
	str	r3, [fp, #-16]
	.loc 1 4 0
	ldr	r3, [fp, #-16]
	mov	r2, #5
	str	r2, [r3]
	.loc 1 5 0
	ldr	r3, [fp, #-16]
	add	r4, r3, #4
	ldr	r3, [fp, #-16]
	ldr	r3, [r3]
	mov	r0, r3
	bl	fact
	mov	r3, r0
	str	r3, [r4]
.L2:
	.loc 1 6 0 discriminator 1
	b	.L2
	.cfi_endproc
.LFE0:
	.size	factorial, .-factorial
	.align	2
	.global	fact
	.type	fact, %function
fact:
.LFB1:
	.loc 1 10 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #4
	.cfi_def_cfa 11, 4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	.loc 1 11 0
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bne	.L4
	.loc 1 12 0
	mov	r3, #1
	b	.L5
.L4:
	.loc 1 14 0
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	mov	r0, r3
	bl	fact
	mov	r3, r0
	ldr	r2, [fp, #-8]
	mul	r3, r2, r3
.L5:
	.loc 1 15 0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	ldmfd	sp!, {fp, lr}
	bx	lr
	.cfi_endproc
.LFE1:
	.size	fact, .-fact
	.align	2
	.global	__undef
	.type	__undef, %function
__undef:
.LFB2:
	.loc 1 17 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	.cfi_def_cfa_offset 4
	.cfi_offset 11, -4
	add	fp, sp, #0
	.cfi_def_cfa_register 11
	.loc 1 18 0
	mov	r0, r0	@ nop
	.loc 1 19 0
	sub	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.cfi_endproc
.LFE2:
	.size	__undef, .-__undef
	.align	2
	.global	__swi
	.type	__swi, %function
__swi:
.LFB3:
	.loc 1 21 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	.cfi_def_cfa_offset 4
	.cfi_offset 11, -4
	add	fp, sp, #0
	.cfi_def_cfa_register 11
	.loc 1 22 0
	mov	r0, r0	@ nop
	.loc 1 23 0
	sub	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.cfi_endproc
.LFE3:
	.size	__swi, .-__swi
	.align	2
	.global	__pabt
	.type	__pabt, %function
__pabt:
.LFB4:
	.loc 1 25 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	.cfi_def_cfa_offset 4
	.cfi_offset 11, -4
	add	fp, sp, #0
	.cfi_def_cfa_register 11
	.loc 1 26 0
	mov	r0, r0	@ nop
	.loc 1 27 0
	sub	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.cfi_endproc
.LFE4:
	.size	__pabt, .-__pabt
	.align	2
	.global	__dabt
	.type	__dabt, %function
__dabt:
.LFB5:
	.loc 1 29 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	.cfi_def_cfa_offset 4
	.cfi_offset 11, -4
	add	fp, sp, #0
	.cfi_def_cfa_register 11
	.loc 1 30 0
	mov	r0, r0	@ nop
	.loc 1 31 0
	sub	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.cfi_endproc
.LFE5:
	.size	__dabt, .-__dabt
	.align	2
	.global	__irq
	.type	__irq, %function
__irq:
.LFB6:
	.loc 1 33 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	.cfi_def_cfa_offset 4
	.cfi_offset 11, -4
	add	fp, sp, #0
	.cfi_def_cfa_register 11
	.loc 1 34 0
	mov	r0, r0	@ nop
	.loc 1 35 0
	sub	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.cfi_endproc
.LFE6:
	.size	__irq, .-__irq
	.align	2
	.global	__fiq
	.type	__fiq, %function
__fiq:
.LFB7:
	.loc 1 37 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	.cfi_def_cfa_offset 4
	.cfi_offset 11, -4
	add	fp, sp, #0
	.cfi_def_cfa_register 11
	.loc 1 38 0
	mov	r0, r0	@ nop
	.loc 1 39 0
	sub	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.cfi_endproc
.LFE7:
	.size	__fiq, .-__fiq
.Letext0:
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0xea
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF6
	.byte	0x1
	.4byte	.LASF7
	.4byte	.LASF8
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.4byte	.LASF9
	.byte	0x1
	.byte	0x1
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x54
	.uleb128 0x3
	.ascii	"x\000"
	.byte	0x1
	.byte	0x3
	.4byte	0x54
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x4
	.4byte	.LASF10
	.byte	0x1
	.byte	0x5
	.4byte	0x5a
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x5a
	.uleb128 0x7
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x8
	.4byte	.LASF10
	.byte	0x1
	.byte	0x9
	.4byte	0x5a
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x87
	.uleb128 0x9
	.ascii	"x\000"
	.byte	0x1
	.byte	0x9
	.4byte	0x5a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xa
	.4byte	.LASF0
	.byte	0x1
	.byte	0x11
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xa
	.4byte	.LASF1
	.byte	0x1
	.byte	0x15
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xa
	.4byte	.LASF2
	.byte	0x1
	.byte	0x19
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xa
	.4byte	.LASF3
	.byte	0x1
	.byte	0x1d
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xa
	.4byte	.LASF4
	.byte	0x1
	.byte	0x21
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xa
	.4byte	.LASF5
	.byte	0x1
	.byte	0x25
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF5:
	.ascii	"__fiq\000"
.LASF4:
	.ascii	"__irq\000"
.LASF8:
	.ascii	"/proj/ZAP/debug\000"
.LASF2:
	.ascii	"__pabt\000"
.LASF9:
	.ascii	"factorial\000"
.LASF0:
	.ascii	"__undef\000"
.LASF7:
	.ascii	"../sw/c/prog.c\000"
.LASF3:
	.ascii	"__dabt\000"
.LASF6:
	.ascii	"GNU C 4.8.4 20141219 (release) -mcpu=arm7tdmi -g\000"
.LASF10:
	.ascii	"fact\000"
.LASF1:
	.ascii	"__swi\000"
	.ident	"GCC: (4.8.4-1+11-1) 4.8.4 20141219 (release)"
