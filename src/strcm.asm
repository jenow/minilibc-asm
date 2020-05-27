    bits 64
    global strcm:function
    section .text

strcm:
    push rbp
    mov rbp, rsp


    xor rcx, rcx
    cmp rdi, 0
    je .second_arg
    jmp .loop


    .loop:
    mov ah, byte[rdi + rcx]
    mov al, byte[rsi + rcx]
    cmp ah, al
    jne .res
    inc rcx
    jmp .loop


    .res:
    movsx rdx, ah
    mov byte[r8 + 0], al
    sub rdx, r8
    mov rax, rdx
    jmp .return

    .second_arg:
    cmp rsi, 0
    je .res_if_null

    .res_if_null:
    mov rax, rcx
    jmp .return

    .return:
    mov rsp, rbp
    pop rbp
        ret
