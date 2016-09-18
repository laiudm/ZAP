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
	.global	prog
	.type	prog, %function
prog:
.LFB0:
	.file 1 "../sw/c/prog.c"
	.loc 1 2 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	.cfi_def_cfa_offset 4
	.cfi_offset 11, -4
	add	fp, sp, #0
	.cfi_def_cfa_register 11
	sub	sp, sp, #20
	.loc 1 3 0
	mov	r3, #0
	str	r3, [fp, #-8]
	.loc 1 4 0
	mov	r3, #23
	str	r3, [fp, #-12]
	.loc 1 6 0
	mov	r3, #300
	str	r3, [fp, #-16]
	.loc 1 8 0
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L2
.L3:
	.loc 1 9 0 discriminator 2
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-16]
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	add	r1, r3, #1
	str	r1, [fp, #-12]
	str	r3, [r2]
	.loc 1 8 0 discriminator 2
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L2:
	.loc 1 8 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-8]
	cmp	r3, #9
	ble	.L3
.L4:
	.loc 1 11 0 is_stmt 1 discriminator 1
	b	.L4
	.cfi_endproc
.LFE0:
	.size	prog, .-prog
	.align	2
	.global	undef
	.type	undef, %function
undef:
.LFB1:
	.loc 1 14 0
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
	.loc 1 15 0
	mov	r0, r0	@ nop
	.loc 1 16 0
	sub	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.cfi_endproc
.LFE1:
	.size	undef, .-undef
	.align	2
	.global	swi
	.type	swi, %function
swi:
.LFB2:
	.loc 1 18 0
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
	.loc 1 19 0
	mov	r0, r0	@ nop
	.loc 1 20 0
	sub	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.cfi_endproc
.LFE2:
	.size	swi, .-swi
	.align	2
	.global	pabt
	.type	pabt, %function
pabt:
.LFB3:
	.loc 1 22 0
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
	.loc 1 23 0
	mov	r0, r0	@ nop
	.loc 1 24 0
	sub	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.cfi_endproc
.LFE3:
	.size	pabt, .-pabt
	.align	2
	.global	dabt
	.type	dabt, %function
dabt:
.LFB4:
	.loc 1 26 0
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
	.loc 1 27 0
	mov	r0, r0	@ nop
	.loc 1 28 0
	sub	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.cfi_endproc
.LFE4:
	.size	dabt, .-dabt
	.align	2
	.global	irq
	.type	irq, %function
irq:
.LFB5:
	.loc 1 30 0
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
	.loc 1 31 0
	mov	r0, r0	@ nop
	.loc 1 32 0
	sub	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.cfi_endproc
.LFE5:
	.size	irq, .-irq
	.align	2
	.global	fiq
	.type	fiq, %function
fiq:
.LFB6:
	.loc 1 34 0
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
	.loc 1 35 0
	mov	r0, r0	@ nop
	.loc 1 36 0
	sub	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.cfi_endproc
.LFE6:
	.size	fiq, .-fiq
.Letext0:
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0xcf
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF3
	.byte	0x1
	.4byte	.LASF4
	.4byte	.LASF5
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.4byte	.LASF6
	.byte	0x1
	.byte	0x1
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5f
	.uleb128 0x3
	.ascii	"i\000"
	.byte	0x1
	.byte	0x3
	.4byte	0x5f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x3
	.ascii	"j\000"
	.byte	0x1
	.byte	0x4
	.4byte	0x5f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x3
	.ascii	"x\000"
	.byte	0x1
	.byte	0x6
	.4byte	0x66
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x5
	.byte	0x4
	.4byte	0x5f
	.uleb128 0x6
	.4byte	.LASF0
	.byte	0x1
	.byte	0xe
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x7
	.ascii	"swi\000"
	.byte	0x1
	.byte	0x12
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.4byte	.LASF1
	.byte	0x1
	.byte	0x16
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.4byte	.LASF2
	.byte	0x1
	.byte	0x1a
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x7
	.ascii	"irq\000"
	.byte	0x1
	.byte	0x1e
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x7
	.ascii	"fiq\000"
	.byte	0x1
	.byte	0x22
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
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
	.uleb128 0x2117
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
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
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
	.uleb128 0x7
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
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
.LASF2:
	.ascii	"dabt\000"
.LASF1:
	.ascii	"pabt\000"
.LASF6:
	.ascii	"prog\000"
.LASF5:
	.ascii	"/media/sf_D_DRIVE/ZAP/debug\000"
.LASF4:
	.ascii	"../sw/c/prog.c\000"
.LASF3:
	.ascii	"GNU C 4.8.4 20141219 (release) -mcpu=arm7tdmi -g\000"
.LASF0:
	.ascii	"undef\000"
	.ident	"GCC: (4.8.4-1+11-1) 4.8.4 20141219 (release)"
