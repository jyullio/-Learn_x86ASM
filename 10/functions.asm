;----------------------------------------------
;print a character
print_char:

    push    eax
    push    ebx
    push    ecx
    push    edx


    mov     ecx , char_to_print
    mov     edx , 0x1
    mov     ebx , 0x1
    mov     eax , 0x4
    int     0x80

    pop     edx
    pop     ecx
    pop     ebx
    pop     eax

    ret


exit:
    mov     eax , 1
    mov     ebx , 0
    int     0x80
    ret
