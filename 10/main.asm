%include 'functions.asm'

SECTION .data 
char_linefeed  db  0xA

SECTION .bss
char_to_print   resb    1

SECTION .text

global _start

_start:

    mov     ecx , 0x30      ;1 in ASCII
    call    loop
    call    exit

loop:

    mov     [char_to_print] , ecx
    call    print_char

    mov     eax , [char_linefeed]
    mov     [char_to_print] , eax
    call    print_char

    inc     ecx

    cmp     ecx , 0x3A
    jne     loop

    ret

    

