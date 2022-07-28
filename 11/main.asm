%include 'functions.asm'

SECTION .data 
char_linefeed  db  0xA

SECTION .bss
char_to_print   resb    1

SECTION .text

global _start

_start:

    mov     ecx , 0
    call    main_loop
    call    exit

main_loop:

    mov     eax , ecx
    call    print_itoa
    inc     ecx
    cmp     ecx , 20
    jle     main_loop

    ret