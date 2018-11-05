//.section .data
//.balign 4 // 4 bytes
//.byte 1 // array of 1
//.AUX_IRQ: .word 0x3f215000 // interrupt status
.section .text
.global main
main:
	ldr x0, =0x3f215004
	mov w1, 1
	str w1, [x0]
	ldr x0, =0x3f215068
	mov w1, 270
	str w1, [x0]
	ldr x0, =0x3f200004
	ldr w1, #0
	orr w1, w1, 8192
	orr w1, w1, 65536
	str w1, [x0]
	ldr x0, =0x3f215060
        mov w1, 3
        str w1, [x0]
	mov w1, 72
	mov w0, 20544
	movk w0, 0x3f21, lsl 16
	str w1, [x0]
.hang:
	b .hang
