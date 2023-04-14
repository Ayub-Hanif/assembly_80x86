.586
.MODEL FLAT

INCLUDE io.h    ; header file for input/output

.STACK 4096

.DATA
my_array DWORD 10 DUP (?) 
maxVal DWORD ?

bigger   BYTE 11 DUP (?),0
prompt BYTE "Enter the number ", 0
string BYTE 40 DUP (?)
resultLbl BYTE  "The largest number is", 0


.CODE
_MainProc PROC

mov ecx, 10
lea esi, my_array


loop_start:
        push ecx
        input prompt, string, 40
        atod  string
        mov [esi], eax
        pop ecx
        inc esi
        loop loop_start

        ; Find the maximum value in the array
        mov eax, my_array
        mov ebx, [eax]
        mov ecx, 9

my_max:

     add eax, 4
     mov edx, [eax]
     cmp edx, ebx
     jle notGreater
     mov ebx, edx

notGreater:
        loop my_max

         ; Output the maximum value
        mov maxVal, ebx
        dtoa maxVAl, ebx ;gives me wrong answer, IDK what is wrong here 
        output resultLbl, maxVal
        
mov     eax, 0                   ; exit with return code 0
ret
_MainProc ENDP
END                              ; end of source code