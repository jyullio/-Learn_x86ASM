
sprint:

    push    eax
    push    ebx
    push    ecx
    push    edx

    call strlen_start

    mov     edx , ebx   ; move qtd bytes to print for edx
    mov     ecx , eax   ; move message to be printed to ecx
    mov     ebx , 0x1
    mov     eax , 0x4
    int     0x80

    pop     edx
    pop     ecx
    pop     ebx
    pop     eax

    ret

strlen_start:

    mov     ebx , 0x0
    call    strlen_countchar
    

strlen_countchar:

    cmp     byte [eax + ebx] , 0x0
    jz      strlen_end
    inc     ebx
    jmp     strlen_countchar

strlen_end:
    ret


exit:
    mov     eax , 0x1
    mov     ebx , 0x0
    int     0x80
    ret
