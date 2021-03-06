.section .data
welcome_msg: .asciz "Welcome to my RPi"
.section .text
.globl	_start
_start:
	mrs	x0, mpidr_el1
	mov	x1, #0xC0000000
	bic	x0, x0, x1
	cbz	x0, main
	b	hang
hang:
	b	hang
main:
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
        mov     w1, 0xc6
        str     w1, [x0]        // ;
        ldr	x0, =0x3f215060 // enable uart Tx and Rx
        mov	w1, 3
        str	w1, [x0]	// ;
	mov	w0, 20544	// load AUX_MU_IO_REG register
	movk	w0, 0x3f21, lsl 16
.rxEmpty:	
	mov	w5, 20564
	movk	w5, 0x3f21, lsl 16 // load AUX_MU_LSF_REG line status
	ldr	w5, [x5]
	nop
	and	w5, w5, 1
	cmp	w5, 0
	bne	.here
	b	.rxEmpty
.here:
	mov	w1, 0x78
	str	w1, [x0]
	nop
	ret
