
;
; Name      : Mohammad Ayub Hanif Saleh
; class     : CISP 310
; H.W       : Assingment #6
; Professor : Al juboori
; Date      : 3/12/2023
; Program   : 8086 assembly program with already given basic information 
;             that uses loop to display the number of calories burned 
;             after 5, 10, 15, 20, 25, and 30 minutes. given that a person
;             running on a particular treadmill, burn 4 calories per minute.
;

.586
.MODEL FLAT

INCLUDE io.h    ; header file for input/output

.STACK 4096
.DATA
burn DWORD 0
mins DWORD 5
counter DWORD 6
string  BYTE    40 DUP (?)
resultLbl BYTE  "you have lost the following amount of cals", 0


.CODE
_MainProc PROC

forcount:
       mov eax, mins
       imul eax, 4 
       dtoa string, eax
       output resultLbl ,string
       add mins, 5
       sub counter, 1
       mov eax, counter
       cmp eax, 0
       jne forcount

exit:
mov     eax, 0                   ; exit with return code 0
ret
_MainProc ENDP
END                              ; end of source code