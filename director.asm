;Declarations
number_of_cells EQU 8 ;this was changed from 5 ==> 8

extern printf                                               
extern scanf
extern malloc
extern input_array
extern output_array
extern sort_array
extern sortasm

global director

segment .data
intro db "This program will sort all of your doubles",10,0

input_numbers db "Please enter floating point numbers seperated by whitespave. After the last numeric input enter at lease one more qhitespave and press cntl+d",10,0

;to inputarray.asm

show_numbers db "Thank you. You entered these numbers",10,0

;to outputarray.cpp

end_of_array db "End of output of array",10,0

data_is_sorted db "The array is being sorted without moving any numbers",10,0

;sortpointers

;outputarray.cpp

;end_of_array

sent_back_to_caller db "The array will be sent back to the caller function",10,0

eight_byte_format db "%lf",0

stringformat db "%s",0

segment .bss
align 64
backup resb 832
array resq number_of_cells
returnarray resq 2

segment .text
director:


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

;mov rax,7
;mov rdx,0
;xsave [backup]           

mov rax, 0
mov rdi, stringformat
mov rsi, intro
call printf

mov rax, 0
mov rdi, stringformat
mov rsi, input_numbers
call printf

;go to input numbers
mov rax, 0
mov rdi, array
mov rsi, number_of_cells
call input_array
mov r13,rax

;output array
mov rax, 0
mov rdi, array
mov rsi, r13
call output_array

mov rax, 0
mov rdi, stringformat
mov rsi, end_of_array
call printf

mov rax, 0
mov rdi, stringformat
mov rsi, data_is_sorted
call printf

;sort array
mov rax, 0
mov rdi, array
mov rsi, r13
call sort_array
;mov r13,rax

;output array
mov rax, 0
mov rdi, array
mov rsi, r13
call output_array

mov rax, 0
mov rdi, stringformat
mov rsi, end_of_array
call printf

mov rax, 0
mov rdi, stringformat
mov rsi, sent_back_to_caller
call printf

mov [returnarray + 0*8], r13
mov r11, array
mov [returnarray + 1*8], r11

;mov rax, 7
;mov rdx, 0
;xrstor xmm0, [rsp]

mov rax, returnarray
;movsd xmm0, [returnarray]
;movsd xmm1, [returnarray+8]

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