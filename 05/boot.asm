;This code will be used to test out TTY printing functionality when running in
;real-address mode using BIOS interrupts.

;ADDED: Added print to automatically linefeed.

;TODO: Rework function library from scratch to use my own personal implementations.

[org 0x7C00]

mov bx, MSG1                                ;Move MSG1 to bx register for printing.
call printlf                                ;Function contained in functions.asm
                                            ;Call print w/ line-feed function.

mov bx, MSG2
call printlf

call manualfeed


jmp $

%include "functions.asm"

;Data Portion for Variables
MSG1:
    db  'This is Message 1', 0h             ;Zero is used to null terminate.

MSG2:
    db  'This is Message 2', 0h

times       510-($-$$)  db  0
dw  0xAA55

