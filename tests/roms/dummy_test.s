.global main
.global __IRQ_HANDLER

.include "defs.inc"

.section .text
.thumb
.align 4

main:
    ldr r0,=0x6000000
    ldr r1,=font_gfx
    ldr r2,=8192
    bl simple_memcpy

    ldr r0,=0x5000000
    ldr r1,=font_pal
    ldr r2,=512
    bl simple_memcpy

    ldr r0,=DISPLAYCNT
    ldr r1,=0b0000000100000000
    strh r1,[r0]

    ldr r0,=BG0CNT
    ldr r1,=0b0000100010000000
    strh r1,[r0]

    ldr r0,=BGHOFS
    ldr r1,=0x0
    str r1,[r0]

    ldr r0,=0x6004000
    ldr r1,=hello_world
    bl simple_strcpy

.Ldone:
    b .Ldone

irq_handler:
    bx lr

.align 4
__IRQ_HANDLER:
.int irq_handler + 1

hello_world:
.ascii "Hello world!"
.int 0
