.global _Reset
_Reset:
mov r1, #33
mov r2, #33
mul r5,r2,r1
mov r6, r5
bl function
mov r6, #2
add r7,r6,#20

function:
mov r6, #1
mov pc, lr
