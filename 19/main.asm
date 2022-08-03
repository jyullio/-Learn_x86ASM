%include 'functions.asm'

SECTION .data
filename	db	'teste.txt' , 0
char_linefeed	db	0xA

SECTION .bss
char_to_print 	resb	1


SECTION .text

global _start

_start:
	
	;create file
	mov		ecx , 0777o		;set all permission to read , write , execute
	mov		ebx , filename
	mov		eax , 8			;invoke SYS_CREATE
	int		0x80

	call	exit
	
	


