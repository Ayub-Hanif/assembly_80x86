
;
; Name      : Mohammad Ayub Hanif Saleh
; class     : CISP 310
; H.W       : Assingment #4-C
; Professor : Al juboori
; Date      : 3/03/2023
; Program   : 8086 assembly program to will take in basic information 
;             from a user to input how many cookies they actually ate
;             and then reports how many total calories were consumed.
;

.586
.MODEL FLAT

INCLUDE io.h    ; header file for input/output

.STACK 4096
.DATA
house DWORD ?
phone DWORD ?
cable DWORD ?
prompt BYTE    "Enter the house rent per month", 0
prompt2 BYTE    "Enter the phone's bill per month", 0
prompt3 BYTE    "Enter the cable's bill per month", 0
string  BYTE    40 DUP (?)
resultLbl BYTE  "Your total monthly bill will be", 0
resultLbl2 BYTE  "Your total yearly bill will be", 0
monthly     BYTE    11 DUP (?), 0
yearly     BYTE    11 DUP (?), 0

.CODE
_MainProc PROC

input   prompt, string, 40    ; read ASCII characters
atod    string                ; convert to integer, and store in EAX register
mov house, eax                ; store in EBX register

input   prompt2, string, 40   ; read ASCII characters
atod    string                ; convert to integer, and store in EAX register
mov  phone, eax

input   prompt3, string, 40   ; read ASCII characters
atod    string                ; convert to integer, and store in EAX register



add eax, house                      ; divide the value in EAX by EDX
add eax, phone                      ; divide the value in EAX by EDX

dtoa monthly, eax                 ; convert to ASCII characters and store in mpg variable

imul eax, 12

dtoa yearly, eax

output  resultLbl, monthly ; output label and mpg
output  resultLbl2,yearly

mov     eax, 0  ; exit with return code 0
ret
_MainProc ENDP
END                             ; end of source code