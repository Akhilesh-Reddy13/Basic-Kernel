.intel_syntax noprefix
.global _start

.section .text
_start:
    cli                         # Disable interrupts

    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7c00              # Set stack pointer

    mov bx, 0x1000              # Destination offset for kernel
    mov dh, 2                   # Number of sectors to read
    call read_kernel

    jmp 0x1000                  # Jump to loaded kernel

read_kernel:
    mov ax, 0x0202              # AH=0x02 (read), AL=number of sectors (2)
    mov cx, 0x0002              # CH=cylinder, CL=sector (2)
    mov dx, 0x0080              # DH=head, DL=drive number (0x80 = first HDD)
    int 0x13                    # BIOS disk interrupt
    jc disk_error               # If carry flag set, error
    ret

disk_error:
    cli
    hlt
    jmp disk_error              # Infinite loop on error

    # Boot sector signature
    . = 510
    .byte 0x55
    .byte 0xaa

