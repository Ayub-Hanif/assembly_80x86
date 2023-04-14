;
; Name      : Mohammad Ayub Hanif Saleh
; class     : CISP 310
; H.W       : Assingment #8
; Professor : Al juboori
; Date      : 4/9/2023
; Program   : 8086 assembly program that create program that accepts up to 10
;             integer test scores in the range of 0 to 100 from the user and
;             stores them in an array of words. Then the program reports
;             how many perfect scores were entered (i.e., scores of 100).
;

.586
.MODEL FLAT

INCLUDE io.h    ; header file for input/output

.STACK 4096

.DATA

num_1 DWORD ?
count DWORD ?
array DWORD 10 DUP (?)
prompt BYTE "Enter your test score: ", 0
string BYTE 40 DUP (?)
sum    BYTE 11 DUP (?), 0
wrongInput BYTE "Enter number only from 0-100", 0
resultLbl BYTE  "The total perfect scores:", 0


.CODE
_MainProc PROC

    mov ecx, 0    ; set the counter to 0
    lea esi, array
    jmp start_loop

wrong_number:
    output  wrongInput, wrongInput

start_loop:
       input   prompt, string, 40
       atod    string
       mov     num_1, eax


       jmp check

check:
   cmp    num_1, 100
   je     good_number

   cmp    num_1, 0
   jl     wrong_number

   cmp    num_1, 100
   jg     wrong_number

   jmp    counter


good_number:
   inc   count
   jmp   counter

counter:
   mov   esi, num_1
   add   esi, 2
   jmp   end_loop

end_loop:
   inc   ecx
   cmp   ecx, 10
   jne   start_loop
   jmp   end_program

end_program:
   mov   eax, count
   dtoa  count, eax
   output resultLbl, count

mov     eax, 0                   ; exit with return code 0
ret
_MainProc ENDP
END                              ; end of source code