%include 'functions.asm'

SECTION .data
char_linefeed  db  0xA

SECTION .text

global _start

_start:

    pop     ecx     ;ecx store number of args

nextarg:

    cmp     ecx , 0
    jz      end_program
    pop     eax             ;eax store the arg
    call    print_string
    call    print_linefeed
    dec     ecx
    jmp     nextarg


end_program:
    call    exit