.586
.MODEL FLAT

INCLUDE io.h    ; header file for input/output

.STACK 4096

.DATA
    num1Str BYTE 20 DUP (?)
    num2Str BYTE 20 DUP (?)
    prompt1 BYTE "Enter the first number: ", 0
    prompt2 BYTE "Enter the second number: ", 0
    outputStr BYTE "After swapping the numbers are: ", 0
    num1 DWORD ?
    num2 DWORD ?

.CODE
_MainProc PROC
    ; Read the first number
    input prompt1, num1Str, 20
    atod num1Str
    mov num1, eax

    ; Read the second number
    input prompt2, num2Str, 20
    atod num2Str
    mov num2, eax

    ; Swap the numbers
    mov eax, num1
    mov ebx, num2
    mov num1, ebx
    mov num2, eax
    dtoa num2, eax
    dtoa num1, ebx
    ; Output the swapped numbers
    output outputStr, num1

    ; Exit the program
    mov eax, 0
    ret
_MainProc ENDP
END