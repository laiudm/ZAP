.global _Reset
_Reset:
mov r0, #0
add r1, r0, #1
add r2, r0, #2
add r3, r0, #3
stmib r0!, {r1-r3}
here: b here

