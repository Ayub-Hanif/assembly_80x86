;
; Name      : Mohammad Ayub Hanif Saleh
; class     : CISP 310
; H.W       : Assingment #8
; Professor : Al juboori
; Date      : 4/9/2023
; Program   : 8086 assembly program that create program that defines an array
;             of doubleword numbers then reads two values, first one indicates
;             how many actual numbers will be in the array, and an integer n.
;             The program displays all of the numbers in the array that are
;             greater than the number n.
;

.586
.MODEL FLAT

INCLUDE io.h    ; header file for input/output

.STACK 4096

.DATA

element DWORD ?
count DWORD ?
min_num DWORD ?
num_1 DWORD ?
array DWORD 1000 DUP (?)
prompt BYTE "Enter number of array elements: ", 0
prompt2 BYTE "Enter the an integer 'n': ", 0
enter_num  BYTE "Enter the number: ", 0
string BYTE 40 DUP (?)
resultLbl BYTE  "this Number is larger than 'n': ", 0


.CODE
_MainProc PROC

       input   prompt, string, 40
       atod    string
       mov     element, eax

       input   prompt2, string, 40
       atod    string
       mov     min_num, eax

       lea     ebx, array
       mov     ecx, 0

start_loop:
       input   enter_num, string, 40
       atod    string
       cmp     eax, min_num
       jg      bigger

       jmp     end_loop

bigger:
   mov   [ebx], eax
   add   ebx, 10
   inc   count

end_loop:
   inc   ecx
   cmp   ecx, element
   jne   start_loop

   lea   ebx, array
   mov   ecx, count
   jmp   showing

showing:
   
   mov   eax, [ebx]
   dtoa  num_1, eax
   output resultLbl, num_1

   add    ebx, 10

   loop  showing

     mov     eax, 0                   ; exit with return code 0
     ret

_MainProc ENDP
END                              ; end of source code