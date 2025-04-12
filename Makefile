# Makefile for simple OS kernel

# Cross compiler tools
AS = /home/akuro/cross-compiler/opt/bin/i386-elf-as
CC = /home/akuro/cross-compiler/opt/bin/i386-elf-gcc
LD = /home/akuro/cross-compiler/opt/bin/i386-elf-ld

# Build target
KERNEL_BIN = os-image.bin

# All target
all: $(KERNEL_BIN)

# Boot sector (bootloader)
boot.o: boot.s
	$(AS) boot.s -o boot.o

# Kernel object
kernel.o: kernel.c
	$(CC) -ffreestanding -c kernel.c -o kernel.o

# Kernel ELF executable
kernel.bin: kernel.o
	$(LD) -Ttext 0x1000 --oformat binary kernel.o -o kernel.bin

# OS image (bootloader + kernel)
$(KERNEL_BIN): boot.o kernel.bin
	cat boot.o kernel.bin > $(KERNEL_BIN)

# Clean build files
clean:
	rm -f *.o *.bin

# Run in QEMU
run: $(KERNEL_BIN)
	qemu-system-i386 -fda os-image.bin -drive format=raw,file=os-image.bin -boot a -no-reboot -no-shutdown

