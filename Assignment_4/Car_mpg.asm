;
; Name      : Mohammad Ayub Hanif Saleh
; class     : CISP 310
; H.W       : Assingment #4-A
; Professor : Al juboori
; Date      : 3/03/2023
; Program   : 8086 assembly program to will take in basic information 
;             from a user to enter the number of gallons of gas the 
;             car can hold and the number of miles it can be 
;             driven on a full tank. Then it calculates and display
;             the number of miles per gallon the car gets.
;


.586
.MODEL FLAT

INCLUDE io.h    ; header file for input/output

.STACK 4096
.DATA
miles DWORD ?
gals DWORD ?
prompt BYTE    "Enter the number of gallons of gas the car can hold", 0
prompt2 BYTE    "Enter the miles the car can be driven on a full tank", 0
string  BYTE    5 DUP (?)
resultLbl BYTE  "The number of miles per gallon the car gets is", 0
mpg     BYTE    5 DUP (?), 0

.CODE
_MainProc PROC

input   prompt, string, 40    ; read ASCII characters
atod    string                ; convert to integer, and store in EAX register
mov gals, eax                ; store in EBX register

input   prompt2, string, 40   ; read ASCII characters
atod    string                ; convert to integer, and store in EAX register
mov  miles, eax

cdq

mov eax, gals
mov ebx, miles


idiv ebx                      ; divide the value in EAX by EDX

dtoa mpg, eax                 ; convert to ASCII characters and store in mpg variable

output  resultLbl, mpg ; output label and mpg

mov     eax, 0  ; exit with return code 0
ret
_MainProc ENDP
END                             ; end of source code