bits 64
global memcpy:function
section .text

memcpy:
  push rbp
  mov rbp, rsp

  xor rcx, rcx
  cmp rdi, 0
  je .end
  cmp rsi, 0
  je .end

  .loop:
    cmp rcx, rdx
    je .end
    mov al, byte[rsi + rcx]
    mov byte[rdi + rcx], al
    inc rcx
    jmp .loop
  
  .end:
    mov rax, rdi

  mov rsp, rbp
  pop rbp

  ret