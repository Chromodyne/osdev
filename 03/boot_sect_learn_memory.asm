[org 0x7C00]

	mov	ah, 0x0E

	;This will not work because we are addressing the pointer and not the data.
	mov	al, "1"
	int 	0x10
	mov	al, hidden
	int	0x10
	

	;Should work because the offset declared above with org now shows the correct address.
	mov	al, "2"
	int 	0x10
	mov	al, [hidden]
	int	0x10
	
	;Should also work. Directly addresses the memory.
	mov	al, "3"
	int	0x10
	mov	al, [0x7C2D]
	int	0x10


jmp	$


hidden:

	db	"X"

times 	510-($-$$) db 0		;Write zeroes for boot sector.
dw	0xAA55			;Make bootable.
