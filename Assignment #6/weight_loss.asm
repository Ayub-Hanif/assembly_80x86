
;
; Name      : Mohammad Ayub Hanif Saleh
; class     : CISP 310
; H.W       : Assingment #6
; Professor : Al juboori
; Date      : 3/12/2023
; Program   : 8086 assembly program to will take in basic information 
;             from a student gives output asking the users enter their
;             starting weight and then creates and displays a table
;             showing what their expected weight will be at the end
;             of each month for the next 6 months if they stay on
;             this diet.
;

.586
.MODEL FLAT

INCLUDE io.h    ; header file for input/output

.STACK 4096
.DATA
start DWORD 0
months DWORD 6
pounds_loss DWORD 4
prompt BYTE    "How much do you weight?", 0
string  BYTE    40 DUP (?)
resultLbl BYTE  "You have lost", 0


.CODE
_MainProc PROC

input   prompt, string, 40       ; read ASCII characters
atod    string                   ; convert to integer, and store in EAX register
mov start,eax 

forcount:
       sub start, 4
       mov eax, start
       dtoa string, eax
       output resultLbl ,string
       sub months, 1
       mov eax, months
       cmp eax, 0
       jne forcount


exit:
mov     eax, 0                   ; exit with return code 0
ret
_MainProc ENDP
END                              ; end of source code