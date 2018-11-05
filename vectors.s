.globl _start
_start:
    mrs x0,mpidr_el1
    mov x1,#0xC1000000
    bic x0,x0,x1
    cbz x0,master
    b hang
master:
    bl skip
skip:
    mov x0,x30
    bl notmain
hang: b hang

