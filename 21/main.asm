%include 'functions.asm'

SECTION .data
filename	db	'teste.txt' , 0
msg			db	'ola mundo' , 0
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

	;after create a file , file descriptor is inside eax
	
	mov		esi , msg
	push	eax
	call	strlen	;eax = strlen(esi)
	mov		edx , eax
	pop		eax
	
	mov		ecx , msg
	mov		ebx , eax	
	mov		eax , 0x4
	int 	0x80


	;get file descriptor in eax
	mov		ecx , 0 ;open file in read-only mode
	mov		ebx , filename
	mov		eax , 0x5
	int		0x80

	call	print_itoa
	call	print_linefeed
	
	call	exit
	
	


