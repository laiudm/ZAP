.global _Reset
_Reset:
movs r1, #33
movs r2, #33
muls r5,r2,r1
movs r6, r5
movs r7, #0
bl function
movs r6, #2
adds r8,r6,#20

function:
mov r6, #1
mov pc, lr
