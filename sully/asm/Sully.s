section .data
	i db 5

	source_code db '', 0
	reference_sully db 'Sully_5.s', 0
	file_name db 'Sully_', 0
	extension db '.s', 0
	file_open_mode db 'w', 0
	fptr dd 0

section .bss
	file_path resb 16
	input resb 4096
	compile_cmd resb 128
	exec_cmd resb 128

section .text
	global main

	extern access

	extern fopen
	extern fclose

	extern strcat
	extern system

main:
	mov rax, 0
	mov rdi, reference_sully
	mov rsi, 0x00
	call access

	cmp rax, 0
	jne .init
	dec WORD [i]

.init:
	cmp WORD [i], 0
	jl .end

.core:
	mov rdi, file_path
	mov rsi, file_name
	call strcat

	movzx rdi, BYTE[i]
	add rdi, '0'
	mov [file_path+6], rdi

	mov rdi, file_path
	mov rsi, extension
	call strcat

	mov rdi, file_path
	mov rsi, file_open_mode	
	call fopen

	cmp rax, 0
	je .open_failed

	mov [fptr], rax

	; load source code
	; sprintf
	; fprintf

	mov rdi, [fptr]
	call fclose

	; exec compile cmd

	cmp WORD [i], 0
	jna .end

	; exec cmd

	jmp .end

.open_failed:
	mov rax, 0x1
	ret

.end:
	mov rax, 0x0
	ret