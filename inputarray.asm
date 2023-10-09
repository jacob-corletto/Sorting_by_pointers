;===========================License========================================================================
;Program name = "Sort by Pointers". This program will take in an array and store them in malloc. The program will then sort the array of pointers by value.
;Copyright (C) 2023 Jacob Corletto
;
;This file is part of the software program "Sort by Pointers"
;"Sort by Pointers" is free software: you can redistribute it and/or modify it under the terms of the GNU General Public
;License version 3 as published by the Free Software Foundation.
;This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY.
;warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
;A copy of the GNU General Public License v3 has been distributed with this software. If not found it is available here: 
;<https://www.gnu.org/licenses/>. The copyright holder may be contracted here: jacob.corletto@csu.fullerton.edu
;==========================================================================================================
;===========================Declarations===================================================================
;bring external functions
extern      printf
extern      scanf
extern      malloc

;initialize function
global      input_array

;===========================Prompts========================================================================
segment .data                 
eight_byte_format db "%lf", 0

integer_format db "%ld",0

floatform   db "%lf", 0

;===========================variable declarations==========================================================
segment .bss
;backup resb 832

;===========================Code start=====================================================================
segment .text
input_array:

;16 pushes
push        rbp                        
mov         rbp, rsp
push        rbx
push        rcx
push        rdx
push        rsi
push        rdi
push        r8
push        r9
push        r10
push        r11
push        r12
push        r13
push        r14
push        r15

pushf

;backup the memory
;mov         rax,7
;mov         rdx,0
;xsave       [backup]  

;set counter 
mov         r14, rdi                       ;rdi is the array
mov         r15, rsi                       ;max limit
mov         r13, 0                         ;counter

;loop in the array
begin: 
    cmp    r13,r15
    jge loop_finished

    ;create storage for one new number
    mov         rax, 0
    mov         rdi, 8
    call        malloc
    mov         r12, rax

    ;get number from user & save in r12
    mov         rax, 0
    mov         rdi, floatform
    mov         rsi, r12
    call        scanf

    ;check for -1
    cdqe 
    cmp         rax,-1
    je          loop_finished

    ;move r12 into the space in malloc
    mov         [r14+r13*8],r12
    inc         r13
    jmp         begin

loop_finished:
    
    ;restore memory and return count
    ;mov         rax, 7
    ;mov         rdx, 0
    ;xrstor      [backup]
    mov         rax, r13

;16 pops
popf                                    ;Restore rflags
pop         r15                         ;Restore r15
pop         r14                         ;Restore r14
pop         r13                         ;Restore r13
pop         r12                         ;Restore r12
pop         r11                         ;Restore r11
pop         r10                         ;Restore r10
pop         r9                          ;Restore r9
pop         r8                          ;Restore r8
pop         rdi                         ;Restore rdi
pop         rsi                         ;Restore rsi
pop         rdx                         ;Restore rdx
pop         rcx                         ;Restore rcx
pop         rbx                         ;Restore rbx
pop         rbp                         ;Restore rbp

ret