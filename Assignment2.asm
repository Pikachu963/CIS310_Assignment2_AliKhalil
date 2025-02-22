; Myname: Ali Khalil
; date: 2/22/25

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
include irvine32.inc

.data
str1 Byte "Ali Khalil", 0ah
nameSize = ($ - str1) - 1

.code
main PROC
    mov edx, offset str1
    call writestring
    mov ecx,nameSize
    mov esi,0

L1: movzx eax,str1[esi]
    push eax
    inc esi
    loop L1

    mov ecx,nameSize
    mov esi,0

L2: pop eax
    mov str1[esi],al
    inc esi
    loop L2

    mov eax, offset str1
    call writestring
    INVOKE ExitProcess, 0
main ENDP
END main