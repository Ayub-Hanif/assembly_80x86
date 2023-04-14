;
; Name      : Mohammad Ayub Hanif Saleh
; class     : CISP 310
; H.W       : Assingment #4-B
; Professor : Al juboori
; Date      : 3/03/2023
; Program   : 8086 assembly program to will take in basic information 
;             that asks the user to enter their monthly costs for each
;             of the following housing-related expenses: rent, phones,
;             and cable. Then The program displays the total monthly
;             cost of these expenses and annual cost of these expenses.
;

.586
.MODEL FLAT

INCLUDE io.h    ; header file for input/output

.STACK 4096
.DATA
servings DWORD 3
calories DWORD 240
prompt BYTE    "Enter how many cookies have you eaten", 0
string  BYTE    40 DUP (?)
resultLbl BYTE  "You have consumed the following amount of calories", 0
cal_eaten BYTE 11 DUP (?), 0

.CODE
_MainProc PROC

input   prompt, string, 40       ; read ASCII characters
atod    string                   ; convert to integer, and store in EAX register

imul eax, calories

cdq

mov ebx, servings

idiv ebx
dtoa cal_eaten, eax

output  resultLbl, cal_eaten     ; output label and mpg

mov     eax, 0                   ; exit with return code 0
ret
_MainProc ENDP
END                              ; end of source code