; Comment
%define MAIN		main:
%define NIL			0
%define ENTRYPOINT	global main
section .data
	source_code: db "; Comment%2$c%%define MAIN%3$c%3$cmain:%2$c%%define NIL%3$c%3$c%3$c0%2$c%%define ENTRYPOINT%3$cglobal main%2$csection .data%2$c%3$csource_code: db %4$c%1$s%4$c, 0%2$c%3$ckid_name: db %4$cGrace_kid.s%4$c, 0%2$c%3$ckid_mode: db %4$cw%4$c, 0%2$c%3$cfptr dd NIL%2$c%2$csection .text%2$c%3$cENTRYPOINT%2$c%2$c%3$cextern fprintf%2$c%3$cextern fopen%2$c%3$cextern fclose%2$c%2$cMAIN%2$c%3$cpush rbx%2$c%2$c%3$cmov rdi, kid_name%2$c%3$cmov rsi, kid_mode%2$c%3$ccall fopen%2$c%2$c%3$cmov [fptr], rax%2$c%2$c%3$cmov rdi, [fptr]%2$c%3$cmov rsi, source_code%2$c%3$cmov rdx, source_code%2$c%3$cmov rcx, 0x0A%2$c%3$cmov r8, 0x09%2$c%3$cmov r9, 0x22%2$c%3$ccall fprintf%2$c%2$c%3$cmov rdi, [fptr]%2$c%3$ccall fclose%2$c%2$c%3$cmov eax, 0x0%2$c%3$cret", 0
	kid_name: db "Grace_kid.s", 0
	kid_mode: db "w", 0
	fptr dd NIL

section .text
	ENTRYPOINT

	extern fprintf
	extern fopen
	extern fclose

MAIN
	push rbx

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

	mov eax, 0x0
	ret