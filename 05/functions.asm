;This file will contain a library of common functions necessary for the project.

;This subroutine will print with a linefeed at the end.
printlf:
    pusha               ;Push all GP registers to the stack.

start:
    mov al, [bx]        ;Get string address.
    cmp al, 0
    je linefeed            ;If empty (== 0) jump to completion.

    mov ah, 0x0E        ;Enter teletype (TTY) mode.
    int 0x10

    add bx, 1           ;Increment pointer
    jmp start


linefeed:

    mov ah, 0x0E
    mov al, 0x0A        ;Newline (\n) character.
    int 0x10
    mov al, 0x0D        ;Carriage Return (\r) character.
    int 0x10

    popa
    ret

;Call this is if you manually wish to linefeed without printing specfics.
manualfeed:

    pusha
    jmp linefeed

