%include 'functions.asm'

SECTION .data
fizz_msg	db	'fizz' , 0
buzz_msg	db	'buzz' , 0
char_linefeed  db  0xA


SECTION .bss
char_to_print   resb    1
bool_is_fizz	resb	1
bool_is_buzz	resb	1


SECTION .text

global _start

_start:
	

	mov		ecx , 0  ; loop count
		
.main_loop:

	mov		byte [bool_is_fizz] , 0  ; bool variable to check if number is fizz
	mov		byte [bool_is_buzz] , 0  ; bool variable to check if number is buzz
	inc 	ecx

.checkfizz:

	mov		edx , 0
	mov		eax , ecx
	mov		ebx , 3
	idiv	ebx
	
	cmp		edx , 0		
	je		.isfizz
	
	jmp		.checkbuzz

.isfizz:
	mov		byte [bool_is_fizz] , 1
	mov		esi , fizz_msg
	call	print_string

.checkbuzz:
	mov		edx , 0
	mov		eax , ecx
	mov		ebx , 5
	idiv	ebx
	cmp		edx , 0
	je		.isbuzz
	jmp		.if_is_anyone_of_both
	
.isbuzz:
	mov		byte [bool_is_buzz] , 1
	mov		esi , buzz_msg
	call	print_string




.if_is_anyone_of_both:

	cmp		byte [bool_is_fizz] , 1
	je		.continue
	cmp		byte [bool_is_buzz] , 1
	je		.continue
	
	mov		eax , ecx
	call	print_itoa		
	

.continue:

	call 	print_linefeed
	cmp		ecx , 16
	jl		.main_loop
	call	exit
	
	


