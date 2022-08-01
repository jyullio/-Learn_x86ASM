%include 'functions.asm'

SECTION .data
char_linefeed  db  0xA


SECTION .bss
char_to_print   resb    1


SECTION .text

global _start

_start:

	;./main arg1 arg2
	;sum arg1 + arg2
	pop		ecx		;get number of args
	pop		eax		;remove ./name_of_program of stack
	dec		ecx		;remove ./name_of_program of number of args

	
	cmp		ecx , 0
	
	jne		main_loop
	call	exit

main_loop:
	mov		edx , 0	

count_args:

	pop		eax	;get arg
	call	atoi	
	add 	ebx , eax	;ebx hold the sum of args
	

	dec		ecx
	
	cmp		ecx , 0
	jg		count_args

	mov		eax , ebx
	call	print_itoa
	call	print_linefeed
	
	call	exit


atoi:

	push	ebx
	push	ecx
	push	edx
	push	esi
	push	edi

	call    strlen
	dec     ecx         ;transform ecx(len of string) in index of my string --> ecx is index of string

	mov     esi , eax   ; esi is my string
	mov     edi , 1     ; edx is power of 10
	mov     eax , 0     ; final result

loop_atoi:

		
	;eax += (ebx - 48) * edi 

	;ebx is the chacater of my string
	mov     ebx , 0
	mov     bl , [esi + ecx]	;bl is 8bit register

	;transform ascii to int
	sub     ebx , 48


	;multiply ebx by edi(edi is power of 10)
	imul    ebx , edi


	;final result of conversion
	add		eax , ebx



	;multiply edi by 10
	mov		edx , 10
	imul   	edi , edx


	cmp     ecx , 0
	je      end_atoi
	dec     ecx
	jmp     loop_atoi




end_atoi:

	pop		edi
	pop		esi
	pop		edx
	pop		ecx
	pop		ebx


	ret


