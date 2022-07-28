%include 'functions.asm'

SECTION .data
msg1    db  'primeira string' , 0xA , 0 ; 0 == NULL terminating byte
msg2    db  'segunda string' , 0xA , 0 ; 0 == NULL terminating byte

SECTION .text

global _start

_start:

    mov     eax , msg1
    call    sprint

    mov     eax , msg2
    call    sprint

    call    exit