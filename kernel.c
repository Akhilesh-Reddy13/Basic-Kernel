void print(const char *str) {
    unsigned short *video = (unsigned short *)0xb8000;
    while (*str) {
        *video++ = (*str++ | 0x0700);
    }
}

void kernel_main() {
    print("Hello World");
    while (1) {}
}

