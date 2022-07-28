SECTION .data
msg     db      'Hello, brave new world! uuuuuuu', 0Ah , 0

SECTION .text

global _start

_start:

mov     ebx, 0      ; 'clear' ebx 
mov     eax, msg    ; eax contain the adderess of msg

nextchar:
    cmp     byte [eax + ebx], 0 ; ebx containt the offset and eax point for the first element in msg    
                                ; byte keyword: https://stackoverflow.com/questions/21765476/what-does-the-following-byte-specifier-for-adding-to-a-memory-reference-does-in
                                ; []: https://stackoverflow.com/questions/10362511/basic-use-of-immediates-vs-square-brackets-in-yasm-nasm-x86-assembly
    jz      finished            ; jump(if the zero flagged has been set) to the point in the code labeled 'finished'
    inc     ebx                 ; increment ebx by one byte
    jmp     nextchar            ; jump to the point in the code labeled 'nextchar'


finished:

    mov     edx, ebx    ; ebx contain the offset(len of string)
    mov     ecx, msg
    mov     ebx, 01h
    mov     eax, 04h
    int     80h

end:
    mov     ebx, 0
    mov     eax, 1
    int     80h