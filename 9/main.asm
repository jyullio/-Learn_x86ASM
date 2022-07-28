%include 'functions.asm'

SECTION .data
msg     db      'enter your name' , 0   
char_linefeed  db  0xA

SECTION .bss
input   resb    255     ;reserve 255 bytes in memory for user input

SECTION .text

global _start

_start:

    mov     eax , msg
    call    print_string
    call    print_linefeed

    ;read user input
    mov     eax , 3
    mov     ebx , 0
    mov     ecx , input
    mov     edx , 255
    int     0x80

    mov     eax , input
    call    print_string

    call exit

