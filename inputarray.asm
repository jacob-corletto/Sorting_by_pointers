extern printf
extern scanf
extern malloc

global input_array

segment .data                 
eight_byte_format db "%lf", 0

integer_format db "%ld",0

floatform db "%lf", 0

segment .bss
;align 16

segment .text
input_array:

push rbp                        
mov  rbp, rsp
push rbx
push rcx
push rdx
push rsi
push rdi
push r8
push r9
push r10
push r11
push r12
push r13
push r14
push r15

pushf

;xsave

mov        r14, rdi ;rdi is the array
mov        r15, rsi ;max limit
mov r13, 0 ;counter

;loop in the array
begin: 
    cmp r13,r15
    jge loop_finished

    ;create storage for one new number
    mov rax, 0
    mov rdi, 8
    call malloc
    mov r12, rax

    ;get number from user
    mov rax, 0
    mov rdi, integer_format
    mov rsi, r12
    call scanf

    ;check for -1
    cdqe 
    cmp rax,-1
    je loop_finished

    ;move r12 into the spave in malloc
    mov [r14+r13*8],r12
    inc r13
    jmp begin

loop_finished:
    
    ;mov rax, 7
    ;mov rdx, 0
    ;xrstor[backup]
    mov rax, r13

popf  ;Restore rflags
pop r15                                 ;Restore r15
pop r14                                 ;Restore r14
pop r13                                 ;Restore r13
pop r12                                 ;Restore r12
pop r11                                 ;Restore r11
pop r10                                 ;Restore r10
pop r9                                  ;Restore r9
pop r8                                  ;Restore r8
pop rdi                                 ;Restore rdi
pop rsi                                 ;Restore rsi
pop rdx                                 ;Restore rdx
pop rcx                                 ;Restore rcx
pop rbx                                 ;Restore rbx
pop rbp                                 ;Restore rbp

ret