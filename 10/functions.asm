
;----------------------------------------------
;print character
print_char:

    push    eax
    push    ebx
    push    ecx
    push    edx

    mov     eax , 0x4
    mov     ebx , 0x1
    mov     ecx , char_to_print
    mov     edx , 0x1
    int     0x80

    pop     edx
    pop     ecx
    pop     ebx
    pop     eax

    ret


exit:
    mov     eax , 0x1
    mov     ebx , 0x0
    int     0x80
    ret
