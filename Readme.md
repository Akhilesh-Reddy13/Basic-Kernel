# Basic Kernel

A simple hobby operating system kernel written in assembly and C, designed to boot using GRUB.  
This is an educational project to learn about low-level system programming, bootloaders, and kernel development.

## Features

- Custom bootloader written in Assembly
- Minimal 32-bit protected mode kernel
- VGA text mode output (print to screen)
- Cross-compiled for i386 architecture
- Simple Makefile build system

## Requirements

- Cross-compiler toolchain for `i386-elf`
- QEMU (or any other emulator) to test the kernel
- `make` and `gcc` for building
- NASM assembler (or GNU assembler)

## Getting Started

### 1. Clone the repository

```bash
git clone git@github.com:<your-username>/<your-repo>.git
cd <your-repo>

