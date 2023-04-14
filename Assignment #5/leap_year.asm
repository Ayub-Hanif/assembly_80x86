
;
; Name      : Mohammad Ayub Hanif Saleh
; class     : CISP 310
; H.W       : Assingment #5
; Professor : Al juboori
; Date      : 3/12/2023
; Program   : 8086 assembly program to will take in basic information 
;             from a student gives output asking the user to enter a year.
;             Then tells if that year is a leap year or not.
;

.586
.MODEL FLAT

INCLUDE io.h    ; header file for input/output

.STACK 4096
.DATA
year DWORD 0
prompt BYTE    "Enter a year", 0
string  BYTE    40 DUP (?)
resultLbl BYTE  "Output", 0

day_28 BYTE "This year is not a leap year",0
day_29 BYTE "This year is a leap year",0


.CODE
_MainProc PROC

input   prompt, string, 40       ; read ASCII characters
atod    string                   ; convert to integer, and store in EAX register
mov year, eax


cdq

mov  ebx, 100
idiv ebx

cmp ebx,0
jne try_one

mov eax, year

cdq
mov ebx, 400
idiv ebx 

cmp edx,0

je  try_2

jmp try_3

try_one:
       mov eax, year
       cdq
       mov ebx, 4
       idiv ebx
       cmp edx, 0
       je try_2
       jmp try_3

try_2:
     output resultLbl, day_29
     jmp exit

try_3:
     output resultLbl, day_28
     jmp exit

exit:
mov     eax, 0                   ; exit with return code 0
ret
_MainProc ENDP
END                              ; end of source code