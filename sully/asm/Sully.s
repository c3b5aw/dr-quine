section .data
    i db 5

    source_code db "section .data%3$c    i db %2$d%3$c%3$c    source_code db %4$c%1$s%4$c, 0%3$c    reference_sully db %4$cSully_5.s%4$c, 0%3$c    extension db %4$c.s%4$c, 0%3$c    file_name db %4$cSully_%4$c, 0%3$c    file_open_mode db %4$cw%4$c, 0%3$c    fwrite_mode db %4$c%%s%4$c, 0%3$c%3$c    compile_command db %4$cnasm -f elf64 Sully_%%1$d.s -o Sully_%%1$d.o && cc -no-pie -Wall -Wextra -Werror Sully_%%1$d.o -o Sully_%%1$d%4$c, 0%3$c    exec_command db %4$c./Sully_%%1$d%4$c, 0%3$c    fptr dd 0%3$c%3$csection .bss%3$c    file_path resb 16%3$c    input resb 4096%3$c    compile_cmd resb 128%3$c    exec_cmd resb 128%3$c%3$csection .text%3$c    global main%3$c%3$c    extern access%3$c%3$c    extern sprintf%3$c    extern fprintf%3$c%3$c    extern fopen%3$c    extern fclose%3$c%3$c    extern strcat%3$c    extern system%3$c%3$cmain:%3$c    mov rax, 0%3$c    mov rdi, reference_sully%3$c    mov rsi, 0x00%3$c    call access%3$c%3$c    cmp rax, 0%3$c    jne .init%3$c    dec WORD [i]%3$c%3$c.init:%3$c    cmp WORD [i], 0%3$c    jl .end%3$c%3$c.core:%3$c    push rbx%3$c%3$c    mov rdi, file_path%3$c    mov rsi, file_name%3$c    call strcat%3$c%3$c    movzx rdi, BYTE[i]%3$c    add rdi, '0'%3$c    mov [file_path+6], rdi%3$c%3$c    mov rdi, file_path%3$c    mov rsi, extension%3$c    call strcat%3$c%3$c    mov rdi, file_path%3$c    mov rsi, file_open_mode%3$c    call fopen%3$c%3$c    cmp rax, 0%3$c    je .open_failed%3$c%3$c    mov [fptr], rax%3$c%3$c    mov rdi, input%3$c    mov rsi, source_code%3$c    mov rdx, source_code%3$c    movzx rcx, BYTE[i]%3$c    mov r8, 0x0A%3$c    mov r9, 0x22%3$c    call sprintf%3$c%3$c    mov rdi, [fptr]%3$c    mov rsi, fwrite_mode%3$c    mov rdx, input%3$c    call fprintf%3$c%3$c    mov rdi, [fptr]%3$c    call fclose%3$c%3$c    mov rdi, compile_cmd%3$c    mov rsi, compile_command%3$c    movzx rdx, BYTE[i]%3$c    call sprintf%3$c%3$c    mov rdi, compile_cmd%3$c    call system%3$c%3$c    cmp WORD [i], 0%3$c    jna .end%3$c%3$c    mov rdi, exec_cmd%3$c    mov rsi, exec_command%3$c    movzx rdx, BYTE[i]%3$c    call sprintf%3$c%3$c    mov rdi, exec_cmd%3$c    call system%3$c%3$c    jmp .end%3$c%3$c.open_failed:%3$c    mov rax, 0x1%3$c    ret%3$c%3$c.end:%3$c    mov rax, 0x0%3$c    ret", 0
    reference_sully db "Sully_5.s", 0
    extension db ".s", 0
    file_name db "Sully_", 0
    file_open_mode db "w", 0
    fwrite_mode db "%s", 0

    compile_command db "nasm -f elf64 Sully_%1$d.s -o Sully_%1$d.o && cc -no-pie -Wall -Wextra -Werror Sully_%1$d.o -o Sully_%1$d", 0
    exec_command db "./Sully_%1$d", 0
    fptr dd 0

section .bss
    file_path resb 16
    input resb 4096
    compile_cmd resb 128
    exec_cmd resb 128

section .text
    global main

    extern access

    extern sprintf
    extern fprintf

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
    push rbx

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

    mov rdi, input
    mov rsi, source_code
    mov rdx, source_code
    movzx rcx, BYTE[i]
    mov r8, 0x0A
    mov r9, 0x22
    call sprintf

    mov rdi, [fptr]
    mov rsi, fwrite_mode
    mov rdx, input
    call fprintf
    mov rdi, [fptr]
    call fclose

    mov rdi, compile_cmd
    mov rsi, compile_command
    movzx rdx, BYTE[i]
    call sprintf

    mov rdi, compile_cmd
    call system

    cmp WORD [i], 0
    jna .end

    mov rdi, exec_cmd
    mov rsi, exec_command
    movzx rdx, BYTE[i]
    call sprintf

    mov rdi, exec_cmd
    call system

    jmp .end

.open_failed:
    mov rax, 0x1
    ret

.end:
    mov rax, 0x0
    ret