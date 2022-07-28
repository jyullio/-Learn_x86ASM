%include 'functions.asm'

SECTION .data
msg1    db  'primeira string' , 0 ; 0 == NULL terminating byte
msg2    db  'segunda string' , 0 ; 0 == NULL terminating byte
char_linefeed  db  0xA

SECTION .text

global _start

_start:

    mov     eax , msg1
    call    print_string
    call    print_linefeed

    mov     eax , msg2
    call    print_string
    call    print_linefeed

    call    exit