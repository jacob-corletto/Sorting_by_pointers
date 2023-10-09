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
number_of_cells EQU 11 						;allocate max number of elements 

;Bring in external functions
extern printf                                               
extern scanf
extern malloc
extern input_array
extern output_array
extern sort_array
extern sortasm

;Declare main asm driver program
global director

;===========================Prompts========================================================================
segment .data
intro db "This program will sort all of your doubles",10,0

input_numbers db "Please enter floating point numbers seperated by whitespave. After the last numeric input enter at lease one more Whitespace and press cntl+d",10,0

show_numbers db "Thank you. You entered these numbers",10,0

end_of_array db "End of output of array",10,0

data_is_sorted db "The array is being sorted without moving any numbers",10,0

sent_back_to_caller db "The array will be sent back to the caller function",10,0

eight_byte_format db "%lf",0

stringformat db "%s",0

;===========================alocate arrays=================================================================
segment .bss
align 64
backup resb 832
array resq number_of_cells
returnarray resq 2

segment .text
;===========================Code start=====================================================================
director:

;16 pushes
push       rbp
mov        rbp, rsp
push	   rbx
push       rcx
push       rdx
push       rsi
push       rdi
push       r8
push       r9
push       r10
push       r11
push       r12
push	   r13 
push       r14
push	   r15 
pushf        

;Back up code
mov rax,7
mov rdx,0
xsave [backup]           

mov 		rax, 0
mov 		rdi, stringformat
mov 		rsi, intro								;"This program will sort all of your doubles"
call printf

mov 		rax, 0
mov 		rdi, stringformat
mov 		rsi, input_numbers						;"Please enter floating point numbers seperated by whitespave..
call printf

;go to input numbers
mov 		rax, 0
mov 		rdi, array
mov 		rsi, number_of_cells					;"Thank you. You entered these numbers"
call 		input_array
mov 		r13,rax

;output array
mov 		rax, 0
mov 		rdi, array
mov 		rsi, r13
call 		output_array

mov 		rax, 0
mov 		rdi, stringformat
mov 		rsi, end_of_array						;"The array is being sorted without moving any numbers"
call printf

mov 		ax, 0
mov 		rdi, stringformat
mov 		rsi, data_is_sorted
call 		printf

;sort array
mov 		rax, 0
mov 		rdi, array
mov 		rsi, r13
call 		sort_array

;output array
mov 		rax, 0
mov 		rdi, array
mov 		rsi, r13
call 		output_array

;finish array
mov 		rax, 0
mov 		rdi, stringformat
mov 		rsi, end_of_array						;"The array will be sent back to the caller function"
call printf

;===========================Send back to caller============================================================
mov 		rax, 0
mov 		rdi, stringformat
mov 		rsi, sent_back_to_caller				;"The array will be sent back to the caller function"
call printf

mov 		[returnarray + 0*8], r13
mov 		r11, array
mov 		[returnarray + 1*8], r11

;Return Code
mov 		rax, 7
mov 		rdx, 0
xrstor 		[backup]

mov rax, returnarray

;===========================16 pops========================================================================
popf                                                        
pop        r15                                              
pop        r14                                              
pop        r13                                              
pop        r12                                              
pop        r11                                              
pop        r10                                              
pop        r9                                               
pop        r8                                               
pop        rdi                                              
pop        rsi                                              
pop        rdx                                              
pop        rcx                                              
pop        rbx                                              
pop        rbp                                              


ret