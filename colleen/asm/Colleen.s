; Second comment out of main()
section .data
	source_code: db "; Second comment out of main()%2$csection .data%2$c%3$csource_code: db %4$c%1$s%4$c, 0x0%2$c%2$csection .text%2$c%3$cglobal main%2$c%2$c%3$cextern printf%2$c%2$cmain:%2$c%3$c; First comment in main()%2$c%3$ccall colleen%2$c%2$c%3$cmov eax, 0x0%2$c%3$cret%2$c%2$ccolleen:%2$c%3$cmov rdi, source_code%2$c%3$cmov rsi, source_code%2$c%3$cmov rdx, 0x0A%2$c%3$cmov rcx, 0x09%2$c%3$cmov r8, 0x22%2$c%2$c%3$ccall printf", 0x0

section .text
	global main

	extern printf

main:
	; First comment in main()
	call colleen

	mov eax, 0x0
	ret

colleen:
	mov rdi, source_code
	mov rsi, source_code
	mov rdx, 0x0A
	mov rcx, 0x09
	mov r8, 0x22

	call printf