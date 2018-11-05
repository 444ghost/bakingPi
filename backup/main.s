//.section .data
//.balign 4 // 4 bytes
//.byte 1 // array of 1
//.AUX_IRQ: .word 0x3f215000 // interrupt status
.section .text
.globl main
main:
	mrs	x0, mpidr_el1
	mov	x1, #0xc1000000
	bic	x0, x0, x1
	cbz	x0, .go
.go:
	mov	w3, 1001
.delay2:
	sub	w3, w3, 1
	cmp	w3, 0
	bne	.delay2
	mov	x0, x30
	ldr     x0, =0x3f200004 // GPIO 14 and 15 as alternate fun Tx and Rx
        ldr     w1, #0
        orr     w1, w1, 8192
        orr     w1, w1, 65536
        str     w1, [x0]        // ;
	ldr	x0, =0x3f215004 // enable AUX
        mov	w1, 1
        str	w1, [x0]	// ;
        ldr	x0, =0x3f215068 // baudrate set
        mov	w1, 270
        str	w1, [x0]	// ;
	ldr	x0, =0x3f21504c // 8 bits data mode
	mov	w1, 3
	str	w1, [x0]	// ;
        ldr     x0, =0x3f215048 // enable FIFO and FIFO clear bits on Tx
        mov     w1, 0xc4
        str     w1, [x0]        // ;
        ldr	x0, =0x3f215060 // enable uart Tx and Rx
        mov	w1, 3
        str	w1, [x0]	// ;
	mov	w1, 79		// transmit 'H'
        mov	w0, 20544
        movk	w0, 0x3f21, lsl 16
	str	w1, [x0]	// ;
	mov	w3, 1001
.delay:
	sub	w3, w3, 1
	cmp	w3, 0
	bne	.delay
        mov     w1, 80          // transmit 'I'
        mov     w0, 20544
        movk    w0, 0x3f21, lsl 16
        str	w1, [x0]	// ;
.hang:
	b	.hang
