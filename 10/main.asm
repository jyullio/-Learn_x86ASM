%include 'functions.asm'

SECTION .data
char_linefeed  db  0xA

SECTION .bss
char_to_print   resb    1

SECTION .text


global _start

_start:

    mov     ecx , 0x30    ;conversion of number 1 to ASCII(character)
    call    loop

    call    exit
    
loop:

    ;print char
    mov     [char_to_print] , ecx
    call    print_char

    ;print linefeed
    mov     eax , [char_linefeed]       ;https://stackoverflow.com/questions/35026774/moving-variables-content-into-another-variable
    mov     [char_to_print] , eax
    call    print_char

    inc     ecx

    cmp     ecx , 0x3A
    jne     loop
    ret




