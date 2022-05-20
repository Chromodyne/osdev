;This file is designed to show the basic functionality of the stack and how it works.
;The stack only grows downwards like a stack of dishes. Push and pop add or remove items
;from the top of the stack.

[org 0x7C00]

	mov	ah, 0x0E	;Enter teletype mode.

	mov	bp, 0x8000	;Protect stack by moving base pointer away from where it might be overwritten.
	mov	sp, bp		;SP -> BP

	push	'A'
	push	'B'
	push	'C'

	
	;Downward growth visualized.
	mov	al, [0x7FFE]
	int	0x10
	
	;Does nothing since the stack grows down.
	mov	al, [0x8000]
	int	0x10
	
	;This should print C since it was pushed last to the stack.
	pop 	bx
	mov	al, bl
	int 	0x10
	
	;Print B
	pop	bx
	mov	al, bl
	int	0x10
	
	;Print A
	pop	bx
	mov	al, bl
	int 	0x10

jmp	$

;Write zeroes and flag sector as bootable.
times	510-($-$$)	db 	0
dw	0xAA55