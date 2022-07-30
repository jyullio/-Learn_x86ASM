
;----------------------------------------------
;print string
print_string:

    push    eax
    push    ebx
    push    ecx
    push    edx

    mov     ecx , 0

strlen:

    cmp     byte [eax + ecx] , 0
    jz      print
    inc     ecx
    jmp     strlen


print:
    mov     edx , ecx
    mov     ecx , eax
    mov     eax , 0x4
    mov     ebx , 0x1
    int     0x80

    pop     edx
    pop     ecx
    pop     ebx
    pop     eax

    ret

;----------------------------------------------
;print line feed
print_line_feed:

    push    eax

    mov     eax , [char_linefeed]
    mov     [char_to_print] , eax
    call    print_char

    pop     eax

    ret

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


print_itoa:

    push    eax
    push    ebx
    push    ecx
    push    edx

    mov     ebx , 10
    mov     ecx , 0     ;count in loop


loopitoa:

    mov     edx , 0     ;clear edx
                        ;https://stackoverflow.com/questions/38416593/why-should-edx-be-0-before-using-the-div-instruction

    idiv    ebx         ;divide contents of eax by the contents of ebx

    add     edx , 48    ; transform number to ascii
    push    edx


    inc     ecx        ;count amount of characters to print

    cmp     eax , 0     ;cant divide by 10 anymore anymore
    jne     loopitoa


loopprint:

    pop     eax
    mov     [char_to_print] , eax
    call    print_char

    dec     ecx

    cmp     ecx , 0
    jne     loopprint
    

end_print_itoa:

    pop     edx
    pop     ecx
    pop     ebx
    pop     eax

    ret



exit:
    mov     eax , 0x1
    mov     ebx , 0x0
    int     0x80