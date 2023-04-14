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

first DWORD ?
second DWORD ?
total DWORD ?
array DWORD 1000 DUP (?)
prompt BYTE "Enter number of array elements: ", 0
prompt2 BYTE "Enter the an integer 'n': ", 0
enter_num  BYTE "Enter the number: ", 0
string BYTE 40 DUP (?)
resultLbl BYTE  "this Number is larger than 'n': ", 0


.CODE
_MainProc PROC

       mov ecx, 10
       mov eax, 0
       call my_sub

       dtoa total, eax
       output resultLbl, total 

my_sub PROC
       forCount: add eax, ecx
       loop forCount
       mov total, eax
       ret
my_sub ENDP


     mov     eax, 0                   ; exit with return code 0
     ret

_MainProc ENDP
END                              ; end of source code