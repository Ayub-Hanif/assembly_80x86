;
; Name      : Mohammad Ayub Hanif Saleh
; class     : CISP 310
; H.W       : Assingment #7
; Professor : Al juboori
; Date      : 3/25/2023
; Program   : 8086 assembly program that create a calculator that repeatedly takes a
;             basic math operator such as (+, -, *, /), and two numbers all from user
;             input, and then it print the result of the mathematical operation.
;             The mathematical operations is wrapped inside of procedures.
;

.586
.MODEL FLAT

INCLUDE io.h    ; header file for input/output

.STACK 4096

.DATA

num_1 DWORD ?
num_2 DWORD ?
sum   BYTE 11 DUP (?),0
prompt BYTE "Enter the mathmatical operator (+, -, *, /)", 0
prompt2 BYTE "Enter the first number please", 0
prompt3 BYTE "Enter the second number please", 0
string BYTE 40 DUP (?)
resultLbl BYTE  "The result for the calculation is", 0


.CODE
_MainProc PROC

startLoop:
       input   prompt, string, 2

       cmp   string, '+'
       je    my_add

       cmp   string, '-'
       je    my_sub

       cmp   string, '*'
       je    my_mul

       cmp   string, '/'
       je    my_div

       cmp   string, 'e'
       je    endLoop

       jmp startLoop

my_add:
   input     prompt2, string, 40
   atod      string
   mov       num_1, eax
             
   input     prompt3, string, 40
   atod      string
   mov       num_2, eax
  
   mov eax,  num_1
   mov ebx,  num_2
   add eax,  ebx
   dtoa sum, eax

   jmp       out_put


my_sub:
   input     prompt2, string, 40
   atod      string
   mov       num_1, eax
             
   input     prompt3, string, 40
   atod      string
   mov       num_2, eax
  
   mov eax,  num_1
   mov ebx,  num_2
   sub eax,  ebx
   dtoa sum, eax

   jmp       out_put

my_mul:
   input     prompt2, string, 40
   atod      string
   mov       num_1, eax
             
   input     prompt3, string, 40
   atod      string
   mov       num_2, eax
  
   mov eax,  num_1
   mov ebx,  num_2
   mul ebx
   dtoa sum, eax

   jmp       out_put

my_div:
   input     prompt2, string, 40
   atod      string
   mov       num_1, eax
             
   input     prompt3, string, 40
   atod      string
   mov       num_2, eax
  
   mov ebx,  num_1
   mov eax,  num_2
   idiv ebx
   dtoa sum, eax

   jmp       out_put

out_put:
   output    resultLbl, sum

   jmp       startLoop

endLoop:
mov     eax, 0                   ; exit with return code 0
ret
_MainProc ENDP
END                              ; end of source code