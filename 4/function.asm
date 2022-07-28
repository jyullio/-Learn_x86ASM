SECTION .data
msg     db      'hello world' , 0xA , 0

SECTION .text

global _start

_start:

    mov     eax , msg
    call strlen

    mov     edx , eax
    mov     ecx , msg
    mov     ebx , 1
    mov     eax , 4
    int     0x80

    mov     eax , 1
    mov     ebx , 0
    int     0x80


strlen:
    push    ebx
    mov     ebx , 0

next_char:
    cmp     byte [eax + ebx] , 0
    jz      end_strlen
    inc     ebx
    jmp     next_char


end_strlen:
    mov     eax , ebx
    pop     ebx
    ret