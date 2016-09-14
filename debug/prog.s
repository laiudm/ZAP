.global _Reset
_Reset:
mov sp, #1000 // Set up stack
bl main
here: b here

