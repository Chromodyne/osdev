;Printing using bios interrupts.
mov ah, 0x0E
mov al, 'H'
int 0x10
mov al, 'i'
int 0x10

;Infinite loop
jmp $                       ;$ indicates current address

times 510-($-$$) db 0	    ;Writes zeroes to the first 512 bytes of sector.
dw  0xAA55		    ;Flags sector as bootable.
