section .data
	source_code: db "section .data%2$c%3$csource_code: db %4$c%1$s%4$c, 0%2$c%3$ckid_name: db %4$cGrace_kid.s%4$c, 0%2$c%3$ckid_mode: db %4$cw%4$c, 0%2$c%3$cfptr dq 0%2$c%2$csection .text%2$c%3$cglobal main%2$c%2$c%3$cextern fprintf%2$c%3$cextern fopen%2$c%3$cextern fclose%2$c%2$cmain:%2$c%3$ccall grace%2$c%2$c%3$cmov eax, 0x0%2$c%3$cret%2$c%2$cgrace:%2$c%3$cmov rdi, kid_name%2$c%3$cmov rsi, kid_mode%2$c%3$ccall fopen%2$c%2$c%3$cmov [fptr], rax%2$c%2$c%3$cmov rdi, [fptr]%2$c%3$cmov rsi, source_code%2$c%3$cmov rdx, source_code%2$c%3$cmov rcx, 0x0A%2$c%3$cmov r8, 0x09%2$c%3$cmov r9, 0x22%2$c%3$ccall fprintf%2$c%2$c%3$cmov rdi, [fptr]%2$c%3$ccall fclose", 0
	kid_name: db "Grace_kid.s", 0
	kid_mode: db "w", 0
	fptr dq 0

section .text
	global main

	extern fprintf
	extern fopen
	extern fclose

main:
	call grace

	mov eax, 0x0
	ret

grace:
	mov rdi, kid_name
	mov rsi, kid_mode
	call fopen

	mov [fptr], rax

	mov rdi, [fptr]
	mov rsi, source_code
	mov rdx, source_code
	mov rcx, 0x0A
	mov r8, 0x09
	mov r9, 0x22
	call fprintf

	mov rdi, [fptr]
	call fclose