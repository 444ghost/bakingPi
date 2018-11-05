.section .data
.balign 4 // 4 bytes
.byte 1 // array of 1
.AUX_IRQ: .word 0x3f215000 // interrupt status

.section .text
.global main
main:
	ldr x0, =0x3f215004
	mov w0, 0x00000001
	str w0, [x0]
	ldr x0, =0x3f215044
	mov w0, 0x00000000
	str w0, [x0]
	ldr x0, =0x3f215060
	mov w0, 0x00000000
	str w0, [x0]
	ldr x0, =0x3f21504c
	mov w0, 0x00000003
	str w0, [x0]
	ldr x0, =0x3f215050
	mov w0, 0x00000000
	str w0, [x0]
        ldr x0, =0x3f215044
        mov w0, 0x00000000
        str w0, [x0]
	ldr x0, =0x3f215048
	mov w0, 0x000000c6
	str w0, [x0]
	ldr x0, =0x3f215068
	mov w0, 270
	str w0, [x0]
	ldr x0, =0x3f200004
	mov w0, 0x2000
	movk w0, 0x0001, lsl 16
	ldr x0, =0x3f215040
	mov w0, 0x0d
	str w0, [x0]
/*
	str w0, [x0]
	ldr x0, =0x3f200094
	mov w0, 0x00000000
	str w0, [x0]
	mov x1, 150
.delay:
	sub x1, x1, 1
	cmp x1, 0
	bne .delay
	ldr x0, =0x3f200098
	mov w0, 0xc000
	str w0, [x0]
	mov x1, 150
.delay2:
        sub x1, x1, 1
        cmp x1, 0
        bne .delay2
        ldr x0, =0x3f200098
        mov w0, 0
        str w0, [x0]
	ldr x0, =0x3f215060
	mov w0, 0x00000003
	str w0, [x0]
	ldr x0, =0x3f215040
	mov w0, 0x0d
	str w0, [x0]
        ldr x0, =0x3f215040
        mov w0, 0x0a
        str w0, [x0]
        ldr x0, =0x3f215040
        mov w0, 0x4f
        str w0, [x0]
        ldr x0, =0x3f215040
        mov w0, 0x0d
        str w0, [x0]
*/
