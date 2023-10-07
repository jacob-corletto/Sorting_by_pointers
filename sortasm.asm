
global sortasm

segment .data

segment .bss

segment .text
sortasm:

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

mov        r14, rdi ;rdi is the array
mov        r15, rsi ;max limit

;counters
mov r13, -1
mov r12, 0

begin1:
	inc r13
	cmp r13, r15
	jge done

	mov r12, 0
	jmp begin2

	begin2:
		mov r11, r15
		sub r11, r13
		cmp r11, r12
		jge begin1

		movsd xmm13, [r10]
		movsd xmm12, [r9]

		lea xmm13, [r14 + 8*r12]
		lea xmm12, [r14 + 16*r12]

		cmppd xmm13, xmm12

		jge swap

	swap:
		mov r8, r12
		sub r8, 1
		movsd xmm10, [r14 + 16*r8]
		movsd xmm9, [r14 + 8*r8],
		movsd xmm10, xmm13
		movsd xmm9, xmm12

		jmp begin2

done:
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



