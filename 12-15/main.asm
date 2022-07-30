%include 'functions.asm'

SECTION .data
msg     db  ' resto: '  , 0
char_linefeed  db  0xA

SECTION .bss
char_to_print   resb    1

SECTION .text

global _start

_start:

    ;addition
    mov     eax , 3
    mov     ebx , 2
    add     eax , ebx
    call    print_itoa
    call    print_line_feed


    ;subtraction
    mov     eax , 5
    mov     ebx , 2
    sub     eax , ebx
    call    print_itoa
    call    print_line_feed

    ;multiplication
    mov     eax , 5
    mov     ebx , 5
    mul     ebx     ; eax = eax * ebx
    call    print_itoa
    call    print_line_feed

    ;division
    mov     eax , 20
    mov     ebx , 30
    div     ebx     ; eax = eax / ebx  eax(quociente) edx(resto)
    call    print_itoa

    mov     eax , msg
    call    print_string

    mov     eax , edx
    call    print_itoa
    call    print_line_feed



    call    exit