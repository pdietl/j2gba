.global simple_strcpy

.include "util.inc"

.section .text
.thumb
.align 4

// r0 - source
// r1 - offset
// r2 - clobbered
simple_strcpy:
    ldr r2,[r1]
    cmp r2,#0
    beq .Ldone_simple_strcpy
    str r2,[r0]
    add r0,#4
    add r1,#4
    b simple_strcpy
.Ldone_simple_strcpy:
    bx lr

// r0 - source
// r1 - dest
// r2 - clobbered
// r3 - clobbered
// r4 - clobbered
console_write:
    mov r0,r2
    ldr_unaligned r2,r3,r4
    cmp r3,#0
    beq .Ldone_console_write
    
    // TODO write out the tile

    b console_write
.Ldone_console_write
    bx lr
