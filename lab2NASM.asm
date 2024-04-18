section .bss
    sum resb 1
    buffer resb 5

section .text
    global _start

_start:
    mov rsi, 14
    call calculateMatches ; результат функции вернулся в rax
    mov rax, 1 ; Системный вызов для write
    mov rdi, 1 ; дескриптор файла (stdout)
    mov rsi, buffer ; адрес буфера для вывода
    mov rdx, 10 ; длина буфера
    syscall

    xor rdi, rdi
    mov rax, 60
    syscall

calculateMatches:
    push rbp
    mov rbp, rsp

calculateLoop:
    cmp rsi, 1
    jle endCalculateLoop

    mov rax, rsi
    mov rcx, rax
    shr rax, 1 ; целочисленное деление на 2
    add qword [rbp], rax

    mov rax, rcx
    test rax, 1
    jnz oddCase

    mov rsi, rcx
    shr rsi, 1
    jmp calculateLoop

oddCase:
    inc rcx
    mov rsi, rcx
    shr rsi, 1 ; целочисленное деление на 2
    jmp calculateLoop

endCalculateLoop:
    mov rax, qword [rbp]
    pop rbp

int_to_string:
    mov rcx, 10 ; база системы счисления
    mov rdi, buffer + 4 ; указатель на конец буфера
    mov byte [rdi], 0 ; завершающий символ

convert_loop:
    xor rdx, rdx ; очищаем rdx для деления
    div rcx ; делим eax на 10
    add dl, '0' ; преобразуем остаток в символ
    dec rdi ; перемещаем указатель на предыдущую позицию
    mov [rdi], dl ; сохраняем символ в буфер
    test rax, rax ; проверяем, что делимое не равно 0
    jnz convert_loop ; если не равно 0, продолжаем конвертацию

ret